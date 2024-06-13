math.randomseed(os.time())
-- local v = math.random(1, 4)
local v = 2

local schemes = {
    "catppuccin-latte",
    "catppuccin-mocha",
    "falcon",
}

local cmd = "colorscheme " .. schemes[v]
vim.cmd(cmd)
