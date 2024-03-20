----------------------------------------------------------------------------
--Delimiters
----------------------------------------------------------------------------

local helpers = require('plugins/luasnip-helper-funcs')
local get_visual = helpers.get_visual
local emp_lister = helpers.emp_lister

return{

s({trig = '(', priority = 500, wordTrig = false, snippetType = 'autosnippet'},
	fmta(
		"(<>)",
		{
			d(1, get_visual),
		}
	)
),

s({trig = '[', priority = 500, wordTrig = false, snippetType = 'autosnippet'},
	fmta(
		"[<>]",
		{
			d(1, get_visual)
		}
	)
),

s({trig = '{', priority = 500, wordTrig = false, snippetType = 'autosnippet'},
	fmta(
		"{<>}",
		{
            d(1, emp_lister, {}, {
                user_args = {
                    function(snip) snip.rows = snip.rows + 1 end,
                    function(snip) snip.rows = math.max(snip.rows - 1, 1) end,
                    function(snip) snip.cols = snip.cols + 1 end,
                    function(snip) snip.cols = math.max(snip.cols - 1, 1) end,
                }
            })
		}
	)
),


}

