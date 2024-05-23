return {

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
	'neovim/nvim-lspconfig',
	{'williamboman/mason.nvim', build = ':MasonUpdate',
        config = function()
            require("user.lsp.mason")
        end
    },
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
    {"nvim-treesitter/nvim-treesitter",
        build = function()
            require("nvim-treesitter.install").update({ with_sync = true })
        end,
        config = function()
            require("plugins.config.treesitter")
        end
    },

    ---------------------------------------------------------------------------
    --Debugging
    ---------------------------------------------------------------------------

    {"mfussenegger/nvim-dap",
        config = function()
            require("plugins.config.nvim-dap")
        end
    },
    "mfussenegger/nvim-dap-python",
    "folke/neodev.nvim",
    { "rcarriga/nvim-dap-ui", dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} },
    "theHamsta/nvim-dap-virtual-text",

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

    ---------------------------------------------------------------------------
    --LuaSnip
    ---------------------------------------------------------------------------

    {
        "L3MON4D3/LuaSnip",
        version = "v2.0.0",
        build = "make install_jsregexp",
        config = function ()
            require("plugins.config.lua-snip")
        end
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



}


