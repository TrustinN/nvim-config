---------------------------------------------------------------------------
--Programming
---------------------------------------------------------------------------

local helpers = require('plugins/config/LuaSnip/luasnip-helper-funcs')
local get_visual = helpers.get_visual

return{

s({trig = "fnc", wordTrig = false, regTrig = false, snippetType = 'autosnippet'},
    c(1, {
        fmta([[
            function(<>)
                <>
            end
        ]],
            {
                r(1, "2", i(1)),
                d(2, get_visual),
            }
        ),
        fmta([[
            function = <>(<>)
                <>
            end
        ]],
            {
                i(1),
                r(2, "2", i(1)),
                d(3, get_visual),
            }
        )
    })
),

s({trig = "for;", wordTrig = false, regTrig = false, snippetType = 'autosnippet'},
    c(1, {
        fmta([[
            for <> = <>, <> do
                <>
            end
        ]],
            {
                r(1, "1", i(1)),
                r(2, "2", i(1)),
                r(3, "3", i(3)),
                d(4, get_visual),
            }
        ),
        fmta([[
            for <> = <>, <>, <> do
                <>
            end
        ]],
            {
                r(1, "1", i(1)),
                r(2, "2", i(1)),
                r(3, "3", i(3)),
                i(4),
                d(5, get_visual),
            }
        )
    })
),

s({trig = "rq", wordTrig = false, regTrig = false, snippetType = 'autosnippet'},
    c(1, {
        fmta(
            "local <> = require(\"<>\")",
            {
                i(1),
                r(2, "2", i(1)),
            }
        ),
        fmta(
            "require(\"<>\").<>(<>)",
            {
                r(1, "2", i(1)),
                i(2),
                i(3),
            }
        ),
    })
),

s({trig = "note", wordTrig = false, regTrig = false, snippetType = 'snippet'},
    fmta([[
        ---------------------------------------------------------------------------
        --<>
        ---------------------------------------------------------------------------

    ]],
        {
            d(1, get_visual),
        }
    )
),
















}
