---------------------------------------------------------------------------
--Format
---------------------------------------------------------------------------

local helpers = require('plugins/luasnip-helper-funcs')
local get_visual = helpers.get_visual

return {

s({trig = "ns;", wordTrig = false, regTrig = false, snippetType = 'autosnippet'},
    fmta([[
        \new Staff {\clef <> \key <> <> \time <>
            <>
        }
    ]],
        {
            i(1, "treble"),
            i(2, "c"),
            c(3, {t("\\major"), t("\\minor"), i(1)}),
            i(4, "4/4"),
            d(5, get_visual)
        }
    )
),

s({trig = "preamble", wordTrig = false, regTrig = false, snippetType = 'autosnippet'},
    fmta([[
        \header {
            title = "<>"
            composer = "<>"
        }
    ]],
        {
            i(1),
            i(2),
        }
    )
),











}
