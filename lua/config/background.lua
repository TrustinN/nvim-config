local function setDefaultBg()
    local cmd = "kitten @ --to unix:/tmp/mykitty set-background-image " .. vim.g.BACKGROUNDS_FOLDER .. "/full_size/winter.png"
    os.execute(cmd)
end

setDefaultBg()

require(vim.g.TELESCOPE_CONFIG_DIR .. "telescope-bg.backgrounds")
require(vim.g.TELESCOPE_CONFIG_DIR .. "telescope-bg.bg-commands")

local BgExit = vim.api.nvim_create_augroup('BgExit', { clear = true })
vim.api.nvim_create_autocmd({"VimLeave"}, {
    group = BgExit,
    pattern = {"*"},
    callback = setDefaultBg,
    once = true,
})

