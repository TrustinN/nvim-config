----------------------------------------------------------------------------
--Tikz Basic
---------------------------------------------------------------------------

local helpers = require('plugins/luasnip-helper-funcs')
local in_tikz = helpers.in_tikz
local in_tikz_cd = helpers.in_tikzcd
local in_tikz_graph = helpers.in_tikzgraph
local not_in_center = helpers.not_in_center
local str_conv = helpers.str_conv
local mat = helpers.mat

return {

s({trig = 'tikz', priority = 500, wordTrig = false, snippetType = 'autosnippet'},
    fmta([[
    \begin{<>}<>
    <>
    \end{<>}
    ]],
        {
            c(1, {
                i(1, "tikzpicture"),
                t("tikzcd"),
                t("tikzgraph"),
            }),
            i(2),
            d(3, mat, {}, {
                user_args = {
                    function(snip) snip.rows = snip.rows + 1 end,
                    function(snip) snip.rows = math.max(snip.rows - 1, 1) end,
                    function(snip) snip.cols = snip.cols + 1 end,
                    function(snip) snip.cols = math.max(snip.cols - 1, 1) end,
                }
            }),
            rep(1),
        }
    )
),

s({trig = 'tikz', priority = 1000, wordTrig = false, snippetType = 'autosnippet'},
    fmta([[
    \begin{center}
        \begin{<>}<>
    <>
        \end{<>}
    \end{center}
    ]],
        {
            c(1, {
                i(1, "tikzpicture"),
                t("tikzcd"),
                t("tikzgraph"),
            }),
            i(2),
            d(3, mat, {}, {
                user_args = {
                    function(snip) snip.rows = snip.rows + 1 end,
                    function(snip) snip.rows = math.max(snip.rows - 1, 1) end,
                    function(snip) snip.cols = snip.cols + 1 end,
                    function(snip) snip.cols = math.max(snip.cols - 1, 1) end,
                    "2",
                }
            }),
            rep(1),
        }
    ),
    { condition = not_in_center }
),




}
