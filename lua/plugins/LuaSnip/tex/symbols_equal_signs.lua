----------------------------------------------------------------------------
--Equal Signs
----------------------------------------------------------------------------

local helpers = require('plugins/luasnip-helper-funcs')
local get_visual = helpers.get_visual
local in_mathzone = helpers.in_mathzone
local negate = helpers.negate
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

s({trig = '([-]?)leq', wordTrig = false, regTrig = true, snippetType = 'autosnippet'},
	fmta("<>\\leq",
		{
			f( negate ),
		}
	),
    conditions
),

s({trig = '([-]?)<', priority = 500, wordTrig = false, regTrig = true, snippetType = 'autosnippet'},
	fmta("<><>",
		{
			f( negate ),
            t("<"),
		}
	),
    conditions
),

s({trig = '([-]?)geq', wordTrig = false, regTrig = true, snippetType = 'autosnippet'},
	fmta("<>\\geq",
		{
			f( negate ),
		}
	),
    conditions
),

s({trig = '([-]?)>', priority = 500, wordTrig = false, regTrig = true, snippetType = 'autosnippet'},
	fmta("<><>",
		{
			f( negate ),
            t(">"),
		}
	),
    conditions
),

s({trig = 'n=', wordTrig = false, snippetType = 'autosnippet'},
	t("\\neq"),
    conditions
),

s({trig = '([-]?)a=', wordTrig = false, regTrig = true, snippetType = 'autosnippet'},
	fmta("<>\\approx",
		{
			f( negate ),
		}
	),
    conditions
),

s({trig = '([-]?)e=', wordTrig = false, regTrig = true, snippetType = 'autosnippet'},
	fmta("<>\\equiv",
		{
			f( negate ),
		}
	),
    conditions
),

s({trig = '([-]?)c=', wordTrig = false, regTrig = true, snippetType = 'autosnippet'},
	fmta("<>\\cong",
		{
			f( negate )
		}
	),
    conditions
),

s({trig = '([-]?)s=', wordTrig = false, regTrig = true, snippetType = 'autosnippet'},
	fmta("<>\\sim",
		{
			f( negate ),
		}
	),
    conditions
),

s({trig = 'd=', wordTrig = false, snippetType = 'autosnippet'},
	t(":="),
    conditions
),

s({trig = 'i>', priority = 1000, wordTrig = false, snippetType = 'autosnippet'},
	t("\\in"),
    conditions
),

s({trig = 'i<', priority = 1000, wordTrig = false, snippetType = 'autosnippet'},
	t("\\notin"),
    conditions
),



}
