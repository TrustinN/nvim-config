----------------------------------------------------------------------------
--Arrows
----------------------------------------------------------------------------

local helpers = require('plugins/config/LuaSnip/luasnip-helper-funcs')
local get_visual = helpers.get_visual
local in_mathzone = helpers.in_mathzone
local in_mathmode = helpers.in_mathmode
local in_tikzcd = helpers.in_tikzcd
local math_but_not_tikzcd = helpers.math_but_not_tikzcd
local conditions = {
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
local conditions2 = {
    condition = math_but_not_tikzcd,
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

s({trig = 'kl', snippetType = 'autosnippet'},
	t("\\mapsto"),
    conditions2
),

s({trig = 'kl', snippetType = 'autosnippet'},
	t("maps to"),
	{ condition = in_tikzcd }
),

s({trig = 'ew', snippetType = 'autosnippet'},
	{ t("\\leftarrow") },
    conditions
),

s({trig = 'we', snippetType = 'autosnippet'},
	{ t("\\rightarrow") },
    conditions
),

s({trig = 'iff', wordTrig = false, snippetType = 'autosnippet'},
	{ t("leftrightarrow") },
	{ condition = in_tikzcd }
),

s({trig = "inj", snippetType = 'autosnippet'},
    t("\\hookrightarrow"),
    conditions2
),

s({trig = "inj", snippetType = 'autosnippet'},
    t("hook"),
    { condition = in_tikzcd }
),

s({trig = "sur", snippetType = 'autosnippet'},
    t("\\twoheadrightarrow"),
    conditions2
),

s({trig = "sur", snippetType = 'autosnippet'},
    t("two heads"),
    { condition = in_tikzcd }
),

s({trig = "--", snippetType = 'autosnippet'},
    t("dashed"),
    { condition = in_tikzcd }
),

s({trig = "nh", snippetType = 'autosnippet'},
    t("no head"),
    { condition = in_tikzcd }
),







}
