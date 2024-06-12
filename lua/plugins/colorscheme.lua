return {
    ---------------------------------------------------------------------------
    --Colorscheme
    ---------------------------------------------------------------------------

	{
        'catppuccin/nvim',
        name = 'catppuccin',
        lazy = true,
        priority = 1000,
        config = function() require(vim.g.COLORSCHEME_CONFIG_DIR .. "catppuccin") end,
    },
    {
        'shaunsingh/moonlight.nvim',
    },
    {
        'fenetikm/falcon',
        lazy = true,
        priority = 1000,
        config = function() require(vim.g.COLORSCHEME_CONFIG_DIR .. "falcon") end,
    },
    {
        'freddiehaddad/feline.nvim',
    },
    {
        'uga-rosa/ccc.nvim',
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



