vim.diagnostic.config({
  virtual_text = false
})

local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
    opts = opts or {}
    -- opts.border = opts.border or border
    opts.border = "rounded"
    return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

-- Show line diagnostics automatically in hover window
vim.o.updatetime = 500
vim.cmd [[autocmd CursorHold * lua vim.diagnostic.open_float(nil, {focus=false})]]


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
require("lspconfig").clangd.setup {}
require'lspconfig'.cmake.setup{}
