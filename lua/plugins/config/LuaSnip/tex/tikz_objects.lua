----------------------------------------------------------------------------
--Tikz Objects
---------------------------------------------------------------------------

local helpers = require('plugins/config/LuaSnip/luasnip-helper-funcs')
local in_tikz = helpers.in_tikz
local in_tikz_cd = helpers.in_tikzcd
local in_tikz_graph = helpers.in_tikzgraph
local not_in_center = helpers.not_in_center
local str_conv = helpers.str_conv
local mat = helpers.mat

return {

s({trig = 'scope', wordTrig = false, snippetType = 'autosnippet'},
    fmta([[
        \begin{scope}<>
            <>
        \end{scope}
    ]],
        {
            i(1),
            i(2),
        }
    )
),

s({trig = 'node', wordTrig = false, snippetType = 'autosnippet'},
    c(1, {
        fmta(
            "\\node[<>] (<>) {<>};",
            {
                i(1, "above", { node_ext_opts = { active = { virt_text = {{"style"}} } } }),
                i(2, "nodeA", { node_ext_opts = { active = { virt_text = {{"name"}} } } }),
                i(3, "$A$", { node_ext_opts = { active = { virt_text = {{"display"}} } } }),
            }
        ),
        fmta(
            "\\node[<>] (<>) at (<>) {<>};",
            {
                i(1, "above", { node_ext_opts = { active = { virt_text = {{"style"}} } } }),
                i(2, "nodeA", { node_ext_opts = { active = { virt_text = {{"name"}} } } }),
                i(3, "0, 0", { node_ext_opts = { active = { virt_text = {{"position"}} } } }),
                i(4, "$A$", { node_ext_opts = { active = { virt_text = {{"display"}} } } }),
            }
        ),
        fmta(
            "node[<>] {<>}",
            {
                i(1, "above", { node_ext_opts = { active = { virt_text = {{"style"}} } } }),
                i(2, "$A$", { node_ext_opts = { active = { virt_text = {{"display"}} } } }),
            }
        ),
    })
    ,
    { condition = in_tikz }
),

s({trig = 'crd', wordTrig = false, snippetType = 'autosnippet'},
    fmta(
        "\\coordinate[<>] (<>) at (<>);",
        {
            i(1, "", { node_ext_opts = { active = { virt_text = {{"style"}} } } }),
            i(2, "A", { node_ext_opts = { active = { virt_text = {{"name"}} } } }),
            i(3, "0, 0", { node_ext_opts = { active = { virt_text = {{"point"}} } } }),
        }
    ),
    { condition = in_tikz }
),

s({trig = 'drw', priority = 750, wordTrig = false, snippetType = 'autosnippet'},
    fmta(
        "\\draw[<>] <>;",
        {
            i(1, "", { node_ext_opts = { active = { virt_text = {{"style"}} } } }),
            i(2),
        }
    ),
    { condition = in_tikz }
),

s({trig = 'fdrw', priority = 1000, wordTrig = false, snippetType = 'autosnippet'},
    fmta(
        "\\filldraw[<>] <>;",
        {
            i(1, "", { node_ext_opts = { active = { virt_text = {{"style"}} } } }),
            i(2),
        }
    ),
    { condition = in_tikz }
),

s({trig = 'pth', wordTrig = false, snippetType = 'autosnippet'},
    fmta(
        "\\path[<>] <>;",
        {
            i(1, "", { node_ext_opts = { active = { virt_text = {{"style"}} } } }),
            i(2),
        }
    ),
    { condition = in_tikz }
),

}




