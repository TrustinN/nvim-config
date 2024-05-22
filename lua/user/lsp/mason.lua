local path = { '%:p:h/.config/nvim/user/lsp/settings/' }
local servers = {
	"lua_ls",
    "python",
    "julia",
    "tsserver",
}

require("mason").setup()
require("lspconfig").lua_ls.setup{
    settings = {
        Lua = {
            diagnostics = {
                globals = {"vim"},
            }
        }
    }
}
require("lspconfig").pylsp.setup{}
require("lspconfig").julials.setup{
    julia_env_path = "%:p:h/.julia/environments/nvim-lspconfig"
}
require("lspconfig").tsserver.setup{}
require("lspconfig").clangd.setup{}



