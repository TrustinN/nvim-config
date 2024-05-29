return {
    ---------------------------------------------------------------------------
    --LaTeX Compiler
    ---------------------------------------------------------------------------

	{'lervag/vimtex', name = "vimtex", lazy = false,
        config = function()
            vim.cmd([[
                let g:tex_flavor='latex'
                let g:vimtex_version_check=0
                let g:vimtex_view_method='skim'
                let g:vimtex_view_skim_sync=1
                let g:vimtex_view_skim_activate=1
                let g:vimtex_quickfix_open_on_warning=0
                let g:vimtex_grammar_textidote={
                \ 'jar': '~/Downloads/Software/textidote.jar',
                \ 'args': '',
                \}
                setlocal spell spelllang=en_us
            ]])
        end
    },
}


