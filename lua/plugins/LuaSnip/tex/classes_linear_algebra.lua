----------------------------------------------------------------------------
--Linear Algebra
---------------------------------------------------------------------------

local helpers = require('plugins/luasnip-helper-funcs')
local get_visual = helpers.get_visual
local in_mathzone = helpers.in_mathzone
local mat = helpers.mat

return {

s({ trig = "([bBpvV])mat", snippetType = 'autosnippet', regTrig = true },
            fmta([[
                \begin{<>}
                <>
                \end{<>}
            ]],
            {
                f(function(_, snip)
                    return snip.captures[1] .. "matrix"
                end),
                d(1, mat, {}, {
                    user_args = {
                        function(snip) snip.rows = snip.rows + 1 end,
                        function(snip) snip.rows = math.max(snip.rows - 1, 1) end,
                        function(snip) snip.cols = snip.cols + 1 end,
                        function(snip) snip.cols = math.max(snip.cols - 1, 1) end,
                    }
                }),
                f(function(_, snip)
                    return snip.captures[1] .. "matrix"
                end),
            }
	),
	{ condition = in_mathzone }
),

s({trig = 'span', wordTrig = false, snippetType = 'autosnippet'},
	fmta(
		"\\Span{<>}",
		{
			d(1, get_visual)
		}
	),
	{ condition = in_mathzone }
),











}
