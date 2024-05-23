require 'nvim-treesitter.configs'.setup {
    ensure_installed = { "python", "lua", "vim" },
    auto_install = true,
    highlight = {
           enable = true,
           disable = { "latex" },
           additional_vim_regex_highlighting = { "latex" },
    },
    --other treesitter settings

}









