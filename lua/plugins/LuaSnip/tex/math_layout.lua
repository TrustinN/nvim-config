----------------------------------------------------------------------------
--Layout
----------------------------------------------------------------------------

local helpers = require('plugins/luasnip-helper-funcs')
local get_visual = helpers.get_visual
local not_in_mathzone = helpers.not_in_mathzone
local in_examples = helpers.in_examples

return {

s({trig = 'preamble', snippetType = 'autosnippet'},
	fmta([[
        %! TeX root = <>

        \documentclass{<>}
        \usepackage{/Users/trustinnguyen/.mystyle/math/packages/mypackages}
        \usepackage{/Users/trustinnguyen/.mystyle/math/commands/mycommands}
        \usepackage{/Users/trustinnguyen/.mystyle/math/environments/<>}
        \graphicspath{{./figures/}}

        \title{<>}
        \author{Trustin Nguyen}

        \begin{document}
        <>
            \maketitle
        <>
        \reversemarginpar

        <>



        \end{document}
	]],
		{
            f( function() return vim.fn.eval("buffer_name()") end ),
			i(1),
            f(
                function(args)
                    if args[1][1] == "report" then
                        return "report"
                    else
                        return "article"
                    end
                end, {1}
            ),
			i(2),
            d(3, function(args, _, _)
                if args[1][1] == "report" then
                    return sn(nil, {t({"\\newgeometry{", "\ttotal={150mm,235mm},", "}", "\\begin{titlepage}"})})
                else
                    return sn(nil, {})
                end
            end, {1}),
            d(4, function(args, _, _)
                if args[1][1] == "report" then
                    return sn(nil, {t({"\\end{titlepage}", "", "\\tableofcontents", "\\restoregeometry", ""})})
                else
                    return sn(nil, {})
                end
            end, {1}),
			i(5),
		}
	)
),

s({trig = "ff", wordTrig = true, regTrig = false, snippetType = 'autosnippet'},
    fmta(
        "\\Fref{<>:<>}",
        {
            c(1, {
                t("thm"),
                t("def"),
                t("exm"),
                i(1),
            }),
            i(2),
        }
    ),
    { condition = not_in_mathzone }
),

s({trig='tpc', snippetType='autosnippet'},
	fmta([[
        \begin{topic}
            \section{<>}
        \end{topic}
    ]],
        {
            d(1, get_visual ),
        }
	)
),

s({trig='thy', snippetType='autosnippet'},
    c(1, {
        fmta([=[
            \begin{theorem}{<>}
                <>
            \end{theorem}
            ]=],
            {
                i(1),
                d(2, get_visual ),
            }
        ),
        fmta([=[
            \begin{theorem}[\label{thm:<>}]{<>}
                <>
            \end{theorem}
            ]=],
            {
                r(1, "1", i(1)),
                i(2),
                d(3, get_visual ),
            }
        ),
    })
),

s({trig='dfn', snippetType='autosnippet'}, {
    c(1, {
        fmta([=[
        \begin{definition}{<>}
            <>
        \end{definition}
        ]=],
            {
                r(1, "title"),
                d(2, get_visual ),
            }
        ),
        fmta([=[
            \begin{definition}[\label{def:<>}]{<>}
                <>
            \end{definition}
            ]=],
            {
                r(1, "1", i(1)),
                r(2, "title"),
                d(3, get_visual ),
            }
        )
    })
}, {
    stored = {
        ["title"] = i(1),
    },
}
),

s({trig='exm', priority = 500, snippetType='autosnippet'},
	fmta([[
		\begin{examples}
		    <>
		\end{examples}
	]],
        {
            d(1, get_visual),
        }
	)
),

s({trig = "exm", priority = 1000, wordTrig = false, regTrig = false, snippetType = 'autosnippet'},
    c(1, {
        fmta([[
            \begin{example}
                <>
            \end{example}
        ]],
            {
                r(1, "2", d(1, get_visual)),
            }
        ),
        fmta([[
            \begin{example}[\label{exm:<>}]
                <>
            \end{example}
        ]],
            {
                r(1, "1", i(1)),
                r(2, "2", d(1, get_visual))
            }
        ),
    }),
    { condition = in_examples }
),

s({trig='pset', snippetType='autosnippet'},
	fmta([[
		\begin{exercises}{<>}
			<>
		\end{exercises}
	]],
	{
        i(1, "Problem Sets"),
		d(2, get_visual ),
	}
	)
),

s({trig='sct', snippetType='autosnippet'},
	fmta([[
            \section{<>}
    ]],
        {
            d(1, get_visual ),
        }
	)
),






















}
