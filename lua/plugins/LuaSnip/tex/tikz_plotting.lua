----------------------------------------------------------------------------
--Tikz Plotting
---------------------------------------------------------------------------

local helpers = require('plugins/luasnip-helper-funcs')
local in_tikz = helpers.in_tikz
local in_tikz_cd = helpers.in_tikzcd
local specific_lister = helpers.specific_lister

return{

---------------------------------------------------------------------------
--Plot Types
---------------------------------------------------------------------------

s({trig = "pgf", priority = 1, wordtrig = false, regtrig = true, snippetType = 'autosnippet'},
    fmta(
        [[
        \begin{center}
            \begin{tikzpicture}[samples=50]
                \begin{axis}
                    <>
                \end{axis}
            \end{tikzpicture}
        \end{center}
        ]],
        {
            i(1),
        }
    )
),

s({trig = "plot", snippetType = 'autosnippet'},
    fmta(
        "\\addplot[blue, thick] {<>}",
        {
            i(1),
        }
    )
),













}
