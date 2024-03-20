function Set_HTML_Path()
    vim.env.MY_HTML_PATH = vim.fn.expand("%:p:h")
end

vim.keymap.set("n", "<leader>l", [[<Cmd>w<CR><Cmd>cd %:p:h<CR><Cmd>lua Set_HTML_Path()<CR><Cmd>call jobstart("~/.config/nvim/shellscripts/browser-sync.sh", {"detatch":1})<CR>]], { silent = true, buffer = true })

-- <Cmd>silent !/opt/homebrew/bin/hs -c "split_window('Safari')"<CR>








