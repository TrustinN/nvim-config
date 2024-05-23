return {
    ---------------------------------------------------------------------------
    --LuaSnip
    ---------------------------------------------------------------------------

    {
        "L3MON4D3/LuaSnip",
        version = "v2.0.0",
        build = "make install_jsregexp",
        config = function ()
            require("plugins.config.lua-snip")
        end
    },
}

