vim.cmd([[
    nnoremap <buffer> <leader><CR> <Cmd>silent w<CR><Cmd>LilyCmp<CR><Cmd>! open -g -a skim %:p:h<CR>
]])





