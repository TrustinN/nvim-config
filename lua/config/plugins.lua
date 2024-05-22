return{
    ---------------------------------------------------------------------------
    --Coding
    ---------------------------------------------------------------------------

    {
        'linux-cultist/venv-selector.nvim',
        dependencies = { 'neovim/nvim-lspconfig', 'nvim-telescope/telescope.nvim', 'mfussenegger/nvim-dap-python' },
        opts = {
          -- Your options go here
          -- name = "venv",
          -- auto_refresh = false
        },
        event = 'VeryLazy', -- Optional: needed only if you want to type `:VenvSelect` without a keymapping
        keys = {
            -- Keymap to open VenvSelector to pick a venv.
            { '<leader>vs', '<cmd>VenvSelect<cr>' },
            -- Keymap to retrieve the venv from a cache (the one previously used for the same project directory).
            { '<leader>vc', '<cmd>VenvSelectCached<cr>' },
        },
    },
    {
        "kawre/leetcode.nvim",
        build = ":TSUpdate html",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-telescope/telescope.nvim",
            "nvim-lua/plenary.nvim", -- required by telescope
            "MunifTanjim/nui.nvim",

            -- optional
            "rcarriga/nvim-notify",
            "nvim-tree/nvim-web-devicons",
        },
        opts = {
            -- configuration goes here
        },
    },
	{'williamboman/mason.nvim', build = ':MasonUpdate'},
	'neovim/nvim-lspconfig',
    {'numToStr/Comment.nvim',
        config = function()
            require("Comment").setup()
        end
    },
    {
        "Zeioth/compiler.nvim",
        cmd = {"CompilerOpen", "CompilerToggleResults", "CompilerRedo"},
        dependencies = { "stevearc/overseer.nvim" },
        opts = {},
    },
    {
        "stevearc/overseer.nvim",
        commit = "19aac0426710c8fc0510e54b7a6466a03a1a7377",
        cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
        opts = {
            task_list = {
                direction = "bottom",
                min_height = 25,
                max_height = 20,
                default_detail = 1,
                bindings = {
                    ["e"] = "IncreaseDetail",
                    ["c"] = "DecreaseDetail",
                    ["E"] = "IncreaseAllDetail",
                    ["C"] = "DecreaseAllDetail",
                    [","] = "ScrollOutputUp",
                    ["."] = "ScrollOutputDown",
                    ["q"] = "Close",
                },
            },
        },
    },
    {
        "ahmedkhalf/project.nvim",
        config = function()
            require("project_nvim").setup({
                detection_methods = { "lsp", "pattern" },
                patterns = {"*.py", "*.html", "*.jsx", ".m"},
            })
        end
    },
    "turbio/bracey.vim",

    ---------------------------------------------------------------------------
    --Debugging
    ---------------------------------------------------------------------------

    "rcarriga/nvim-dap-ui",
    "folke/neodev.nvim",
    "mfussenegger/nvim-dap",
    "mfussenegger/nvim-dap-python",
    "theHamsta/nvim-dap-virtual-text",

    ---------------------------------------------------------------------------
    --Auto-Completion
    ---------------------------------------------------------------------------

	'hrsh7th/nvim-cmp',
	'hrsh7th/cmp-buffer',
	'hrsh7th/cmp-path',
	'hrsh7th/cmp-cmdline',
	'hrsh7th/cmp-nvim-lsp',
	'hrsh7th/cmp-calc',
	'saadparwaiz1/cmp_luasnip',
	'onsails/lspkind.nvim',

    ---------------------------------------------------------------------------
    --LuaSnip
    ---------------------------------------------------------------------------

    {
        "L3MON4D3/LuaSnip",
        version = "v2.0.0",
        build = "make install_jsregexp"
    },

    ---------------------------------------------------------------------------
    --LaTeX Compiler
    ---------------------------------------------------------------------------

	{'lervag/vimtex', name = "vimtex", lazy = false,
        config = function()
            vim.cmd([[
                let g:tex_flavor='latex'
                let g:vimtex_version_check=0
                let g:vimtex_view_method='skim'
                let g:vimtex_view_skim_sync=1
                let g:vimtex_view_skim_activate=1
                let g:vimtex_quickfix_open_on_warning=0
                let g:vimtex_grammar_textidote={
                \ 'jar': '~/Downloads/Software/textidote.jar',
                \ 'args': '',
                \}
                setlocal spell spelllang=en_us
            ]])
        end
    },

    ---------------------------------------------------------------------------
    --File Navigation
    ---------------------------------------------------------------------------

	'nvim-telescope/telescope.nvim',
	'nvim-telescope/telescope-fzy-native.nvim',
	'kkharji/sqlite.lua',
	'nvim-telescope/telescope-frecency.nvim',
	'nvim-tree/nvim-tree.lua',
	'nvim-tree/nvim-web-devicons',
	'akinsho/bufferline.nvim',
	'moll/vim-bbye',

    ---------------------------------------------------------------------------
    --Cursor Navigation
    ---------------------------------------------------------------------------

	'tpope/vim-repeat',
    'karb94/neoscroll.nvim',
    -- 'christoomey/vim-tmux-navigator',

     ---------------------------------------------------------------------------
     --Colorscheme
     ---------------------------------------------------------------------------

	{'catppuccin/nvim', name = 'catppuccin', lazy = true, priority = 1000},
    'shaunsingh/moonlight.nvim',
    'fenetikm/falcon',
	'freddiehaddad/feline.nvim',
    {'uga-rosa/ccc.nvim',
        config = function()
            require("ccc").setup({
                highlighter = {
                    auto_enable = true,
                    lsp = true,
                },
            })
        end,
    },
    {"nvim-treesitter/nvim-treesitter",
        build = function()
            require("nvim-treesitter.install").update({ with_sync = true })
        end,
        config = function()
            require("plugins.treesitter")
        end
    },

    ---------------------------------------------------------------------------
    --Extras
    ---------------------------------------------------------------------------

    'stevearc/dressing.nvim',
    'rcarriga/nvim-notify',
    {'ziontee113/icon-picker.nvim',
        config = function()
            require("icon-picker").setup({
                disable_legacy_commands = true,
            })
        end,
    },
	'nvim-lua/plenary.nvim',
    { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
    {'akinsho/toggleterm.nvim', version = "*",
        config = function()
        require("toggleterm").setup{
            size = function(term)
                if term.direction == "horizontal" then
                    return 15
                elseif term.direction == "vertical" then
                    return vim.o.columns * 0.4
                end
           end
        }
        end
    },
    {'goolord/alpha-nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
    },
    {"tomiis4/Hypersonic.nvim"},
    "anuvyklack/hydra.nvim",

    ---------------------------------------------------------------------------
    --Games
    ---------------------------------------------------------------------------

    'ThePrimeagen/vim-be-good',
    'seandewar/killersheep.nvim',
    'edluffy/hologram.nvim',
    'MunifTanjim/nui.nvim',
    'tamton-aquib/stuff.nvim',
    'alec-gibson/nvim-tetris',
    {'alanfortlink/blackjack.nvim',
        config = function()
            require("blackjack").setup({
                card_style = "mini",
            })
        end
    },
    {'jim-fx/sudoku.nvim', cmd = "Sudoku",
        config = function()
            require("sudoku").setup({})
        end
    },
    {'martineausimon/nvim-lilypond-suite',
        dependencies = 'MunifTanjim/nui.nvim',
        config = function()
            require('nvls').setup({
                lilypond = {
                    mappings = {
                        player = "<leader>l"
                    }
                }
            })
        end
    },
    'koron/maze3d-vim',
    {
        "NStefan002/speedtyper.nvim",
        cmd = "Speedtyper",
        opts = {
        }
    },
    {
        "NStefan002/15puzzle.nvim",
        cmd = "Play15puzzle",
        config = true,
    },

    ---------------------------------------------------------------------------
    --Julia
    ---------------------------------------------------------------------------

    {'JuliaEditorSupport/julia-vim'},
    "jupyter-vim/jupyter-vim",















}
