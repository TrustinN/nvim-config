return {
    ---------------------------------------------------------------------------
    --LuaSnip
    ---------------------------------------------------------------------------

    {
        "L3MON4D3/LuaSnip",
        version = "v2.0.0",
        build = "make install_jsregexp",
        config = function ()
            require(vim.g.CODING_CONFIG_DIR .. "lua-snip")
        end
    },
}

