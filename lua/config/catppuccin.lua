local latte = require("catppuccin.palettes").get_palette "latte"
local frappe = require("catppuccin.palettes").get_palette "frappe"
local macchiato = require("catppuccin.palettes").get_palette "macchiato"
local mocha = require("catppuccin.palettes").get_palette "mocha"

require("catppuccin").setup({
    flavour = "latte",
    background = { -- :h background
        light = "latte",
        dark = "mocha",
    },
    transparent_background = false,
    show_end_of_buffer = false,
    term_colors = true,
    dim_inactive = {
        enabled = false,
        shade = "dark",
        percentage = 0.15,
    },
    no_italic = false, -- Force no italic
    no_bold = false, -- Force no bold
    styles = {
        comments = { "italic" },
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
    },
    color_overrides = {
        all = {
        },
        latte = {
            rosewater = "#1E66F5",
            flamingo = "#DD7878",
            pink = "#FF22C4",
--            "#EA76CB"#cf19c4
            mauve = "#8839EF",
            red = "#D20F39",
            maroon = "#E64553",
            peach = "#FE640B",
            yellow = "#DF8E1D",
            green = "#40A02B",
            teal = "#31CAD2",
            sky = "#04A5E5",
            sapphire = "#209FB5",
            blue = "#1E66F5",
            lavender = "#7287FD",
            text = "#4C4F69",
            subtext1 = "#5c5F77",
            subtext0 = "#6C6F85",
            overlay2 = "#7C7F93",
            overlay1 = "#8839EF",
            overlay0 = "#9CA0B0",
            surface2 = "#ACB0BE",
            surface1 = "#BCC0CC",
            surface0 = "#CCD0DA",
            base = "#eff1f5",
            mantle = "#e7e9ee",
            crust = "#dee1e8",
        },
        frappe = {
            rosewater = "#1E66F5",
            flamingo = "#DD7878",
            pink = "#FF22C4",
            mauve = "#8839EF",
            red = "#D20F39",
            maroon = "#E64553",
            peach = "#FE640B",
            yellow = "#DF8E1D",
            green = "#40A02B",
            teal = "#31CAD2",
            sky = "#04A5E5",
            sapphire = "#209FB5",
            blue = "#1E66F5",
            lavender = "#7287FD",
            text = "#4C4F69",
            subtext1 = "#5c5F77",
            subtext0 = "#6C6F85",
            overlay2 = "#7C7F93",
            overlay1 = "#8839EF",
            overlay0 = "#9CA0B0",
            surface2 = "#ACB0BE",
            surface1 = "#BCC0CC",
            surface0 = "#CCD0DA",
            base = "#E7E7E7",
            mantle = "#E6E9EF",
            crust = "#DCE0E8",
        },
        macchiato = {
            text = "#CAD3F5",
            overlay1 = "#CAD3F5",
        },
        mocha = {
            text = "#CDD6F4",
            overlay1 = "#9BD9E9",
        },
    },
    custom_highlights = {},
    integrations = {
        aerial = false,
        barbar = false,
        beacon = false,
        cmp = true,
        coc_nvim = false,
        dashboard = false,
        fern = false,
        fidget = false,
        gitgutter = false,
        gitsigns = false,
        harpoon = false,
        headlines = false,
        hop = false,
        illuminate = false,
        indent_blankline = {
            enabled = true,
            colored_indent_levels = true,
        },
        leap = true,
        lightspeed = false,
        lsp_saga = false,
        lsp_trouble = false,
        native_lsp = {
            enabled = true,
            virtual_text = {
                errors = { "italic" },
                hints = { "italic" },
                warnings = { "italic" },
                information = { "italic" },
            },
            underlines = {
                errors = { "underline" },
                hints = { "underline" },
                warnings = { "underline" },
                information = { "underline" },
            },
        },
        markdown = false,
        mason = true,
        mini = false,
        neogit = false,
        neotest = false,
        neotree = false,
        noice = false,
        notify = false,
        nvimtree = true,
        octo = false,
        overseer = false,
        pounce = false,
        sandwich = false,
        telescope = true,
        treesitter = true,
        treesitter_context = true,
    }
})

require("catppuccin").compile()

local cmd2 = "kitten @ --to unix:/tmp/mykitty set-background-image " .. "~/.config/kitty/.background/full_size/winter.png"
os.execute(cmd2)
Background = "bg"







