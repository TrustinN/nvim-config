---------------------------------------------------------------------------
--Series Notation
---------------------------------------------------------------------------

local helpers = require('plugins/config/LuaSnip/luasnip-helper-funcs')
local get_visual = helpers.get_visual
local in_mathzone = helpers.in_mathzone
local integral = helpers.integral
local conditions= {
    condition = in_mathzone,
    callbacks = {
        [-1] = {
            [events.leave] = function ()
              vim.cmd([[
                autocmd InsertCharPre <buffer> ++once lua _G.if_char_insert_space()
              ]])
            end
        }
    },
}

return {

s({trig = 'sum', wordTrig = false, snippetType = 'autosnippet'},
    t("\\sum"),
    conditions
),

s({trig = 'pro', wordTrig = false, snippetType = 'autosnippet'},
    t("\\prod"),
    conditions
),

s({trig = 'cop', priority = 1000, wordTrig = false, snippetType = 'autosnippet'},
	t("\\coprod"),
    conditions
),

s({trig = 'O+', priority = 1000, wordTrig = false, snippetType = 'autosnippet'},
	t("\\bigoplus"),
    conditions
),







}
