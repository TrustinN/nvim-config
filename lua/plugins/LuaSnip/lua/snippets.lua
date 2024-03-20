---------------------------------------------------------------------------
--Snippets Creation
----------------------------------------------------------------------------

local helpers = require('plugins/luasnip-helper-funcs')
local get_visual = helpers.get_visual
local emp_lister = helpers.emp_lister

return{

s({trig = "snip;", wordTrig = false, snippetType = "autosnippet"},
    fmta([[
        s({trig = "<>", wordTrig = <>, regTrig = <>, snippetType = 'autosnippet'},
            <>
        ),
    ]],
        {
            i(1),
            i(2, "false"),
            i(3, "false"),
            i(4),
        }
    )
),

s({trig = "fmta", wordTrig = false, regTrig = false, snippetType = 'autosnippet'},
    c(1, {
        fmta([[
            fmta(
                "<>",
                {
                    <>
                }
            )
        ]],
            {
                i(1),
                d(2, get_visual),
            }
        ),
        fmta([=[
            fmta([[
                <>
            ]],
                {
                    <>
                }
            )
        ]=],
            {
                i(1),
                d(2, get_visual),
            }
        ),
        fmta(
            "fmta(\"<>\", {<>})",
            {
                i(1),
                d(2, get_visual),
            }
        ),
    })
),

s({trig = "inode", wordTrig = false, regTrig = false, snippetType = 'autosnippet'},
    fmta(
        "i(<>, \"<>\", { node_ext_opts = { active = { virt_text = {{\"<>\"}} } } })",
        {
            i(1),
            i(2),
            i(3),
        }
    )
),

s({trig = "fnode", wordTrig = false, regTrig = false, snippetType = 'autosnippet'},
    c(1, {
        fmta(
            "f(<>, {<>})",
            {
                r(1, "1", i(1)),
                r(2, "2", i(1)),
            }
        ),
        fmta(
            "f(<>, {<>}, { user_args = {<>} })",
            {
                r(1, "1", i(1)),
                r(2, "2", i(1)),
                r(3, "3", i(1)),
            }
        )
    })
),

s({trig = "dnode", wordTrig = false, regTrig = false, snippetType = 'autosnippet'},
    c(1, {
        fmta(
            "d(<>, <>)",
            {
                r(1, "1", i(1)),
                r(2, "2", i(1)),
            }
        ),
        fmta(
            "d(<>, <>, {<>})",
            {
                r(1, "1", i(1)),
                r(2, "2", i(1)),
                r(3, "3", i(1)),
            }
        ),
        fmta([[
            d(<>, <>, {<>}, { 
                user_args = {
                    <>
                }
            })
            ]],
            {
                r(1, "1", i(1)),
                r(2, "2", i(1)),
                r(3, "3", i(1)),
                c(4, {
                    i(1),
                    t({
                        "function(snip) snip.rows = snip.rows + 1 end,",
                        "\t\tfunction(snip) snip.rows = math.max(snip.rows - 1, 1) end,",
                        "\t\tfunction(snip) snip.cols = snip.cols + 1 end,",
                        "\t\tfunction(snip) snip.cols = math.max(snip.cols - 1, 1) end,",
                    }),
                })
            }
        )
    })
),

s({trig = "rnode", wordTrig = false, regTrig = false, snippetType = 'autosnippet'},
    fmta(
        "r(<>, \"<>\", <>)",
        {
            i(1),
            i(2),
            d(3, get_visual),
        }
    )
),

s({trig = "cnode", wordTrig = false, regTrig = false, snippetType = 'autosnippet'},
    fmta([[
        c(<>, {<>})
    ]],
        {
            i(1),
            d(2, emp_lister, {}, {
                user_args = {
                    function(snip) snip.rows = snip.rows + 1 end,
                    function(snip) snip.rows = math.max(snip.rows - 1, 1) end,
                    function(snip) snip.cols = snip.cols + 1 end,
                    function(snip) snip.cols = math.max(snip.cols - 1, 1) end,
                }
            }),
        }
    )
),

s({trig = "snode", wordTrig = false, regTrig = false, snippetType = 'autosnippet'},
    fmta(
        "sn(<>, {<>})",
        {
            i(1),
            d(2, emp_lister, {}, {
                user_args = {
                    function(snip) snip.rows = snip.rows + 1 end,
                    function(snip) snip.rows = math.max(snip.rows - 1, 1) end,
                    function(snip) snip.cols = snip.cols + 1 end,
                    function(snip) snip.cols = math.max(snip.cols - 1, 1) end,
                }
            }),
        }
    )
),



}
