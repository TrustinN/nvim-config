return {

    {"nvim-treesitter/nvim-treesitter",
        build = function()
            require("nvim-treesitter.install").update({ with_sync = true })
        end,
        config = function()
            require(vim.g.CODING_CONFIG_DIR .. "treesitter")
        end
    },
}

