return {
    ---------------------------------------------------------------------------
    --File Navigation
    ---------------------------------------------------------------------------

    {'nvim-telescope/telescope.nvim',
        dependencies = {
            { 'nvim-lua/plenary.nvim' },
            { 'nvim-lua/popup.nvim' },
            { 'nvim-telescope/telescope-fzf-native.nvim',
                build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' 
            },
            { 'nvim-telescope/telescope-frecency.nvim' },
            { 'nvim-telescope/telescope-media-files.nvim' },
        },
        config = function()
            require(vim.g.TELESCOPE_CONFIG_DIR .. "telescope")
        end
    },
	'kkharji/sqlite.lua',
    {'nvim-tree/nvim-tree.lua',
        config = function()
            require(vim.g.NVIM_TREE_CONFIG_DIR .. "nvim-tree")
        end
    },
	'nvim-tree/nvim-web-devicons',
    {'akinsho/bufferline.nvim'},
	'moll/vim-bbye',
    {
        "folke/trouble.nvim",
        opts = {}, -- for default options, refer to the configuration section for custom setup.
        cmd = "Trouble",
        keys = {
            {
                "<leader>xx",
                "<cmd>Trouble diagnostics toggle<cr>",
                desc = "Diagnostics (Trouble)",
            },
            {
                "<leader>xX",
                "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
                desc = "Buffer Diagnostics (Trouble)",
            },
            {
                "<leader>cs",
                "<cmd>Trouble symbols toggle focus=false<cr>",
                desc = "Symbols (Trouble)",
            },
            {
                "<leader>cl",
                "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
                desc = "LSP Definitions / references / ... (Trouble)",
            },
            {
                "<leader>xL",
                "<cmd>Trouble loclist toggle<cr>",
                desc = "Location List (Trouble)",
            },
            {
                "<leader>xQ",
                "<cmd>Trouble qflist toggle<cr>",
                desc = "Quickfix List (Trouble)",
            },
        },
    },

    ---------------------------------------------------------------------------
    --Cursor Navigation
    ---------------------------------------------------------------------------

    -- {
    --     "m4xshen/hardtime.nvim",
    --     dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
    --     opts = {
    --         disabled_filetypes = {
    --             "NvimTree",
    --             "TelescopePrompt",
    --             "alpha",
    --             "checkhealth",
    --             "dapui*",
    --             "Dressing*",
    --             "help",
    --             "lazy",
    --             "lspinfo",
    --             "mason",
    --             "neo%-tree*",
    --             "netrw",
    --         },
    --     },
    -- },
    -- {
    --     "tris203/precognition.nvim",
    --     config = function()
    --         require("precognition").toggle()
    --     end
    -- },
	'tpope/vim-repeat',
    {'karb94/neoscroll.nvim',
        config = function()
            require(vim.g.NAVIGATION_CONFIG_DIR .. "neoscroll")
        end
    },

}



