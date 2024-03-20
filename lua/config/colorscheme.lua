math.randomseed(os.time())
local v = math.random(1, 3)
local v = 2

if v == 1 then
    return vim.cmd([[
        colorscheme catppuccin-latte
    ]])
elseif v == 2 then
    return vim.cmd([[
        colorscheme catppuccin-mocha
    ]])
elseif v == 3 then
    return vim.cmd([[
        colorscheme falcon
        hi StatusLineNC cterm=NONE ctermbg=NONE guibg=#151521
        hi conceal cterm=NONE ctermbg=NONE guifg=#FFC552
        hi NotifyBackground cterm=NONE ctermbg=NONE guibg=#000000
    ]])
elseif v == 4 then
    return vim.cmd([[
        set background=light
        colorscheme pencil
        let g:pencil_higher_contrast_ui = 1
        hi conceal cterm=NONE ctermbg=NONE guifg=#212121
        hi DiagnosticHint cterm=NONE ctermbg=NONE guifg=#6855DE
        hi DiagnosticInfo cterm=NONE ctermbg=NONE guifg=#5fb45c
    ]])
end









