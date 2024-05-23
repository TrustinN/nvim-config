math.randomseed(os.time())
-- local v = math.random(1, 4)
local v = 2

if v == 1 then
    require("plugins.config.catppuccin")
    vim.cmd("colorscheme catppuccin-latte")

elseif v == 2 then
    require("plugins.config.catppuccin")
    vim.cmd("colorscheme catppuccin-mocha")

elseif v == 3 then
    vim.cmd([[
        colorscheme falcon
        hi StatusLineNC cterm=NONE ctermbg=NONE guibg=#151521
        hi conceal cterm=NONE ctermbg=NONE guifg=#FFC552
        hi NotifyBackground cterm=NONE ctermbg=NONE guibg=#000000
    ]])

elseif v == 4 then
    vim.cmd([[
        set background=light
        colorscheme pencil
        let g:pencil_higher_contrast_ui = 1
        hi conceal cterm=NONE ctermbg=NONE guifg=#212121
        hi DiagnosticHint cterm=NONE ctermbg=NONE guifg=#6855DE
        hi DiagnosticInfo cterm=NONE ctermbg=NONE guifg=#5fb45c
    ]])
end

-- load the statusline
require("plugins.config.feline")

-- load the indent lines
require("plugins.config.indent-blankline")

-- load the bufferline
require("plugins.config.bufferline")









