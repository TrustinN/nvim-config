---------------------------------------------------------------------------
--Leader Map
---------------------------------------------------------------------------

require "config.functions-init"
require "config.plugin-setup"
require "user.reload"

vim.g.mapleader = ' '
if not vim.g.neovide then
    vim.cmd([[
        nnoremap <silent><leader><CR> <Cmd>w<CR><Cmd>lua ReloadConfig() <CR>
    ]])
end

---------------------------------------------------------------------------
--Plugins
---------------------------------------------------------------------------

require "config.lazy-config"

require "config.catppuccin"
require "config.colorscheme"
require "plugins.feline"
require "plugins.telescope.telescope-bg.backgrounds"
require "plugins.telescope.telescope-bg.bg-commands"

require "plugins.lua-snip"
require "plugins.cmp"

require "config.mappings"

require "plugins.neoscroll"
require "plugins.nvim-tree"
require "plugins.telescope.telescope"
require "plugins.bufferline"
require "config.indent-blankline"

---------------------------------------------------------------------------
--Debugging/Lsp
---------------------------------------------------------------------------

require "user.lsp.mason"
require "config.python"
require "plugins.jupyter-vim"
require "plugins.nvim-dap"


require "config.alpha"








