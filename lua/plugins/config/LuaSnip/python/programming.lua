---------------------------------------------------------------------------
--Programming
---------------------------------------------------------------------------

local helpers = require('plugins/config/LuaSnip/luasnip-helper-funcs')
local get_visual = helpers.get_visual

return {

s({trig = "{", wordTrig = false, regTrig = false, snippetType = 'autosnippet'},
    fmta(
        "{<>}",
        {
            d(1, get_visual)
        }
    )
),

s({trig = "[", snippetType = 'autosnippet'},
    fmta(
        "[<>]",
        {
            d(1, get_visual)
        }
    )
),

s({trig = "(", wordTrig = false, snippetType = 'autosnippet'},
    fmta(
        "(<>)",
        {
            d(1, get_visual)
        }
    )
),

s({trig = "\"", wordTrig = false, regTrig = false, snippetType = 'autosnippet'},
    fmta(
        "\"<>\"",
        {
            d(1, get_visual)
        }
    )
),


s({trig = "\'", wordTrig = false, regTrig = false, snippetType = 'autosnippet'},
    fmta(
        "\'<>\'",
        {
            d(1, get_visual)
        }
    )
),

s({trig = "note", snippetType = 'autosnippet'},
    fmta([[
        ###############################################################################
        # <> <> #
        ###############################################################################
    ]],
        {
            d(1, get_visual),
            f(function(args)
                return string.rep(" ", 74 - #args[1][1])
            end, {1})

        }
    )
),



















}
