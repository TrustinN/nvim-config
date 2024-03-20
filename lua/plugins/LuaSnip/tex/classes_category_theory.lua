----------------------------------------------------------------------------
--Category Theory
---------------------------------------------------------------------------

local helpers = require('plugins/luasnip-helper-funcs')
local get_visual = helpers.get_visual
local in_mathzone = helpers.in_mathzone
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

return {

s({trig = 'hom', wordTrig = false, snippetType = 'autosnippet'},
    t("\\Hom"),
    conditions
),

s({trig = 'aut', wordTrig = false, snippetType = 'autosnippet'},
    t("\\Aut"),
    conditions
),

s({trig = 'end', wordTrig = false, snippetType = 'autosnippet'},
    t("\\End"),
    conditions
),

s({trig = 'o+', priority = 500, wordTrig = false, snippetType = 'autosnippet'},
	{ t("\\oplus") },
    conditions
),

s({trig = 'O+', priority = 1000, wordTrig = false, snippetType = 'autosnippet'},
	{ t("\\bigoplus") },
    conditions
),

s({trig = 'o*', priority = 1000, wordTrig = false, snippetType = 'autosnippet'},
	{ t("\\otimes") },
    conditions
),

s({trig = 'O*', priority = 1000, wordTrig = false, snippetType = 'autosnippet'},
	{ t("\\bigotimes") },
    conditions
),















}
