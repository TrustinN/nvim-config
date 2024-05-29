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
                local currFile = vim.fn.expand("%:p"):match("^.+/(.+)%.")
                if currFile == "CMakeLists" then
                    os.execute("mkdir -p build && cd build && cmake .. && cmake --build .")
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







