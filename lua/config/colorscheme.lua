math.randomseed(os.time())
-- local v = math.random(1, 4)
local v = 2

local schemes = {
    "catppuccin-latte",
    "catppuccin-mocha",
    "falcon",
}

local cmd = "colorscheme " .. schemes[v]

-- load the colorscheme
vim.cmd(cmd)

-- load the statusline
require(vim.g.STATUSLINES_CONFIG_DIR .. "statusline")

-- load the indent lines
require(vim.g.COLORSCHEME_CONFIG_DIR .. "indent-blankline")

-- load the bufferline
require(vim.g.UI_CONFIG_DIR .. "bufferline")









