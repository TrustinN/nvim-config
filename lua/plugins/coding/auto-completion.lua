return {
    ---------------------------------------------------------------------------
    --Auto-Completion
    ---------------------------------------------------------------------------

    {
        "Exafunction/codeium.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "hrsh7th/nvim-cmp",
        },
        config = function()
            require("codeium").setup({
            })
        end
    },
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-calc',
            'saadparwaiz1/cmp_luasnip',
        },
        config = function()
            require(vim.g.CODING_CONFIG_DIR .. "cmp")
        end,
    },
    {
	    'onsails/lspkind.nvim',
    },
}


