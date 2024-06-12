-- Global variables are relative to lua directory for use with require command

vim.g.CONFIG_DIR = "plugins.config."
vim.g.PLUGINS_CONFIG_DIR = "plugins.config."

vim.g.CODING_CONFIG_DIR = vim.g.PLUGINS_CONFIG_DIR .. "coding."
vim.g.COLORSCHEME_CONFIG_DIR = vim.g.PLUGINS_CONFIG_DIR .. "colors."
vim.g.KEYMODE_CONFIG_DIR = vim.g.PLUGINS_CONFIG_DIR .. "hydra."
vim.g.SNIPPETS_CONFIG_DIR = vim.g.PLUGINS_CONFIG_DIR .. "LuaSnip."
vim.g.NAVIGATION_CONFIG_DIR = vim.g.PLUGINS_CONFIG_DIR .. "navigation."
vim.g.NVIM_TREE_CONFIG_DIR = vim.g.PLUGINS_CONFIG_DIR .. "nvim-tree."
vim.g.STATUSLINES_CONFIG_DIR = vim.g.PLUGINS_CONFIG_DIR .. "statuslines."
vim.g.TELESCOPE_CONFIG_DIR = vim.g.PLUGINS_CONFIG_DIR .. "telescope."
vim.g.UI_CONFIG_DIR = vim.g.PLUGINS_CONFIG_DIR .. "ui."


-- Variables used for non package loading purposes

vim.g.SOURCE_DIR = "~/.config/nvim/lua"

vim.g.BACKGROUNDS_FOLDER = "~/.config/kitty/.background"
vim.g.TELESCOPE_SOURCE_DIR = vim.g.SOURCE_DIR .. "/plugins/config/telescope"

