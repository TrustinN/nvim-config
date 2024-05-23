return {
    ---------------------------------------------------------------------------
    --Auto-Completion
    ---------------------------------------------------------------------------

    {'hrsh7th/nvim-cmp',
        config = function()
            require("plugins.config.cmp")
        end
    },
	'hrsh7th/cmp-buffer',
	'hrsh7th/cmp-path',
	'hrsh7th/cmp-cmdline',
	'hrsh7th/cmp-nvim-lsp',
	'hrsh7th/cmp-calc',
	'saadparwaiz1/cmp_luasnip',
	'onsails/lspkind.nvim',
}


