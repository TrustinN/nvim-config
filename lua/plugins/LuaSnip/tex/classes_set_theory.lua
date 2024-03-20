---------------------------------------------------------------------------
--Sets
----------------------------------------------------------------------------

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

s({trig = '\\{', priority = 1000, regTrig = false, wordTrig = false, snippetType = 'autosnippet'},
    c(1, {
        fmta(
            "\\{<>\\}",
            {
                d(1, get_visual),
            }
        ),
        fmta(
            "\\left\\{<>\\right\\}",
            {
                d(1, get_visual),
            }
        ),
    }),
	{ condition = in_mathzone }
),

s({trig = 'emp', wordTrig = false, snippetType = 'autosnippet'},
	t("\\emptyset"),
    conditions
),

s({trig = 'sub', wordTrig = false, snippetType = 'autosnippet'},
    c(1, {
        i(1, "\\subseteq"),
        t("\\supseteq"),
    }),
    conditions
),

s({trig = 'c([ua])p', priority = 500, wordTrig = false, regTrig = true, snippetType = 'autosnippet'}, 
    fmta(
        "\\c<>p",
        {
            f(function(_, snip) return snip.captures[1] end),
        }
    ),
    conditions
),

s({trig = 'bc([ua])p', priority = 1000, wordTrig = false, regTrig = true, snippetType = 'autosnippet'}, 
    fmta(
        "\\bigc<>p",
        {
            f(function(_, snip) return snip.captures[1] end),
        }
    ),
    conditions
),

s({trig = '--', wordTrig = false, snippetType = 'autosnippet'},
	t("\\backslash"),
    conditions
),

s({trig = 'rst', wordTrig = false, snippetType = 'autosnippet'},
	t("\\mid"),
    conditions
),

s({trig = "min", wordTrig = false, regTrig = false, snippetType = 'autosnippet'},
    fmta(
        "\\min(<>)",
        {
            i(1),
        }
    ),
    { condition = in_mathzone }
),

s({trig = "max", wordTrig = false, regTrig = false, snippetType = 'autosnippet'},
    fmta(
        "\\max(<>)",
        {
            i(1),
        }
    ),
    { condition = in_mathzone }
),








}
