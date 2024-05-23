return {
	'neovim/nvim-lspconfig',
	{'williamboman/mason.nvim', build = ':MasonUpdate',
        config = function()
            require("user.lsp.mason")
        end
    },
}

