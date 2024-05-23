local M = {}

local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local extras = require("luasnip.extras")
local l = extras.lambda
local rep = extras.rep
local p = extras.partial
local m = extras.match
local n = extras.nonempty
local dl = extras.dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local conds = require("luasnip.extras.expand_conditions")
local postfix = require("luasnip.extras.postfix").postfix
local types = require("luasnip.util.types")
local parse = require("luasnip.util.parser").parse_snippet
local ms = ls.multi_snippet

---------------------------------------------------------------------------
--Environment Detection
---------------------------------------------------------------------------

function M.in_mathmode()
	return vim.fn['vimtex#syntax#in_mathzone']() == 1
end

function M.not_in_mathmode()
	return vim.fn['vimtex#syntax#in_mathzone']() == 0
end

function M.in_env(name)  -- generic environment detection
	local is_inside = vim.fn['vimtex#env#is_inside'](name)
	return (is_inside[1] > 0 and is_inside[2] > 0)
end

function M.in_enumerate()
	return M.in_env('enumerate')
end

function M.in_itemize()
	return M.in_env('itemize')
end

function M.in_examples()
    return M.in_env('examples')
end

function M.in_equation()
	return M.in_env('equation')
end

function M.in_center()
    return M.in_env('center')
end

function M.not_in_center()
    return not M.in_env('center')
end

function M.in_align()
	return M.in_env('align')
end

function M.not_in_align()
	return not M.in_env('align')
end

function M.in_cases()
	return M.in_env('cases')
end

function M.in_split()
	return M.in_env('split')
end

function M.in_tikz()
    return M.in_env('tikzpicture')
end

function M.in_tikzcd()
	return M.in_env('tikzcd')
end

function M.in_tikzgraph()
	return M.in_env('tikzgraph')
end

function M.in_display_math()
	return
		M.in_env('align') or
	    M.in_env('equation') or
		M.in_env('split') or
		M.in_env('cases')
end

function M.in_lists()
    return
        M.in_env('enumerate') or
        M.in_env('itemize')
end

function M.in_mathzone()
    return
        -- M.in_env('tikzcd') or
        vim.fn['vimtex#syntax#in_mathzone']() == 1
end

function M.not_in_mathzone()
	return
        not M.in_env('tikzcd') and
        vim.fn['vimtex#syntax#in_mathzone']() == 0
end

function M.math_but_not_tikzcd()
	return
        not M.in_env('tikzcd') and
        not M.in_env('tikzgraph') and
        vim.fn['vimtex#syntax#in_mathzone']() == 1
end

---------------------------------------------------------------------------
--PostFix
---------------------------------------------------------------------------

function M.negate(_, snip)
	if snip.captures[1] == "-" then
		return "\\not"
	end
end

