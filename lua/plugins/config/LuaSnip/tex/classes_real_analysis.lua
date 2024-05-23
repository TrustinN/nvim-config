----------------------------------------------------------------------------
--Real Analysis
----------------------------------------------------------------------------

local helpers = require('plugins/config/LuaSnip/luasnip-helper-funcs')
local get_visual = helpers.get_visual
local in_mathzone = helpers.in_mathzone
local integral = helpers.integral
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

s({trig = "mult", wordTrig = false, regTrig = false, snippetType = 'autosnippet'},
    t("\\mult"),
    conditions
),

s({trig = "exp", wordTrig = false, regTrig = false, snippetType = 'autosnippet'},
    fmta(
        "\\exp(<>)",
        {
            d(1, get_visual)
        }
    ),
    { condition = in_mathzone }
),

s({trig = "oo", wordTrig = false, regTrig = false, snippetType = 'autosnippet'},
    t("\\infty"),
    conditions
),

s({trig = 'dx', wordTrig = false, snippetType = 'autosnippet'},
	fmta(
		"\\dd{<>}",
		{
			d(1, get_visual)
		}
	),
	{ condition = in_mathzone }
),

s({trig = 'dv', wordTrig = false, snippetType = 'autosnippet'},
	fmta(
		"\\dv{<>}",
		{
			d(1, get_visual)
		}
	),
	{ condition = in_mathzone }
),

s({trig = 'pd', wordTrig = false, snippetType = 'autosnippet'},
	fmta(
		"\\pdv{<>}",
		{
			d(1, get_visual)
		}
	),
	{ condition = in_mathzone }
),

s({trig = 'int', priority = 500, regTrig = true, wordTrig = false, snippetType = 'autosnippet'},
	fmta(
		"<>",
		{
            d(1, integral)
		}
	),
	{ condition = in_mathzone }
),

s({trig = '(%d*)int', priority = 1000, regTrig = true, wordTrig = false, snippetType = 'autosnippet'},
	fmta(
		"<>",
		{
            d(1, integral)
		}
	),
	{ condition = in_mathzone }
),

s({trig = 'dom', priority = 500, wordTrig = false, snippetType = 'autosnippet'},
    t("\\dom"),
    conditions
),

s({trig = 'lim', priority = 500, wordTrig = false, snippetType = 'autosnippet'},
    c(1, {
        fmta(
            "\\lim <>",
            {
                i(1),
            }
        ),
        fmta(
            "\\lim\\limits_{<> \\to <>}",
            {
                i(1),
                i(2),
            }
        ),
    }),
	{ condition = in_mathzone }
),

s({trig = 'inf', wordTrig = false, snippetType = 'autosnippet'}, 
    t("\\inf"),
    conditions
),

s({trig = 'sup', wordTrig = false, snippetType = 'autosnippet'}, 
    t("\\sup"),
    conditions
),

s({trig = 'ilim', priority = 1000, wordTrig = false, snippetType = 'autosnippet'},
    c(1, {
        fmta(
            "\\liminf <>",
            {
                r(1, "1", i(1)),
            }
        ),
        fmta(
            "\\liminf\\limits_{<> \\to \\infty} <>",
            {
                i(1),
                r(2, "1", i(1)),
            }
        ),
    }),
	{ condition = in_mathzone }
),

s({trig = 'slim', priority = 1000, wordTrig = false, snippetType = 'autosnippet'},
    c(1, {
        fmta(
            "\\limsup <>",
            {
                r(1, "1", i(1)),
            }
        ),
        fmta(
            "\\limsup\\limits_{<> \\to \\infty} <>",
            {
                i(1),
                r(2, "1", i(1)),
            }
        ),
    }),
	{ condition = in_mathzone }
),





















}
