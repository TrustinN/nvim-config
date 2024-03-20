----------------------------------------------------------------------------
--Tikz Arrows
---------------------------------------------------------------------------

local helpers = require('plugins/luasnip-helper-funcs')
local in_tikz = helpers.in_tikz
local in_tikz_cd = helpers.in_tikzcd
local in_tikz_graph = helpers.in_tikzgraph
local not_in_center = helpers.not_in_center
local str_conv = helpers.str_conv
local mat = helpers.mat

return {

s({trig = 'we', wordTrig = false, snippetType = 'autosnippet'},
    t("->"),
    { condition = in_tikz }
),

s({trig = 'ew', wordTrig = false, snippetType = 'autosnippet'},
    t("<-"),
    { condition = in_tikz }
),

s({trig = 'iff', wordTrig = false, snippetType = 'autosnippet'},
    t("<->"),
    { condition = in_tikz }
),

s({trig = 'e-', wordTrig = false, snippetType = 'autosnippet'},
    c(1, { t("north"), i(1, "above") }),
    { condition = in_tikz }
),

s({trig = 'es-', wordTrig = false, snippetType = 'autosnippet'},
    c(1, { t("north west"), i(1, "above left") }),
    { condition = in_tikz }
),

s({trig = 'ef-', wordTrig = false, snippetType = 'autosnippet'},
    c(1, { t("north east"), i(1, "above right") }),
    { condition = in_tikz }
),

s({trig = 'f-', wordTrig = false, snippetType = 'autosnippet'},
    c(1, { t("east"), i(1, "right") }),
    { condition = in_tikz }
),

s({trig = 'd-', wordTrig = false, snippetType = 'autosnippet'},
    c(1, { t("south"), i(1, "below") }),
    { condition = in_tikz }
),

s({trig = 'ds-', wordTrig = false, snippetType = 'autosnippet'},
    c(1, { t("south west"), i(1, "below left") }),
    { condition = in_tikz }
),

s({trig = 'df-', wordTrig = false, snippetType = 'autosnippet'},
    c(1, { t("south east"), i(1, "below right") }),
    { condition = in_tikz }
),

s({trig = 's-', wordTrig = false, snippetType = 'autosnippet'},
    c(1, { t("west"), i(1, "left") }),
    { condition = in_tikz }
),

s({trig = 'to', wordTrig = false, snippetType = 'autosnippet'},
    c(1, {
        fmta(
            "to <>(<>)",
            {
                i(1, "", { node_ext_opts = { active = { virt_text = {{"+ or ++"}} } } }),
                i(2),
            }
        ),
        fmta(
            "to <>[<>](<>)",
            {
                i(1, "", { node_ext_opts = { active = { virt_text = {{"+ or ++"}} } } }),
                c(2, {
                    fmta(
                        "out=<>, in=<>",
                        {
                            i(1),
                            i(2),
                        }
                    ),
                    fmta(
                        "bend <>=<>",
                        {
                            i(1),
                            i(2),
                        }
                    ),
                }),
                i(3),
            }
        ),
    }),
    { condition = in_tikz }
),

}


