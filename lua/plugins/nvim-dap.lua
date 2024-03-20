require("dapui").setup()
require("neodev").setup({
    library = { plugins = { "nvim-dap-ui" }, types = true },
})

local dap, dapui = require("dap"), require("dapui")
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

require('dap-python').setup("python")
require('nvim-dap-virtual-text').setup()
vim.fn.sign_define('DapBreakpoint', { text='🔴', texthl='', linehl='', numhl='' })
vim.api.nvim_set_hl(0, "debugPC", { bg = "#691ed7" })












