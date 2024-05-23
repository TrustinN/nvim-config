---------------------------------------------------------------------------
--Leader Map
---------------------------------------------------------------------------

require "config.functions"
require "config.options"
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
require "config.mappings"
require "config.colorscheme"
require "config.background"
require "plugins.config.alpha"







