require("neodev").setup({
    library = { plugins = { "nvim-dap-ui" }, types = true },
})


local dap = require("dap")

dap.adapters.lldb = {
    type = 'executable',
    command = '/opt/homebrew/opt/llvm/bin/lldb-dap', -- adjust as needed, must be absolute path
    name = 'lldb',
}
dap.configurations.cpp = {
    {
        name = 'Launch',
        type = 'lldb',
        request = 'launch',
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
        args = {},
        console = 'integratedTerminal',
    },
}


require('dap-python').setup("python")
require('nvim-dap-virtual-text').setup()

vim.fn.sign_define('DapBreakpoint', { text='🔴', texthl='', linehl='', numhl='' })
vim.api.nvim_set_hl(0, "debugPC", { bg = "#691ed7" })












