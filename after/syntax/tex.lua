vim.cmd([[
    call vimtex#syntax#core#new_env({
        \ 'name': 'tikzcd',
        \ 'math': v:true
        \ })

    call vimtex#syntax#core#new_env({
        \ 'name': 'tikzgraph',
        \ 'math': v:true
        \ })
]])



