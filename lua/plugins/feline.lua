local colorscheme = vim.fn.eval("g:colors_name")

local catppuccin_schemes = {
    "catppuccin-latte", "catppuccin-frappe", "catppuccin-macchiato", "catppuccin-mocha",
}

local falcon_schemes = {
    "falcon",
}

local pencil_schemes = {
    "pencil",
}

if table.contains(catppuccin_schemes, colorscheme) then
    return require("plugins.feline.catppuccin")
elseif table.contains(falcon_schemes, colorscheme) then
    return require("plugins.feline.falcon")
elseif table.contains(pencil_schemes, colorscheme) then
    return require("plugins.feline.pencil")
end


