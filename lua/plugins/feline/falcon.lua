local vi_mode = require("feline.providers.vi_mode")
local file_mode = require("feline.providers.file")
local colors = require("catppuccin.palettes").get_palette "latte"

local vi_mode_colors = {
    NORMAL = '#FFC552',
    INSERT = '#FF3600',
    VISUAL = '#FF761A',
    OP = colors.green,
    BLOCK = '#B24D36',
    REPLACE = '#AFC3D2',
    ['V-REPLACE'] = '#FF3600',
    ENTER = colors.sky,
    MORE = colors.sky,
    SELECT = colors.peach,
    COMMAND = '#DDCFBF',
    SHELL = colors.green,
    TERM = '#B8D2F0',
    NONE = '#FFC552'
}

local function wrap(string)
    return ' ' .. string .. ' '
end

local function wrapped_provider(provider, wrapper)
    return function(component, opts)
        return wrapper(provider(component, opts))
    end
end

local function provide_mode(component, opts)
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
            right_sep = ' ' ,
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
                -- bg = '#41056e',
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
                ' ' ,
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
        },
    },
    theme = {
        bg = "#151521"
    },
    separators = {
        left_sep = " ",
        right_sep = " ",
    },
    vi_mode_colors = vi_mode_colors
})


