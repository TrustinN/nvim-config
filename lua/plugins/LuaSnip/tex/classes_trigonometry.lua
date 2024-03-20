----------------------------------------------------------------------------
--Trigonometry
----------------------------------------------------------------------------

local helpers = require('plugins/luasnip-helper-funcs')
local get_visual = helpers.get_visual
local in_mathzone = helpers.in_mathzone
local in_display_math = helpers.in_display_math

return {

s({
    trig = '(%[?)(%d?)(%]?)sin',
    regTrig = true,
    wordTrig = false,
    snippetType = 'autosnippet',
	condition = in_mathzone,
},
    d(1, function(_, snip)
        if snip.captures[1] == "" then
            return sn(nil,
                fmta(
                    "\\sin{<>}",
                    {
                        d(1, get_visual),
                    }
                )
            )
        else
            return sn(nil,
                fmta(
                    "\\sin^{<>}{<>}",
                    {
                        i(1, snip.captures[2]),
                        d(1, get_visual),
                    }
                )
            )
        end
    end)
),

s({
    trig = '(%[?)(%d?)(%]?)cos',
    regTrig = true,
    wordTrig = false,
    snippetType = 'autosnippet',
	condition = in_mathzone,
},
    d(1, function(_, snip)
        if snip.captures[1] == "" then
            return sn(nil,
                fmta(
                    "\\cos{<>}",
                    {
                        d(1, get_visual),
                    }
                )
            )
        else
            return sn(nil,
                fmta(
                    "\\cos^{<>}{<>}",
                    {
                        i(1, snip.captures[2]),
                        d(2, get_visual),
                    }
                )
            )
        end
    end)
),

s({
    trig = '(%[?)(%d?)(%]?)tan',
    regTrig = true,
    wordTrig = false,
    snippetType = 'autosnippet',
	condition = in_mathzone,
},
    d(1, function(_, snip)
        if snip.captures[1] == "" then
            return sn(nil,
                fmta(
                    "\\tan{<>}",
                    {
                        d(1, get_visual),
                    }
                )
            )
        else
            return sn(nil,
                fmta(
                    "\\tan^{<>}{<>}",
                    {
                        i(1, snip.captures[2]),
                        d(2, get_visual),
                    }
                )
            )
        end
    end)
),



}
