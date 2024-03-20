---------------------------------------------------------------------------
--Fonts
----------------------------------------------------------------------------

local helpers = require('plugins/luasnip-helper-funcs')
local get_visual = helpers.get_visual
local in_mathzone = helpers.in_mathzone
local in_tikzcd = helpers.in_tikzcd

return {

s({trig = 'tii', snippetType = 'autosnippet'}, 
	fmta("\\textit{<>}",
		{
			d(1, get_visual)
		}
	)
),

s({trig = 'tbb', snippetType = 'autosnippet'},
	fmta("\\textbf{<>}",
		{
			d(1, get_visual)
		}
	)
),

s({trig = 'tt', priority = 500, regTrig = true, wordTrig = false, snippetType = 'autosnippet'},
    c(1, {
        fmta("\\text{<>}",
            {
                d(1, get_visual)
            }
        ),
        fmta(
            "\\mathop{<>}",
            {
                d(1, get_visual)
            }
        ),
        i(1),
    }),
	{ condition = in_mathzone }
),

s({trig = 'tt', priority = 1000, regTrig = true, wordTrig = false, snippetType = 'autosnippet'},
    fmta(
        "\\mlnode{<>}",
        {
            d(1, get_visual)
        }
    ),
	{ condition = in_tikzcd}
),





}
