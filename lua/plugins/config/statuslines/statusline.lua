local colorscheme = vim.fn.eval("g:colors_name")
local configFile = "plugins.config.statuslines."

local catppuccin_schemes = {
    "catppuccin-latte", "catppuccin-frappe", "catppuccin-macchiato", "catppuccin-mocha",
}

if table.contains(catppuccin_schemes, colorscheme) then
    return require(configFile .. "catppuccin")

elseif colorscheme == "falcon" then
    return require(configFile .. "falcon")

end



