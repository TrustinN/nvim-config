----------------------------------------------------------------------------
--Setup Functions
----------------------------------------------------------------------------

local ls = require("luasnip")
local util = require("luasnip.util.util")
local node_util = require("luasnip.nodes.util")

local function find_dynamic_node(node)
	while not node.dynamicNode do
		node = node.parent
	end
	return node.dynamicNode
end

local external_update_id = 0

function dynamic_node_external_update(func_indx)
	local current_node = ls.session.current_nodes[vim.api.nvim_get_current_buf()]
	local dynamic_node = find_dynamic_node(current_node)

	external_update_id = external_update_id + 1
	current_node.external_update_id = external_update_id

	local insert_pre_call = vim.fn.mode() == "i"
	local cursor_pos_pre_relative = util.pos_sub(
		util.get_cursor_0ind(),
		current_node.mark:pos_begin_raw()
	)

	node_util.leave_nodes_between(dynamic_node.snip, current_node)

	local func = dynamic_node.user_args[func_indx]
	if func then
		func(dynamic_node.parent.snippet)
	end

	dynamic_node.last_args = nil
	dynamic_node:update()

	local target_node = dynamic_node:find_node(function(test_node)
		return test_node.external_update_id == external_update_id
	end)

	if target_node then
		node_util.enter_nodes_between(dynamic_node, target_node)

		if insert_pre_call then
			util.set_cursor_0ind(
				util.pos_add(
					target_node.mark:pos_begin_raw(),
					cursor_pos_pre_relative
				)
			)
		else
			node_util.select_node(target_node)
		end
		ls.session.current_nodes[vim.api.nvim_get_current_buf()] = target_node
	else
		ls.session.current_nodes[vim.api.nvim_get_current_buf()] = dynamic_node.snip:jump_into(1)
	end
end

---------------------------------------------------------------------------
--Options
---------------------------------------------------------------------------

require("luasnip").config.set_config({
	enable_autosnippets = true,
	store_selection_keys = "<Tab>",
})

---------------------------------------------------------------------------
--Key Maps
---------------------------------------------------------------------------

vim.cmd([[
	" imap <silent><expr> <Tab> luasnip#expandable() ? '<Plug>luasnip-expand-snippet' : '<Tab>'

	imap <silent><expr> jk luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : 'jk'
	smap <silent><expr> jk luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : 'jk'

	imap <silent><expr> <C-t> luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<Tab>'
	smap <silent><expr> <C-t> luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<Tab>'

    imap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
    smap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'

	imap <silent><expr> <C-l> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-l>'
	smap <silent><expr> <C-l> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-l>'

    inoremap <silent> <C-d> <Cmd>lua _G.dynamic_node_external_update(1)<CR>
    snoremap <silent> <C-d> <Cmd>lua _G.dynamic_node_external_update(1)<CR>

    inoremap <silent> <C-e> <Cmd>lua _G.dynamic_node_external_update(2)<CR>
    snoremap <silent> <C-e> <Cmd>lua _G.dynamic_node_external_update(2)<CR>

    inoremap <silent> <C-f> <Cmd>lua _G.dynamic_node_external_update(3)<CR>
    snoremap <silent> <C-f> <Cmd>lua _G.dynamic_node_external_update(3)<CR>

    inoremap <silent> <C-s> <Cmd>lua _G.dynamic_node_external_update(4)<CR>
    snoremap <silent> <C-s> <Cmd>lua _G.dynamic_node_external_update(4)<CR>
]])

require("luasnip.loaders.from_lua").load({
	paths = {
		"~/.config/nvim/lua/plugins/LuaSnip/" 
	}
})

require("luasnip.loaders.from_lua").lazy_load({
    paths = "~/.config/nvim/lua/plugins/LuaSnip/"
})














