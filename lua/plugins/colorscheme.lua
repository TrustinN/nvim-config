return {
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
}



