return {
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
    {'ziontee113/icon-picker.nvim',
        config = function()
            require("icon-picker").setup({
                disable_legacy_commands = true,
            })
        end,
    },
    'MunifTanjim/nui.nvim',
}



