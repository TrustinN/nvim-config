---------------------------------------------------------------------------
--Navigation
---------------------------------------------------------------------------

vim.g.vimtex_motion_matchparen=0
vim.g.vimtex_matchparen_enabled=0
vim.g.vimtex_indent_enabled=0
vim.g.tex_indent_items=0
vim.g.vimtex_indent_lists = {}

---------------------------------------------------------------------------
--Mappings
---------------------------------------------------------------------------


vim.keymap.set("n", "<leader>l", [[<Cmd>write<CR><Cmd>VimtexCompile<Cr>]], { buffer = true })
vim.keymap.set("n", "<leader>w", "<Cmd>VimtexTocToggle<CR>", { buffer = true })
vim.keymap.set("n", "<leader>r", "<Cmd>Hypersonic<CR>", { buffer = true })
vim.keymap.set("i", "<C-ENTER>", "<ESC>[s1z=gi", { buffer = true })

vim.keymap.set("i", "<C-g>", "<Cmd>luafile ~/.config/nvim/lua/plugins/telescope/telescope-img/telescope-img-paste.lua<CR>", { silent = true })
vim.keymap.set("n", "<C-x>", "<Cmd>luafile ~/.config/nvim/lua/plugins/telescope/telescope-img/telescope-img-remove.lua<CR>", { silent = true})
vim.keymap.set("n", "<C-g>", "<Cmd>luafile ~/.config/nvim/lua/plugins/telescope/telescope-img/telescope-img-open.lua<CR>", { silent = true })

---------------------------------------------------------------------------
--Conceal
---------------------------------------------------------------------------

vim.cmd([[
    setlocal spell spelllang=en_us
    set conceallevel=2
    let g:vimtex_syntax_custom_cmds = [
        \ {'name': 'divides',
        \  'mathmode': 1,
        \  'concealchar': '|'},
        \ {'name': 'ndivides',
        \  'mathmode': 1,
        \  'concealchar': '∤'},
        \ {'name': 'actson',
        \  'mathmode': 1,
        \  'concealchar': '↪'},
        \ {'name': 'mathop',
        \  'mathmode': 1,
        \  'nextgroup': 'texMathTextArg'},
        \ {'name': 'mlnode',
        \  'mathmode': 1,
        \  'nextgroup': 'texMathTextArg'},
        \]
    
    let g:vimtex_syntax_custom_cmds_with_concealed_delims = [
        \ {'name': 'frac',
        \  'nargs': 2,
        \  'mathmode': 1,
        \  'cchar_open': '',
        \  'cchar_mid': '/',
        \  'cchar_close': ''},
        \ {'name': 'dfrac',
        \  'nargs': 2,
        \  'mathmode': 1,
        \  'cchar_open': '',
        \  'cchar_mid': '/',
        \  'cchar_close': ''},
        \ {'name': 'binom',
        \  'nargs': 2,
        \  'mathmode': 1,
        \  'cchar_open': '(',
        \  'cchar_mid': '|',
        \  'cchar_close': ')'},
        \ {'name': 'dbinom',
        \  'nargs': 2,
        \  'mathmode': 1,
        \  'cchar_open': '(',
        \  'cchar_mid': '|',
        \  'cchar_close': ')'},
        \ {'name': 'dd',
        \  'nargs': 1,
        \  'mathmode': 1,
        \  'cchar_open': 'd',
        \  'cchar_close': ''},
        \]

    " conceal for \begin... \end
    call matchadd('Conceal', '\\begin{\ze[^}]\+}', 10, -1, {'conceal':'['})
    call matchadd('Conceal', '\\begin{[^}]\+\zs}\ze', 10, -1, {'conceal':']'})
    call matchadd('Conceal', '\\end{\ze[^}]\+}', 10, -1, {'conceal':'['})
    call matchadd('Conceal', '\\end{[^}]\+\zs}\ze', 10, -1, {'conceal':']'})

    " conceal for \label
    call matchadd('Conceal', '\\label{\ze[^}]\+}', 10, -1, {'conceal':''})
    call matchadd('Conceal', '\\label{[^}]\+\zs}\ze', 10, -1, {'conceal':''})

    " conceal for \mod
    call matchadd('Conceal', '\zs\\p\zemod{[^}]\+}', 10, -1, {'conceal':'('})
    call matchadd('Conceal', '\\pmod\zs{\ze[^}]\+}', 10, -1, {'conceal':' '})
    call matchadd('Conceal', '\\pmod{[^}]\+\zs}\ze', 10, -1, {'conceal':')'})

    " conceal for \odd, \even
    call matchadd('Conceal', '\zs\\\zeodd', 10, -1, {'conceal':''})
    call matchadd('Conceal', '\zs\\\zeeven', 10, -1, {'conceal':''})

    " conceal for \lcm, \gcd
    call matchadd('Conceal', '\\\zelcm', 10, -1, {'conceal':''})
    call matchadd('Conceal', '\\\zegcd', 10, -1, {'conceal':''})

    " conceal for \max \min
    call matchadd('Conceal', '\zs\\\zemax', 10, -1, {'conceal':''})
    call matchadd('Conceal', '\zs\\\zemin', 10, -1, {'conceal':''})

    " conceal for \mathop
    call matchadd('conceal', '\zs\\mathop{\ze', 10, -1, {'conceal':''})
    call matchadd('conceal', '\\mathop{[^}]\+\zs}\ze', 10, -1, {'conceal':''})

    " conceal for \dv
    call matchadd('conceal', '\zs\\d\zev{[^}]\+}', 10, -1, {'conceal':'d'})
    call matchadd('conceal', '\\d\zsv\ze{[^}]\+}', 10, -1, {'conceal':'/'})
    call matchadd('conceal', '\\dv\zs{\ze[^}]\+}', 10, -1, {'conceal':'d'})
    call matchadd('conceal', '\\dv{[^}]\+\zs}\ze', 10, -1, {'conceal':''})

    " conceal for \End, \Aut, \Hom
    call matchadd('Conceal', '\zs\\\zeEnd', 10, -1, {'conceal':''})
    call matchadd('Conceal', '\zs\\\zeAut', 10, -1, {'conceal':''})
    call matchadd('Conceal', '\zs\\\zeHom', 10, -1, {'conceal':''})

    " conceal for \exp
    call matchadd('Conceal', '\zs\\\zeexp', 10, -1, {'conceal':''})

    " conceal for \dim
    call matchadd('Conceal', '\zs\\\zedim', 10, -1, {'conceal':''})

    " conceal for \Span
    call matchadd('Conceal', '\zs\\\zeSpan', 10, -1, {'conceal':''})

    " conceal for \ker
    call matchadd('Conceal', '\zs\\\zeker', 10, -1, {'conceal':''})

    " conceal for \lim
    call matchadd('Conceal', '\zs\\\zelim', 10, -1, {'conceal':''})

    " conceal for \limits
    call matchadd('Conceal', '\zs\\limits\ze', 10, -1, {'conceal':''})

    " conceal for \eval
    call matchadd('Conceal', '\zs\\eval\ze', 10, -1, {'conceal':'|'})

    " conceal for \inf
    call matchadd('Conceal', '\zs\\\zeinf', 10, -1, {'conceal':''})
    " conceal for \sup
    call matchadd('Conceal', '\zs\\\zesup', 10, -1, {'conceal':''})
]])








