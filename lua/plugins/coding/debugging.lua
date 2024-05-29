return {
    ---------------------------------------------------------------------------
    --Debugging
    ---------------------------------------------------------------------------

    {
        "mfussenegger/nvim-dap",
        config = function()
            require("plugins.config.nvim-dap")
        end
    },
    "mfussenegger/nvim-dap-python",
    {
        "jay-babu/mason-nvim-dap.nvim",
        dependencies = {
            "williamboman/mason.nvim",
            "mfussenegger/nvim-dap-python",
        },
        opts = {
            handlers = {},
            -- ensure_installed = {
            --     "codelldb",
            -- },
        }
    },
    "folke/neodev.nvim",
    {
        "rcarriga/nvim-dap-ui",
        dependencies = {
            "mfussenegger/nvim-dap",
            "nvim-neotest/nvim-nio",
        },
        config = function()
            local dap, dapui = require("dap"), require("dapui")
            dapui.setup()
            dap.listeners.before.attach.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.launch.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated.dapui_config = function()
                dapui.close()
            end
            dap.listeners.before.event_exited.dapui_config = function()
                dapui.close()
            end
            dap.listeners.after.event_stopped["auto-center"] = function()
                vim.api.nvim_create_autocmd("CursorMoved", {
                    once = true,
                    callback = function()
                        vim.cmd.normal("zz")
                    end
                })
            end
        end,
    },
    "theHamsta/nvim-dap-virtual-text",
}


