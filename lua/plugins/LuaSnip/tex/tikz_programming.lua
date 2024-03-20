----------------------------------------------------------------------------
--Tikz Programming
---------------------------------------------------------------------------

local helpers = require('plugins/luasnip-helper-funcs')
local in_tikz = helpers.in_tikz
local in_tikz_cd = helpers.in_tikzcd
local in_tikz_graph = helpers.in_tikzgraph
local not_in_center = helpers.not_in_center
local str_conv = helpers.str_conv
local mat = helpers.mat

return{

s({trig = 'for', wordTrig = false, snippetType = 'autosnippet'},
    c(1, {
        fmta(
            "\\foreach \\<> in {<>}",
            {
                i(1),
                i(2),
            }
        ),
        fmta(
            "\\foreach \\<>/\\<> in {<>}",
            {
                i(1),
                i(2),
                i(3),
            }
        ),
    }),
    { condition = in_tikz }
),





}
