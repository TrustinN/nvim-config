---------------------------------------------------------------------------
--Math Fonts
----------------------------------------------------------------------------

local helpers = require('plugins/luasnip-helper-funcs')
local get_visual = helpers.get_visual
local in_mathzone = helpers.in_mathzone

return {

s({trig = 'cc', wordTrig = false, snippetType = 'autosnippet'},
	fmta(
		"\\mathcal{<>}",
		{
			d(1, get_visual)
		}
	),
	{ condition = in_mathzone }
),

s({trig = 'bb', wordTrig = false, snippetType = 'autosnippet'},
	fmta(
		"\\mathbb{<>}",
		{
			d(1, get_visual)
		}
	),
	{ condition = in_mathzone }
),

}
