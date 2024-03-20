---------------------------------------------------------------------------
--Tags
----------------------------------------------------------------------------

local helpers = require('plugins/luasnip-helper-funcs')
local get_visual = helpers.get_visual
local emp_lister = helpers.emp_lister
local html_lister = helpers.html_lister

local nodes = {}

local tags = {
    ["html"] = "html0",
    ["head"] = "head0",
    ["meta"] = "meta0",
    ["title"] = "title0",
    ["header"] = "header0",
    ["h"] = "h1",
    ["nav"] = "nav0",
    ["body"] = "body0",
    ["main"] = "main0",
    ["footer"] = "footer0",
    ["span"] = "span0",
    ["a"] = "a0",
    ["p"] = "p0",
    ["em"] = "em0",
    ["strong"] = "strong0",
    ["abbr"] = "abbr0",
    ["sup"] = "^0",
    ["sub"] = "_0",
}

function make_tags(tag_type, trig_info)
    local trig = string.sub(trig_info, 1, #trig_info - 1)
    local counted = tonumber(string.sub(trig_info, #trig_info, #trig_info))
    local nodes1 = {
            r(1, "r1", i(1, "1")),
            r(2, "r2", d(2, get_visual)),
            rep(1),
        }
    local nodes2 = {
            t(tag_type),
            r(1, "r1", i(1, "1")),
            r(2, "r2", d(2, get_visual)),
            t(tag_type),
            rep(1),
        }

    local number_inserted = "{}"
    if counted == 0 then
        number_inserted = ""
        nodes1 = {
                r(1, "r1", d(1, get_visual)),
            }
        nodes2 = {
                t(tag_type),
                r(1, "r1", d(1, get_visual)),
                t(tag_type),
            }
    end

    local string1 = "<" .. tag_type .. number_inserted .. ">{}</" .. tag_type .. number_inserted .. ">"
    local string2 = [[
        <]] .. number_inserted .. [[{}>
            {}
        </]] .. number_inserted .. [[{}>
    ]]
    return s({trig = trig .. "-", wordTrig = false, snippetType = 'autosnippet'},
            c(1, {
                fmt(string1, nodes1),
                fmt(string2, nodes2),
            })
        )
end


for k, v in pairs(tags) do
    table.insert(nodes, make_tags(k, v))
end

local opt_nodes = {

s({trig = "script-", wordTrig = false, snippetType = 'autosnippet'},
    { t("<script src=\""), i(1), t("\" defer></script>") }
),

s({trig = "ul-", wordTrig = false, snippetType = 'autosnippet'},
    fmt([[
        <ul>
        {}
        </ul>
    ]],
        {
            d(1, html_lister, {}, { 
                user_args = {
                    function(snip) snip.rows = snip.rows + 1 end,
                    function(snip) snip.rows = math.max(snip.rows - 1, 1) end,
                    function(snip) snip.cols = snip.cols + 1 end,
                    function(snip) snip.cols = math.max(snip.cols - 1, 1) end,
                }
            })
        }
    )
),


}

for k, v in pairs(opt_nodes) do
    table.insert(nodes, v)
end







return nodes
