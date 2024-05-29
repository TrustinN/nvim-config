return {
	'neovim/nvim-lspconfig',
	{
        'williamboman/mason.nvim',
        build = ':MasonUpdate',
        config = function()
            require("user.lsp.mason")
        end,
        opts = {
            ensure_installed = {
                "clangd",
                "clang-format",
                "codelldb",
            }
        }
    },
}

