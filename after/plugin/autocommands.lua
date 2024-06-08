---------------------------------------------------------------------------
--Auto-Commands
---------------------------------------------------------------------------

local Display = vim.api.nvim_create_augroup('Display', { clear = true })
vim.api.nvim_create_autocmd({"ModeChanged"}, {
    group = Display,
    pattern = {"*:n*"},
    command = "set conceallevel=2",
})
vim.api.nvim_create_autocmd({"ModeChanged"}, {
    group = Display,
    pattern = {"n*:*"},
    command = "set conceallevel=0",
})

local kitty = vim.api.nvim_create_augroup('kitty', { clear = true })
vim.api.nvim_create_autocmd({"BufWritePost"}, {
    group = kitty,
    pattern = {vim.fn.expand("~/.config/kitty/kitty.conf")},
    command = "silent !kill -SIGUSR1 $(pgrep -a kitty)"
})

local Python = vim.api.nvim_create_augroup('Python', { clear = true })
vim.api.nvim_create_autocmd({"BufEnter"}, {
    group = Python,
    pattern = {"*.py"},
    callback = function()
        vim.cmd("luafile ~/.config/nvim/lua/plugins/config/hydra/dap-python.lua")
    end
})

local Cpp = vim.api.nvim_create_augroup('Cpp', { clear = true })
vim.api.nvim_create_autocmd({"BufEnter"}, {
    group = Cpp,
    pattern = {"*.cpp", "*.tpp"},
    callback = function()
        vim.opt.filetype = 'cpp'
        vim.cmd("luafile ~/.config/nvim/lua/plugins/config/hydra/dap-cpp.lua")
    end
})

---------------------------------------------------------------------------
--Neovide Config
---------------------------------------------------------------------------

if vim.g.neovide then
    vim.cmd([[
        :function Save_Clip()
            :w
            :! LANG=en_US.UTF-8 pbcopy < %
            :q
        endfunction

        autocmd!
            let g:neovide_cursor_animate_command_line = v:true
            let g:neovide_hide_mouse_when_typing = v:true
            let g:neovide_scroll_animation_length = 0.15
            set guifont=Hack\ Nerd\ Font\ Mono
            let g:neovide_remember_window_size = v:true
        augroup END

        nnoremap <leader><CR> <Cmd>call Save_Clip()<CR>
    ]])
    vim.g.neovide_input_use_logo = 1
    vim.api.nvim_set_keymap('', '<D-v>', '+p<CR>', { noremap = true, silent = true})
    vim.api.nvim_set_keymap('!', '<D-v>', '<C-R>+', { noremap = true, silent = true})
    vim.api.nvim_set_keymap('t', '<D-v>', '<C-R>+', { noremap = true, silent = true})
    vim.api.nvim_set_keymap('v', '<D-v>', '<C-R>+', { noremap = true, silent = true})
end





