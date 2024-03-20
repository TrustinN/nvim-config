local vi_mode = require("feline.providers.vi_mode")
local file_mode = require("feline.providers.file")

local vi_mode_colors = {
    NORMAL = '#5FD7A7',
    INSERT = '#ff7eff',
    VISUAL = '#20BBFC',
    -- OP = COLORS.GREEN,
    BLOCK = '#07D7E8',
    REPLACE = '#FFE792',
    ['V-REPLACE'] = '#FF7EFF',
    -- ENTER = COLORS.SKY,
    -- MORE = COLORS.SKY,
    -- SELECT = COLORS.PEACH,
    COMMAND = '#BB8EFF',
    -- SHELL = COLORS.GREEN,
    TERM = '#FFC241',
    NONE = '#5FD7A7'
}

function wrap(string)
    return ' ' .. string .. ' '
end

function wrapped_provider(provider, wrapper)
    return function(component, opts)
        return wrapper(provider(component, opts))
    end
end

function provide_mode(component, opts)
    return vi_mode.get_vim_mode()
end

local comps = {
    left = {
        {
            provider = wrapped_provider(provide_mode, wrap),
            hl = function()
                return {
                    name = require('feline.providers.vi_mode').get_mode_highlight_name(),
                    bg = require('feline.providers.vi_mode').get_mode_color(),
                    fg = '#000000',
                    style = 'bold'
                }
            end,
            right_sep = '' ,
        },
        {},
        {},
        {},
    },
    right = {
        {},
        {},
        {
            provider = function()
                local dir = vim.fn.getcwd()
                local i = 0
                while true do
                    if string.sub(dir, #dir - i, #dir - i) == "/" then
                        return "  " .. string.sub(dir, #dir - i + 1, #dir) .. " "
                    end
                    i = i + 1
                end
            end,
            hl = {
                bg = '#000000',
            },
            left_sep = { 
                '' ,
            },
            right_sep = { 
                "  " ,
            }
        },
        {
            provider = {
                name = "file_info",
                opts = {
                    colored_icon = false,
                    file_modified_icon = "",
                }
            },
            hl = function()
                return {
                    bg = require('feline.providers.vi_mode').get_mode_color(),
                    fg = '#000000',
                }
            end,
            right_sep = {
                {
                    str = " ",
                    hl = function()
                        return {
                            bg = require('feline.providers.vi_mode').get_mode_color(),
                            fg = '#000000',
                        }
                    end,
                },
            },
            left_sep = { 
                '' ,
                {
                    str = " ",
                    hl = function()
                        return {
                            bg = require('feline.providers.vi_mode').get_mode_color(),
                            fg = '#000000',
                        }
                    end,

                }
            }
        },
    },
}

return require("feline").setup({
    components = {
        active = {
            comps.left,
            comps.right,
        },
        inactive = {
            {},
            --comps.right,
        },
    },
    theme = {
        bg = "#E7E7E7",
    },
    separators = {
        left_sep = " ",
        right_sep = " ",
    },
    vi_mode_colors = vi_mode_colors
})





