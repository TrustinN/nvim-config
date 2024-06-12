local Popup = require("nui.popup")
local event = require("nui.utils.autocmd").event

local popup = Popup({
  enter = true,
  focusable = true,
  border = {
    style = "rounded",
  },
  position = "50%",
  size = {
    width = "80%",
    height = "60%",
  },
})

local Hydra = require('hydra')
local cmd = require('hydra.keymap-util').cmd
local hint = [[
             ▄▄▄▄           
        █  ▄▀    ▀▄  █       
         █ █▀▀▀▀▀▀█ █        
          █        █         
        ███        ███       
          █        █         
         █ █      █ █        
        █   ██████   █       

_0_ - Build                  
_1_ - DEBUG                  

_2_ - Breakpoint             
_3_ - Conditional Breakpoint 

_4_ - Step over              
_5_ - Step into              

_6_ - Test method            
_7_ - Terminate              
]]

Hydra({
    name = "DAP",
    hint = hint,
    config = {
       color = 'pink',
       invoke_on_body = true,
       hint = {
          position = 'bottom-right',
          border = 'rounded',
       },
    },
    mode = 'n',
    body = '<leader>d',
    heads = {
        { "0",
            function()
                local currFile = vim.fn.expand("%:p"):match("^.+/(.+)")
                if currFile == "CMakeLists.txt" then
                    popup:mount()
                    vim.api.nvim_buf_set_lines(popup.bufnr, 0, 1, false, { "▶ mkdir -p build && cd build && cmake .. && cmake --build ." })

                    local handle = io.popen("mkdir -p build && cd build && cmake .. && cmake --build .")
                    local output = handle:read('*a')
                    handle:close()

                    local outputTbl = {}
                    for lines in string.gmatch(output .. "\n", "(.-)\n") do
                        table.insert(outputTbl, lines)
                    end

                    vim.api.nvim_buf_set_lines(popup.bufnr, 0, #outputTbl, false, outputTbl)
                    popup:map("n", "q", function(bufnr)
                        popup:unmount()
                    end, { noremap = true })

                else
                    vim.notify("Error: Must be in CMakeLists.txt to build")

                end
            end,
            { nowait = true }
        },
        { "1", cmd "lua require('dap').continue()", { nowait = true }},
        { "2", cmd "lua require('dap').toggle_breakpoint()" },
        { "3",
            function()
                vim.ui.input({"Condition: "}, function(input)
                    if input then
                        vim.cmd("lua require'dap'.toggle_breakpoint(\"" .. input .. "\")") end
                    end)
            end
        },
        { "4", cmd "lua require('dap').step_over()" },
        { "5", cmd "lua require('dap').step_into()" },
        { "6", cmd "lua require('dap').test_method()" },
        { "7", cmd "lua require('dap').terminate()"},
        { "<ESC>", nil, { exit = true }},
    },
})







