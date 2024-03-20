local helpers = require('plugins/luasnip-helper-funcs')
local get_visual = helpers.get_visual

return{

s({trig = "letter;", wordTrig = false, regTrig = false, snippetType = 'autosnippet'},
    fmta([[
        %! TeX root = <>

        \documentclass{article}
        \usepackage{/Users/trustinnguyen/MyStyle/letter/letter}

        \begin{document}

        <>


        \end{document}
    ]],
        {
            f( function() return vim.fn.eval("buffer_name()") end ),
            i(1),
        }
    )
),

s({trig = "from;", wordTrig = false, regTrig = false, snippetType = 'autosnippet'},
    fmta([[
        \begin{minipage}{\linewidth}
            <> \\
            <> \\
            <>
        \end{minipage}\bigskip

        <>\bigskip

        <>
    ]],
        {
            i(1, "", { node_ext_opts = { active = { virt_text = {{"Name"}} } } }),
            i(2, "", { node_ext_opts = { active = { virt_text = {{"Street"}} } } }),
            i(3, "", { node_ext_opts = { active = { virt_text = {{"State, City, ZIP"}} } } }),
            i(4, "", { node_ext_opts = { active = { virt_text = {{"Date"}} } } }),
            i(5),
        }
    )
),

s({trig = "to;", wordTrig = false, regTrig = false, snippetType = 'autosnippet'},
    fmta([[
        \begin{minipage}{\linewidth}
            <> \\
            <> \\
            <>
        \end{minipage}\bigskip

        <>
    ]],
        {
            i(1, "", { node_ext_opts = { active = { virt_text = {{"Name"}} } } }),
            i(2, "", { node_ext_opts = { active = { virt_text = {{"Street"}} } } }),
            i(3, "", { node_ext_opts = { active = { virt_text = {{"State, City, ZIP"}} } } }),
            i(4),
        }
    )
),



}
