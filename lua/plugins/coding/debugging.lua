return {
    ---------------------------------------------------------------------------
    --Debugging
    ---------------------------------------------------------------------------

    {"mfussenegger/nvim-dap",
        config = function()
            require("plugins.config.nvim-dap")
        end
    },
    "mfussenegger/nvim-dap-python",
    "folke/neodev.nvim",
    { "rcarriga/nvim-dap-ui", dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} },
    "theHamsta/nvim-dap-virtual-text",
}