function M.get_visual(args, parent)
    if (#parent.snippet.env.SELECT_RAW > 0) then
        return sn(nil, i(1, parent.snippet.env.SELECT_RAW))
    else
        return sn(nil, i(1, ''))
    end
end

function M.get_visual2(args, parent)
    if (#parent.snippet.env.SELECT_RAW > 0) then
        return parent.snippet.env.SELECT_RAW
    else
        return ''
    end
end

_G.if_char_insert_space = function ()
    if string.find(vim.v.char, "[%w%{%[%(\\%;]") then
        -- if vim.fn.getline('.')[vim.fn.col('.')-2] ~= '{' then
            -- vim.v.char = " " .. vim.v.char
        -- end
  end
end

---------------------------------------------------------------------------
--Helper Functions
---------------------------------------------------------------------------

--------------------------- String Functions ------------------------------

function M.str_conv(_, snip, user_args)
    if snip.captures[1] == "" then
        return ""
    else
        local letters = {}
        for i = 1, #snip.captures[1] do
            table.insert(letters, string.sub(snip.captures[1], i, i)) 
        end
        table.sort(letters)
        local sorted_str = ""
        for i = 1, #letters do
            sorted_str = sorted_str .. letters[i] 
        end

        local start = string.sub(sorted_str, 1, 1)
        local current_arg = 1
        local dir_str = ""

        for i = 1, #sorted_str do 
            if start == string.sub(sorted_str, i, i) then
                dir_str = dir_str .. user_args[current_arg]
            else -- 
                start = string.sub(sorted_str, i, i) 
                current_arg = current_arg + 1
                dir_str = dir_str .. user_args[current_arg]
            end
        end
        return dir_str
    end
end

function M.indent(iter)
    local tab = ""
    for i = 1, iter do
        tab = tab .. "    "
    end
    return tab
end

--------------------------- Matrix Functions ------------------------------

function M.max(t, fn)
    if #t == 0 then return nil, nil end
    local key, value = 1, t[1]
    for i = 2, #t do
        if fn(value, t[i]) then
            key, value = i, t[i]
        end
    end
    return key, value
end

function M.spacer_scale(scale)
    function M.spaced(args, _, user_args)
        local length = {}
        for i = 1,#args do
            length[i] = #args[i][1]
        end

        local index, max_length = M.max(length, function(a,b) return a < b end)
        local ind_length = length[math.floor((tonumber(user_args[1]) - 1) / (scale * tonumber(user_args[2]))) + 1]
        local diff = max_length - ind_length

        local blank = ""

        if diff == 0 then
            return ""
        else
            for k = 1, diff do
                blank = blank .. " "
            end
            return blank
        end
    end

    return M.spaced

end

function M.space_insert(snip, ins_indx, nodes, spacing)
    local b = {}
    for i = 1, snip.rows do
        b[i] = ((ins_indx - 1) % (spacing * snip.cols)) + 1 + (spacing * snip.cols) * (i - 1)
    end
    table.insert(nodes, f( M.spacer_scale(spacing), b, { user_args = { {tostring(ins_indx), tostring(snip.cols)} }}))
end

--------------------------------------------------------------------------
--Multi Dimension Listing
---------------------------------------------------------------------------

function M.matrix_decor(insert_node)

    function M.general_matrix(_, snip, _, _, _, _, _, user_arg)
        local indent_num = tonumber(user_arg) or 1
        if not snip.rows then
            snip.rows = 1
        end
        if not snip.cols then
            snip.cols = 1
        end
        local nodes = {}
        local ins_indx = 1
        local spacing = insert_node[3]

        for j = 1, snip.rows do
            local render_node_1 = insert_node[1]
            table.insert(nodes, t(M.indent(indent_num)))
            table.insert(nodes, render_node_1)
            for k = 1, snip.cols do
                ins_indx = insert_node[2](snip, spacing, nodes, ins_indx, j, k)
                table.insert(nodes, t(" & "))
            end
            nodes[#nodes]=t({" \\\\", ""})
        end
        nodes[#nodes]=t("   ")
        return sn(nil, nodes)
    end

    return M.general_matrix

end

M.mat = M.matrix_decor({
    nil,
    function(snip, spacing, nodes, ins_indx, j, k)
        table.insert(nodes, r(ins_indx, tostring(j) .. "x" .. tostring(k), i(1, "", { node_ext_opts = { passive = { virt_text = {{"○"}} }, active = { virt_text = {{"●"}} } } })))
        M.space_insert(snip, ins_indx, nodes, spacing)
        return ins_indx + 1
    end,
    1,
})

M.tab = M.matrix_decor({
    t("\\hline "),
    function(snip, spacing, nodes, ins_indx, j, k)
        table.insert(nodes, r(ins_indx, tostring(j) .. "x" .. tostring(k), i(1, "", { node_ext_opts = { passive = { virt_text = {{"○"}} }, active = { virt_text = {{"●"}} } } })))
        M.space_insert(snip, ins_indx, nodes, spacing)
        return ins_indx + 1
    end,
    1,
})

M.align = M.matrix_decor({
    nil,
    function(snip, spacing, nodes, ins_indx, j, k)
        local new_indx = ins_indx
        table.insert(nodes, r(new_indx, tostring(j) .. "x1" .. tostring(k), i(1, "", { node_ext_opts = { passive = { virt_text = {{"○"}} }, active = { virt_text = {{"●"}} } } })))
        M.space_insert(snip, new_indx, nodes, spacing)
        new_indx = new_indx + 1

        table.insert(nodes, t(" &"))
        table.insert(nodes, r(new_indx, tostring(j) .. "x2" .. tostring(k), i(1, "", { node_ext_opts = { passive = { virt_text = {{"○"}} }, active = { virt_text = {{"●"}} } } })))
        M.space_insert(snip, new_indx, nodes, spacing)
        table.insert(nodes, t(" "))
        new_indx = new_indx + 1

        table.insert(nodes, r(new_indx, tostring(j) .. "x3" .. tostring(k), i(1, "", { node_ext_opts = { passive = { virt_text = {{"○"}} }, active = { virt_text = {{"●"}} } } })))
        M.space_insert(snip, new_indx, nodes, spacing)
        return new_indx + 1
    end,
    3,
})

M.cases = M.matrix_decor({
    nil,
    function(snip, spacing, nodes, ins_indx, j, k)
        local new_indx = ins_indx
        table.insert(nodes, r(new_indx, tostring(j) .. "x1" .. tostring(k), i(1, "", { node_ext_opts = { passive = { virt_text = {{"○"}} }, active = { virt_text = {{"●"}} } } })))
        M.space_insert(snip, new_indx, nodes, spacing)
        new_indx = new_indx + 1

        table.insert(nodes, t(" &\\text{ if }"))
        table.insert(nodes, t(" "))

        table.insert(nodes, r(new_indx, tostring(j) .. "x3" .. tostring(k), i(1, "", { node_ext_opts = { passive = { virt_text = {{"○"}} }, active = { virt_text = {{"●"}} } } })))
        M.space_insert(snip, new_indx, nodes, spacing)
        return new_indx + 1
    end,
    3,
})

---------------------------------------------------------------------------
--One Dimension Listing
---------------------------------------------------------------------------

-- function M.lister_decor(insert_node)
--
--     function M.listing(_, snip)
--         if not snip.rows then
--             snip.rows = 1
--         end
--
--         local nodes = {}
--         local ins_indx = 1
--         local list_label = insert_node[1]
--
--         for j = 1, snip.rows do
--             table.insert(nodes, t(M.indent(1)))
--             table.insert(nodes, list_label)
--             table.insert(nodes, r(ins_indx, tostring(j), i(1)))
--             table.insert(nodes, t({"", "", ""}))
--             ins_indx = ins_indx + 1
--         end
--         nodes[#nodes] = nil
--
--         return sn(nil, nodes)
--     end
--
--     return M.listing
-- end
-- M.lister = M.lister_decor({
--     t("\\item "),
-- })

function M.lister(_, snip)
    if not snip.rows then
        snip.rows = 1
    end

    local nodes = {}
    local ins_indx = 1

    for j = 1, snip.rows do
        table.insert(nodes, t(M.indent(1)))
        table.insert(nodes, t("\\item "))
        table.insert(nodes, r(ins_indx, tostring(j), i(1)))
        table.insert(nodes, t({"", "", ""}))
        ins_indx = ins_indx + 1
    end
    nodes[#nodes] = nil

    return sn(nil, nodes)
end

function M.html_lister(_, snip)
    if not snip.rows then
        snip.rows = 1
    end

    local nodes = {}
    local ins_indx = 1

    for j = 1, snip.rows do
        table.insert(nodes, t(M.indent(1)))
        table.insert(nodes, t("<li>"))
        table.insert(nodes, r(ins_indx, tostring(j), i(1)))
        table.insert(nodes, t({"</li>", ""}))
        ins_indx = ins_indx + 1
    end
    nodes[#nodes] = t("</li>")

    return sn(nil, nodes)
end

function M.delim_list_decor(insert_node)

    function M.delim_listing(_, snip)
        if not snip.rows then
            snip.rows = 1
        end

        local nodes = {}
        local ins_indx = 1
        local list_label = insert_node[1]

        if snip.rows == 1 then
            table.insert(nodes, r(ins_indx, "1", i(1)))
        else
            table.insert(nodes, t({"", ""}))
        end

        for j = 2, snip.rows do
            table.insert(nodes, t(M.indent(1)))
            table.insert(nodes, r(ins_indx, tostring(j), i(1)))
            table.insert(nodes, list_label)
            table.insert(nodes, t({"", ""}))
            ins_indx = ins_indx + 1
        end

        return sn(nil, nodes)
    end

    return M.delim_listing
end

M.emp_lister = M.delim_list_decor({
    t(",")
})

function M.integral(_, snip, _)
    local nodes = {}

    if snip.captures[1] == "" then
        return sn(1, {
            c(1, {
                fmta([[
                    \int_{<>}^{<>} <> \, \dd{<>} 
                ]],
                    {
                        i(1),
                        i(2),
                        r(3, "3", i(1)),
                        r(4, "4", i(1)),
                    }
                ),
                fmta([[
                    \int <> \, \dd{<>} 
                ]],
                    {
                        r(1, "3", i(1)),
                        r(2, "4", i(1)),
                    }
                ),
            })
        })
    end

    local definite_int_str = ""
    local indefinite_int_str = ""
    local definite_int_nodes = {}
    local indefinite_int_nodes = {}
    local idx_1 = 1
    local idx_2 = 1

    for k = 1, tonumber(snip.captures[1]) do
        definite_int_str = definite_int_str .. "\\int_{<>}^{<>} "
        table.insert(definite_int_nodes, i(idx_1))
        table.insert(definite_int_nodes, i(idx_1 + 1))
        indefinite_int_str = indefinite_int_str .. "\\int "
        idx_1 = idx_1 + 2
    end

    definite_int_str = definite_int_str .. "<> "
    table.insert(definite_int_nodes, r(idx_1, "1", i(1)))
    indefinite_int_str = indefinite_int_str .. "<> "
    table.insert(indefinite_int_nodes, r(idx_2, "1", i(1)))

    idx_1 = idx_1 + 1
    idx_2 = idx_2 + 1

    for j = 1, tonumber(snip.captures[1]) do
        definite_int_str = definite_int_str .. "\\dd{<>} "
        table.insert(definite_int_nodes, r(idx_1, tostring(idx_2), i(1)))
        indefinite_int_str = indefinite_int_str .. "\\dd{<>} "
        table.insert(indefinite_int_nodes, r(idx_2, tostring(idx_2), i(1)))
        idx_1 = idx_1 + 1
        idx_2 = idx_2 + 1
    end

    table.insert(nodes,
        c(1, {
            fmta(
                definite_int_str, definite_int_nodes
            ),
            fmta(
                indefinite_int_str, indefinite_int_nodes
            ),
        })
    )

    return sn(1, nodes)
end




















return M
