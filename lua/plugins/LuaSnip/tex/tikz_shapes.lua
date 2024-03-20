----------------------------------------------------------------------------
--Tikz Shapes
---------------------------------------------------------------------------

local helpers = require('plugins/luasnip-helper-funcs')
local in_tikz = helpers.in_tikz
local in_tikz_cd = helpers.in_tikzcd
local in_tikz_graph = helpers.in_tikzgraph
local not_in_center = helpers.not_in_center
local str_conv = helpers.str_conv
local mat = helpers.mat

return{

s({trig = "circ", wordTrig = false, snippetType = "autosnippet"},
    c(1, {
        t("circle"),
        fmta(
            "circle [radius=<>]",
            {
                i(1),
            }
        )
    }),
    { condition = in_tikz }
),

s({trig = "ellip", wordTrig = false, snippetType = "autosnippet"},
    c(1, {
        t("ellipse"),
        fmta(
            "ellipse [x radius=<>, y radius=<>]",
            {
                i(1),
                i(2),
            }
        ),
    }),
    { condition = in_tikz }
),

s({trig = "rect", wordTrig = false, snippetType = "autosnippet"},
    t("rectangle"),
    { condition = in_tikz }
),

s({trig = "help", wordTrig = false, snippetType = "autosnippet"},
    t("help lines"),
    { condition = in_tikz }
),

s({trig = "([xy])s", regTrig = true, wordTrig = false, snippetType = "autosnippet"},
    fmta(
        "<>shift=<>",
        {
            f( function(_, snip) return snip.captures[1] end ),
            i(1),
        }
    ),
    { condition = in_tikz }
),




}
