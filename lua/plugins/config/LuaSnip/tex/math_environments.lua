---------------------------------------------------------------------------
--Environments
----------------------------------------------------------------------------

local helpers = require('plugins/config/LuaSnip/luasnip-helper-funcs')
local get_visual = helpers.get_visual
local in_mathzone = helpers.in_mathzone
local not_in_align = helpers.not_in_align
local in_align = helpers.in_align
local indent = helpers.indent
local mat = helpers.mat
local tab = helpers.tab
local lister = helpers.lister
local align = helpers.align
local cases = helpers.cases

return {

s({trig='beg', snippetType='autosnippet'},
    fmta(
        [[
        \begin{<>}
            <>
        \end{<>}
        ]],
        {
            i(1),
            d(2, get_visual),
            rep(1),
        }
    )
),

s({trig = '([%s])hs', regTrig = true, wordTrig = false, snippetType = 'autosnippet'},
    fmta("<>\\hspace{30pt} ",
        {
            f( function(_, snip) return snip.captures[1] end )
        }
    )
),

s({trig = 'itm', wordTrig = false, snippetType = 'autosnippet'},
    fmta([[
        \begin{itemize}
        <> 
        \end{itemize}
        ]],
        {
            d(1, lister , {}, {
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

s({ trig = "eqn", snippetType = 'autosnippet'},
    fmta([[
        \begin{equation*}
            <>
        \end{equation*}
        ]],
        {
            d(1, get_visual),
        }
	)
),

ms({
    common = { snippetType = 'autosnippet' },
    { trig = "aln" },
    { trig = "spt" },
},
    fmta([[
        \begin{<>}
        <>
        \end{<>}
        ]],
        {
            f( function(_, snip)
                if snip.env.LS_TRIGGER == "aln" then
                    return "align*"
                else
                    return "split"
                end
            end),
            d(1, align, {}, {
                user_args = {
                    function(snip) snip.rows = snip.rows + 1 end,
                    function(snip) snip.rows = math.max(snip.rows - 1, 1) end,
                    function(snip) snip.cols = snip.cols + 1 end,
                    function(snip) snip.cols = math.max(snip.cols - 1, 1) end,
                }
            }),
            f( function(_, snip)
                if snip.env.LS_TRIGGER == "aln" then
                    return "align*"
                else
                    return "split"
                end
            end),
        }
    )
),

s({trig = "csc", snippetType = 'autosnippet'},
    fmta([[
        \begin{cases}
        <>
        \end{cases}
        ]],
        {
            d(1, cases, {}, {
                user_args = {
                    function(snip) snip.rows = snip.rows + 1 end,
                    function(snip) snip.rows = math.max(snip.rows - 1, 1) end,
                    function(snip) snip.cols = 1 end,
                    function(snip) snip.cols = 1 end,
                }
            })
        }
    )
),

s({ trig = "spt", snippetType = 'autosnippet', regTrig = true},
    fmta([[
        \begin{split}
        <>
        \end{split}
        ]],
        {
            c(1, {
                sn(nil, { f( indent ), i(1) }),
                d(1, align, {}, {
                    user_args = {
                        function(snip) snip.rows = snip.rows + 1 end,
                        function(snip) snip.rows = math.max(snip.rows - 1, 1) end,
                    }
                }),
            }),
        }
    )
),

s({ trig = "tbl", snippetType = 'autosnippet', regTrig = true},
    fmta([[
        \begin{tabular}<>
        <>
        \end{tabular}
        ]],
        {
            d(1, function(_, snip)
                local opt = "{ "
                if not snip.cols then
                    snip.cols = 1
                end
                for i = 1, snip.cols do
                    opt = opt .. "c "
                end
                opt = opt .. "}"
                return sn(nil, { t(opt) })
            end, {2}),
            d(2, tab, {}, {
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

s({ trig = "arry", priority = 500, snippetType = 'autosnippet', regTrig = true, condition = in_mathzone },
    fmta([[
        \begin{array}<>
        <>
        \end{array}
        ]],
        {
            d(1, function(_, snip)
                local opt = "{ "
                if not snip.cols then
                    snip.cols = 1
                end
                for i = 1, snip.cols do
                    opt = opt .. "c "
                end
                opt = opt .. "}"
                return sn(nil, { t(opt) })
            end, {2}),
            d(2, mat, {}, {
                user_args = {
                    function(snip) snip.rows = snip.rows + 1 end,
                    function(snip) snip.rows = math.max(snip.rows - 1, 1) end,
                    function(snip) snip.cols = snip.cols + 1 end,
                    function(snip) snip.cols = math.max(snip.cols - 1, 1) end,
                }
            }),
        }
    ),
    { condition = in_align }
),

s({ trig = "arry", priority = 1000, snippetType = 'autosnippet', regTrig = true},
    fmta([[
        \begin{align*}
            \begin{array}<>
        <>
            \end{array}
        \end{align*}
        ]],
        {
            d(1, function(_, snip)
                local opt = "{ "
                if not snip.cols then
                    snip.cols = 1
                end
                for i = 1, snip.cols do
                    opt = opt .. "c "
                end
                opt = opt .. "}"
                return sn(nil, { t(opt) })
            end, {2}),
            d(2, mat, {}, {
                user_args = {
                    function(snip) snip.rows = snip.rows + 1 end,
                    function(snip) snip.rows = math.max(snip.rows - 1, 1) end,
                    function(snip) snip.cols = snip.cols + 1 end,
                    function(snip) snip.cols = math.max(snip.cols - 1, 1) end,
                    "2",
                }
            }),
        }
    ),
    { condition = not_in_align }
),

}











