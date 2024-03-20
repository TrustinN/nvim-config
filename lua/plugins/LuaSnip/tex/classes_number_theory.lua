---------------------------------------------------------------------------
--Number Theory
----------------------------------------------------------------------------

local helpers = require('plugins/luasnip-helper-funcs')
local get_visual = helpers.get_visual
local in_mathzone = helpers.in_mathzone
local in_display_math = helpers.in_display_math
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

s({trig = 'odd', priority = 1000, wordTrig = false, snippetType = 'autosnippet'}, 
    t("\\odd"),
    conditions
),

s({trig = 'even', priority = 1000, wordTrig = false, snippetType = 'autosnippet'}, 
    t("\\even"),
    conditions
),

s({trig = '([p]?)mod', wordTrig = false, regTrig = true, snippetType = 'autosnippet'},
	fmta(
		"\\<>mod{<>}",
		{
			f( function(_,snip) return snip.captures[1] end ),
			i(1)
		}
	),
	{ condition = in_mathzone }
),

s({trig = 'gcd', wordTrig = false, snippetType = 'autosnippet'},
	fmta(
		"\\gcd{<>}",
		{
			d(1, get_visual),
		}
	),
	{ condition = in_mathzone }
),

s({trig = 'lcm', wordTrig = false, snippetType = 'autosnippet'},
	fmta(
		"\\lcm{<>}",
		{
			d(1, get_visual),
		}
	),
	{ condition = in_mathzone }
),

s({trig = '([n]?)div', wordTrig = false, regTrig = true, snippetType = 'autosnippet'},
	fmta("\\<>divides",
		{
			f( function(_, snip) return snip.captures[1] end )
		}
	),
    conditions
),

s({trig = 'cho', priority = 125, wordTrig = false, regTrig = true, snippetType = 'autosnippet'},
	fmta("\\binom{<>}{<>}",
        {
            d(1, get_visual),
            r(2, "2", i(1)),
        }
	),
	{ condition = in_mathzone }
),

s({trig = 'cho', priority = 500, wordTrig = false, regTrig = true, snippetType = 'autosnippet'},
	fmta("\\dbinom{<>}{<>}",
        {
            d(1, get_visual),
            r(2, "2", i(1)),
        }
	),
	{ condition = in_display_math }
),


















}
