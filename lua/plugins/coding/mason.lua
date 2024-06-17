return {
	{
        'williamboman/mason.nvim',
        dependencies = {
            { "williamboman/mason-lspconfig.nvim" },
        },
        build = ':MasonUpdate',
        config = function()
            require("mason").setup()

            require("mason-lspconfig").setup({
                ensure_installed = {
                    "clangd",
                    "cmake",
                    "julials",
                    "lua_ls",
                    "pylsp",
                }
            })

        end,
    },

}
