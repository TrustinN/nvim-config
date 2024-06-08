local path = { '%:p:h/.config/nvim/user/lsp/settings/' }
local servers = {
	"lua_ls",
    "python",
    "julia",
    "tsserver",
}
local border = {
      {"🭽", "FloatBorder"},
      {"▔", "FloatBorder"},
      {"🭾", "FloatBorder"},
      {"▕", "FloatBorder"},
      {"🭿", "FloatBorder"},
      {"▁", "FloatBorder"},
      {"🭼", "FloatBorder"},
      {"▏", "FloatBorder"},
}

vim.diagnostic.config({
  virtual_text = false
})

local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
    opts = opts or {}
    opts.border = opts.border or border
    return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

-- Show line diagnostics automatically in hover window
vim.o.updatetime = 500
vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]

require("mason").setup()

require("lspconfig").lua_ls.setup {
    settings = {
        Lua = {
            diagnostics = {
                globals = {"vim"},
            }
        }
    },
}
require("lspconfig").pylsp.setup {}
require("lspconfig").julials.setup{
    julia_env_path = "%:p:h/.julia/environments/nvim-lspconfig",
}
require("lspconfig").tsserver.setup {}
require("lspconfig").clangd.setup {}



