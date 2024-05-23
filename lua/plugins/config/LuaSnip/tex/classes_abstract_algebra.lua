----------------------------------------------------------------------------
--Abstract Algebra
---------------------------------------------------------------------------

local helpers = require('plugins/config/LuaSnip/luasnip-helper-funcs')
local get_visual = helpers.get_visual
local in_mathzone = helpers.in_mathzone
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

s({trig = 'deg', wordTrig = false, snippetType = 'autosnippet'},
	t("\\deg"),
    conditions
),

s({trig = 'act', wordTrig = false, snippetType = 'autosnippet'},
	t("\\actson"),
    conditions
),

s({trig = 't=', wordTrig = false, snippetType = 'autosnippet'},
	t("\\triangleleft"),
    conditions
),

s({trig = 'ker', wordTrig = false, snippetType = 'autosnippet'},
	fmta(
		"\\ker{<>}",
		{
			d(1, get_visual)
		}
	),
	{ condition = in_mathzone }
),

s({trig = 'img', wordTrig = false, snippetType = 'autosnippet'},
	fmta(
		"\\Im{<>}",
		{
			d(1, get_visual)
		}
	),
	{ condition = in_mathzone }
),

s({trig = 'dim', wordTrig = false, snippetType = 'autosnippet'},
	t("\\dim"),
    conditions
),

s({trig = 'frac', wordTrig = false, snippetType = 'autosnippet'},
	fmta(
		"\\Frac{<>}",
		{
			d(1, get_visual)
		}
	),
	{ condition = in_mathzone }
),



















}
