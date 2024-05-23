----------------------------------------------------------------------------
--Subscript
----------------------------------------------------------------------------

local helpers = require('plugins/config/LuaSnip/luasnip-helper-funcs')
local get_visual = helpers.get_visual
local in_mathzone = helpers.in_mathzone

return {

s({trig = '([%w%)%]%}])_', regTrig = true, wordTrig = false, snippetType="autosnippet"},
	fmta(
		"<>_{<>}",
		{
			f( function(_, snip) return snip.captures[1] end ),
			d(1, get_visual)
   		}
	),
	{ condition = in_mathzone }
),

s({trig = "__", priority = 500, wordTrig = false, regTrig = false, snippetType = 'autosnippet'},
    fmta(
        "\\underbrace{<>}_{<>}",
        {
            d(1, get_visual),
            i(2),
        }
    ),
	{ condition = in_mathzone }
),

}
