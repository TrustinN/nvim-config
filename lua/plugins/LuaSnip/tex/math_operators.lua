----------------------------------------------------------------------------
--Operators
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

----------------------------------------------------------------------------
--Binary
----------------------------------------------------------------------------

s({trig = 'time', wordTrig = false, snippetType = 'autosnippet'},
	t("\\times"),
    conditions
),

s({trig = '//', priority = 125, wordTrig = false, regTrig = true, snippetType = 'autosnippet'},
	fmta("\\frac{<>}{<>}",
        {
            d(1, get_visual),
            r(2, "2", i(1)),
        }
	),
	{ condition = in_mathzone }
),

ms(
    {
        common = {priority = 250, wordTrig = false, regTrig = true, snippetType = 'autosnippet', condition = in_mathzone },
        {trig = "(%[)(.*)(%])//"},
    },
    fmta(
        "\\frac{<>}{<>}",
        {
            d(1, function(_, snip)
                if snip.captures[2] == nil then
                    return get_visual
                else
                    return sn(nil, {t(tostring(snip.captures[2]))})
                end
            end
            ),
            r(2, "2", i(1)),
        }
    )
),

s({trig = '//', priority = 500, wordTrig = false, regTrig = true, snippetType = 'autosnippet'},
	fmta("\\dfrac{<>}{<>}",
        {
            d(1, get_visual),
            r(2, "2", i(1)),
        }
	),
	{ condition = in_display_math }
),

ms(
    {
        common = {priority = 1000, wordTrig = false, regTrig = true, snippetType = 'autosnippet', condition = in_display_math},
        {trig = "(%[)(.*)(%])//"},
    },
    fmta(
        "\\dfrac{<>}{<>}",
        {
            d(1, function(_, snip)
                if snip.captures[2] == nil then
                    return get_visual
                else
                    return sn(nil, {t(tostring(snip.captures[2]))})
                end
            end
            ),
            r(2, "2", i(1)),
        }
    )
),

s({
    trig = 'sq',
    priority = 500,
    regTrig = false,
    wordTrig = false,
    snippetType = 'autosnippet',
	condition = in_mathzone,
},
    fmta(
        "\\sqrt{<>}",
        {
            d(1, get_visual)
        }
    )
),

s({
    trig = '(%[)(%w)(%])sq',
    priority = 1000,
    regTrig = true,
    wordTrig = false,
    snippetType = 'autosnippet',
	condition = in_mathzone,
},
    d(1, function(_, snip)
        return sn(nil,
            fmta(
                "\\sqrt[<>]{<>}",
                {
                    i(1, snip.captures[2]),
                    d(2, get_visual),
                }
            )
        )
    end)
),

















}
