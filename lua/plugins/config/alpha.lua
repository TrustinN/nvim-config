require("alpha.term")

local dashboard = require("alpha.themes.dashboard")
local headers = require("plugins.config.headers")

---------------------------------------------------------------------------
--Headers
---------------------------------------------------------------------------

local animated_spaceship = headers.animated_spaceship
local animated_planet = headers.animated_planet
local animated_duck_light = headers.animated_duck_light
local animated_duck_dark = headers.animated_duck_dark
local animated_prism = headers.animated_prism
local animated_cat = headers.animated_cat
local animated_slinky = headers.animated_slinky
local animated_pikachu = headers.animated_pikachu
local animated_eyes_light = headers.animated_eyes_light
local animated_eyes_dark = headers.animated_eyes_dark
local animated_fish_light = headers.animated_fish_light
local animated_fish_dark= headers.animated_fish_dark
local animated_ufo_light = headers.animated_ufo_light
local animated_bat_light = headers.animated_bat_light
local animated_bat_dark = headers.animated_bat_dark
local animated_rain_light = headers.animated_rain_light
local animated_pepe = headers.animated_pepe
local animated_string = headers.animated_string
local animated_predator_fish = headers.animated_predator_fish
local animated_plane_light = headers.animated_plane_light
local animated_nyan = headers.animated_nyan
local animated_sphere_1 = headers.animated_sphere_1
local animated_sphere_2 = headers.animated_sphere_2
local animated_geometry = headers.animated_geometry
local animated_rainbow_circle = headers.animated_rainbow_circle

local header_collection_light = {
    animated_duck_light, animated_spaceship, animated_cat,       --   1 - 3
    animated_slinky, animated_pikachu, animated_eyes_light,      --   4 - 6
    animated_fish_light, animated_ufo_light, animated_bat_light, --   7 - 9
    animated_rain_light, animated_pepe, animated_plane_light,    --  10 - 12
    animated_rainbow_circle,
}

local header_collection_dark = {
    animated_duck_dark, animated_planet, animated_spaceship,     --   1 - 3
    animated_prism, animated_cat, animated_slinky,               --   4 - 6
    animated_pikachu, animated_eyes_dark, animated_fish_dark,    --   7 - 9
    animated_bat_dark, animated_string, animated_predator_fish,  --  10 - 12
    animated_nyan, animated_sphere_1, animated_sphere_2,         --  13 - 15
    animated_geometry,
}

---------------------------------------------------------------------------
--Random Header Selection
---------------------------------------------------------------------------

local header_collection = {}
local choice = { "random", "last", 11}
local choice_idx = 1

local light_colorschemes = {
    "catppuccin-latte", "catppuccin-frappe", "pencil",
}

local header_set = function(opt)
    local colorscheme = vim.fn.eval("g:colors_name")

    if table.contains(light_colorschemes, colorscheme) then
        header_collection = header_collection_light
    else
        header_collection = header_collection_dark
    end

    if opt == "last" then
        return header_collection[#header_collection]
    elseif opt == "random" then
        local v = math.random(1, #header_collection)
        return header_collection[v]
    else
        return header_collection[opt]
    end
end

local header_choice = header_set(choice[choice_idx])

---------------------------------------------------------------------------
--Alpha Setup
---------------------------------------------------------------------------

local if_nil = vim.F.if_nil

local footer = {
    type = "text",
    val = "",
    opts = {
        position = "left",
        hl = "Number"
    }
}

local leader = "SPC"

--- @param sc string
--- @param txt string
--- @param keybind string? optional
--- @param keybind_opts table? optional
local function button(sc, txt, keybind, keybind_opts)
    local sc_ = sc:gsub("%s", ""):gsub(leader, "<leader>")

    local opts = {
        position = "center",
        shortcut = sc,
        cursor = 5,
        width = 100,
        align_shortcut = "right",
        hl_shortcut = "Keyword",
    }
    if keybind then
        keybind_opts = if_nil(keybind_opts, { noremap = true, silent = true, nowait = true })
        opts.keymap = { "n", sc_, keybind, keybind_opts }
    end

    local function on_press()
        local key = vim.api.nvim_replace_termcodes(keybind or sc_ .. "<Ignore>", true, false, true)
        vim.api.nvim_feedkeys(key, "t", false)
    end

    return {
        type = "button",
        val = txt,
        on_press = on_press,
        opts = opts,
    }
end

local buttons = {
    type = "group",
    val = {
        button("n", "  New file", "<Cmd>ene<CR>"),
        button("f", "  Find file", "<Cmd>Telescope frecency<CR>"),
        button("r", "  Recently opened files", "<Cmd>Telescope oldfiles<CR>"),
        button("s", "  Settings", "<Cmd>e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>"),
        button("q", "  Quit", "<Cmd>qa<CR>"),
    },
    opts = {
        spacing = 1,
    },
}

local section = {
    header = header_choice,
    buttons = buttons,
    footer = footer,
}

local config = {
    layout = {
        { type = "padding", val = 5 },
        section.header,
        { type = "padding", val = 2 },
        section.buttons,
        section.footer,
    },
    opts = {
        margin = 5,
        noautocmd = true,
        redraw_on_resize = true
    },
}

dashboard.opts = config
require'alpha'.setup(dashboard.opts)
vim.cmd([[
    autocmd FileType alpha setlocal nofoldenable
]])
















