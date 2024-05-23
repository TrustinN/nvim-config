return {
    ---------------------------------------------------------------------------
    --File Navigation
    ---------------------------------------------------------------------------

    {'nvim-telescope/telescope.nvim',
        config = function()
            require("plugins.config.telescope.telescope")
        end
    },
	'nvim-telescope/telescope-fzy-native.nvim',
	'nvim-telescope/telescope-frecency.nvim',
	'kkharji/sqlite.lua',
    {'nvim-tree/nvim-tree.lua',
        config = function()
            require("plugins.config.nvim-tree")
        end
    },
	'nvim-tree/nvim-web-devicons',
    {'akinsho/bufferline.nvim'},
	'moll/vim-bbye',

    ---------------------------------------------------------------------------
    --Cursor Navigation
    ---------------------------------------------------------------------------

	'tpope/vim-repeat',
    {'karb94/neoscroll.nvim',
        config = function()
            require("plugins.config.neoscroll")
        end
    },
}



