---------------------------------------------------------------------------
--Delimiters
----------------------------------------------------------------------------

local helpers = require('plugins/luasnip-helper-funcs')
local get_visual = helpers.get_visual
local in_mathzone = helpers.in_mathzone
local in_tikzcd = helpers.in_tikzcd
local line_begin = require("luasnip.extras.expand_conditions").line_begin
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
s({trig = "([^%w])mm", wordTrig = false, regTrig = true, snippetType = 'autosnippet'},
	fmta(
		"<>$<>$",
		{
			f( function(_, snip) return snip.captures[1] end ),
			d(1, get_visual),
		}
	)
),

s({trig = "mm", snippetType = 'autosnippet'},
	fmta(
		"$<>$",
		{
			d(1, get_visual),
		}
	),
	{ condition = line_begin }
),

s({trig = '\"', priority = 500, wordTrig = false, snippetType = 'autosnippet'},
	fmta(
		"\"<>\"",
		{
			d(1, get_visual),
		}
	),
    { condition = in_tikzcd }
),

s({trig = '\"', priority = 500, wordTrig = false, snippetType = 'autosnippet'},
	fmta(
		"`<>\'",
		{
			d(1, get_visual),
		}
	)
),

s({trig = '(', priority = 500, wordTrig = false, snippetType = 'autosnippet'},
    c(1, {
        fmta(
            "(<>)",
            {
                d(1, get_visual),
            }
        ),
        fmta(
            "\\left(<>\\right)",
            {
                d(1, get_visual),
            }
        ),
    })
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
			d(1, get_visual)
		}
	)
),

s({trig = ';<', priority = 500, wordTrig = false, snippetType = 'autosnippet'},
    c(1, {
        fmta(
            "\\langle <> \\rangle",
            {
                d(1, get_visual),
            }
        ),
        fmta(
            "\\left\\langle <> \\right\\rangle",
            {
                d(1, get_visual),
            }
        ),
    }),
    conditions
),

s({trig = 'abs', priority = 500, wordTrig = false, snippetType = 'autosnippet'},
    c(1, {
        fmta(
            "\\lvert <> \\rvert",
            {
                d(1, get_visual),
            }
        ),
        fmta(
            "\\left\\lvert <> \\right\\rvert",
            {
                d(1, get_visual),
            }
        ),
    }),
    conditions
),

s({trig = '||', priority = 500, wordTrig = false, snippetType = 'autosnippet'},
    c(1, {
        fmta(
            "\\lVert <> \\rVert",
            {
                d(1, get_visual),
            }
        ),
        fmta(
            "\\left\\lVert <> \\right\\rVert",
            {
                d(1, get_visual),
            }
        ),
    }),
    conditions
),

s({trig = 'flr', priority = 500, wordTrig = false, snippetType = 'autosnippet'},
    c(1, {
        fmta(
            "\\lfloor <> \\rfloor",
            {
                d(1, get_visual),
            }
        ),
        fmta(
            "\\left\\lfloor <> \\right\\rfloor",
            {
                d(1, get_visual),
            }
        ),
    }),
    conditions
),

s({trig = 'ceil', priority = 500, wordTrig = false, snippetType = 'autosnippet'},
    c(1, {
        fmta(
            "\\lceil <> \\rceil",
            {
                d(1, get_visual)
            }
        ),
        fmta(
            "\\left\\lceil <> \\right\\rceil",
            {
                d(1, get_visual)
            }
        ),
    }),
    conditions
),












}
