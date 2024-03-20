local Terminal  = require('toggleterm.terminal').Terminal
local Python_Ok = Terminal:new({
    size = 40,
    on_open = function() vim.cmd([[
        :term python3 ok --local --no-browser
        :stopinsert!
        nnoremap <buffer><silent>q <Cmd>Bdelete<CR><Cmd>close<CR>
    ]]) end,
    direction = "vertical",
    close_on_exit = false,
})
local Python_Ok_Unlock = Terminal:new({
    size = 40,
    on_open = function() vim.cmd([[
        :term python3 ok --local --no-browser -u
        :stopinsert!
        nnoremap <buffer><silent>q <Cmd>Bdelete<CR><Cmd>close<CR>
    ]]) end,
    direction = "vertical",
    close_on_exit = false,
})

function python_ok()
    return Python_Ok:toggle()
end

function python_ok_unlock()
    return Python_Ok_Unlock:toggle()
end

vim.cmd([[
    nnoremap <buffer><leader>l <Cmd>CompilerOpen<CR>
    nnoremap <buffer><leader>u <Cmd>lua python_ok_unlock()<CR>
    nnoremap <buffer><leader>k <Cmd>lua python_ok()<CR>
]])






