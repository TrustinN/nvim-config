----------------------------------------------------------------------------
--Superscript
----------------------------------------------------------------------------

local helpers = require('plugins/config/LuaSnip/luasnip-helper-funcs')
local get_visual = helpers.get_visual
local in_mathzone = helpers.in_mathzone

return {

s({
    trig = '([%w%)%]%}])^',
    regTrig = true,
    wordTrig = false,
    snippetType= 'autosnippet',
	condition = in_mathzone,
},
	fmta(
		"<>^{<>}",
		{
			f( function(_, snip) return snip.captures[1] end ),
			i(1),
    	}
	)
),

s({
    trig = '\"\'',
    priority = 1000,
    wordTrig = false,
    snippetType = 'autosnippet',
    condition = in_mathzone,
},
    {
        t("\"\'"),
    }
),

s({
    trig = '([%w%)%]%}])\'',
    priority = 500,
    regTrig = true,
    wordTrig = false,
    snippetType = 'autosnippet',
    condition = in_mathzone,
},
    {
        f( function(_, snip) return snip.captures[1] end ),
        t("^{\\prime}"),
    }
),

s({
    trig = '\\prime}\'',
    priority = 1000,
    wordTrig = false,
    snippetType = 'autosnippet',
    condition = in_mathzone,
},
    {t("\\prime\\prime}"),}
),

s({
    trig = '([%w%)%]%}])%*',
    priority = 250,
    regTrig = true,
    wordTrig = false,
    snippetType = 'autosnippet',
    condition = in_mathzone,
},
    {
        f( function(_, snip) return snip.captures[1] end ),
        t("^{*}"),
    }
),

s({
    trig = '*}*',
    priority = 500,
    wordTrig = false,
    snippetType = 'autosnippet',
    condition = in_mathzone,
},
    {t("**}"),}
),
s({trig = '-|', wordTrig = false, snippetType = 'autosnippet'},
	t("^{\\perp} "),
	{ condition = in_mathzone }
),

s({trig = "bar", priority = 500, wordTrig = false, regTrig = false, snippetType = 'autosnippet'},
    fmta(
        "\\overline{<>}",
        {
            d(1, get_visual),
        }
    ),
    { condition = in_mathzone }
),

s({trig = "hat", priority = 500, wordTrig = false, regTrig = false, snippetType = 'autosnippet'},
    fmta(
        "\\hat{<>}",
        {
            d(1, get_visual),
        }
    ),
    { condition = in_mathzone }
),

s({trig = "til", priority = 500, wordTrig = false, regTrig = false, snippetType = 'autosnippet'},
    fmta(
        "\\tilde{<>}",
        {
            d(1, get_visual),
        }
    ),
    { condition = in_mathzone }
),
















}
