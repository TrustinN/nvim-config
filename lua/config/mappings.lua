---------------------------------------------------------------------------
--File Finder
---------------------------------------------------------------------------

vim.keymap.set("n", "ff", "<Cmd>Telescope frecency<CR>")
vim.keymap.set("n", "fh", "<Cmd>Telescope find_files cwd=/Users/trustinnguyen/ hidden=true no_ignore=true<CR>")
vim.keymap.set("n", "gre", "<Cmd>lua require('telescope.builtin').live_grep({hidden=true, no_ignore=true}) <CR>")
vim.keymap.set("n", "<leader>e", "<Cmd>NvimTreeToggle<CR>")

---------------------------------------------------------------------------
--Buffer Navigation
---------------------------------------------------------------------------

vim.keymap.set("n", "-", "<Cmd>normal gk<CR>")
vim.keymap.set("n", "=", "<Cmd>normal gj<CR>")

---------------------------------------------------------------------------
--Window Navigation
---------------------------------------------------------------------------

function Left_Most_Window()
    if vim.fn.win_screenpos(vim.fn.win_getid())[2] == 1 then
        os.execute("/opt/homebrew/bin/hs -c 'focus_left()'")
    else
        vim.cmd("wincmd h")
    end
end

function Right_Most_Window()
    local first_pos = vim.fn.win_screenpos(vim.fn.win_getid())[2]
    vim.cmd("wincmd l")
    if vim.fn.win_screenpos(vim.fn.win_getid())[2] == first_pos then
        os.execute("/opt/homebrew/bin/hs -c 'focus_right()'")
    end
end

vim.keymap.set("t", "<ESC>", "<C-\\><C-n>", { silent = true })

vim.keymap.set("n", "<C-h>", "<Cmd>lua Left_Most_Window()<CR>")
vim.keymap.set("n", "<C-j>", "<Cmd>wincmd j<CR>")
vim.keymap.set("n", "<C-k>", "<Cmd>wincmd k<CR>")
vim.keymap.set("n", "<C-l>", "<Cmd>lua Right_Most_Window()<CR>")

vim.keymap.set("t", "<C-h>", "<Cmd>wincmd h<CR>")
vim.keymap.set("t", "<C-j>", "<Cmd>wincmd j<CR>")
vim.keymap.set("t", "<C-k>", "<Cmd>wincmd k<CR>")
vim.keymap.set("t", "<C-l>", "<Cmd>wincmd l<CR>")

vim.keymap.set("n", "L", "<Cmd>BufferLineCycleNext<CR>", { silent = true })
vim.keymap.set("n", "H", "<Cmd>BufferLineCyclePrev<CR>", { silent = true })
vim.keymap.set("n", "<C-b>", "<Cmd>Bdelete<CR>", { silent = true })

vim.keymap.set("n", "<leader>s", "<Cmd>luafile ~/.config/nvim/lua/plugins/config/telescope/telescope-split.lua<CR>", { silent = true })


---------------------------------------------------------------------------
--Aesthetics
---------------------------------------------------------------------------

vim.keymap.set("n", "<leader>i", "<Cmd>IconPickerNormal<CR>")
vim.keymap.set("n", "<leader>c", "<Cmd>CccPick<CR>")
vim.keymap.set("n", "<leader>bg", "<Cmd>luafile ~/.config/nvim/lua/plugins/config/telescope/telescope-bg/telescope-bg.lua<CR>", { silent = true })
























