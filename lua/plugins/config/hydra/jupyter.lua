local Hydra = require('hydra')
local cmd = require('hydra.keymap-util').cmd

local hint = [[
                                             ████        _1_ - StartJupyter             
        ██                                  ██████                                      
       ████          ██████████████         ██████                                      
        ██       ██████████████████████      ████        _2_ - JupyterConnect           
              ███████████      ███████████                                              
            █████████              █████████                                            
           █████                        █████            _3_ - JupyterRunFile           
          ███                              ███                                          
         ██                                  ██                                         
        █                          █           █         _4_ - PythonImportThisFile     
                                   █                                                    
     █   █   █   ████    █    █   ████   ▄█▀▀▀▄   █▄▀▀                                  
     █   █   █   █   █   ▀█  ▄█    █     █▄▄▄▄█   █▀     _5_ - JupyterCd                
     █   █   █   █   █    ▀█▄█     █     █        █                                     
     █   ▀████   █ ██      ██       ██   ▀▄▄▄▄▀   █                                     
     █           █         █                             _6_ - JupyterSendCell          
   ██   █        █        █                    █                                        
         ██                                  ██                                         
          ███                              ███           _7_ - JupyterSendRange         
           █████                        █████                                           
            █████████              █████████                                            
              ███████████      ███████████               _8_ - PythonSetBreak           
                 ██████████████████████                                                 
          ███        ██████████████                                                     
         █████                                           _<ESC>_ - Exit                 
         █████                                                                          
          ███                                                                           
]]

Hydra({
    name = "Jupyter",
    hint = hint,
    config = {
       color = 'pink',
       invoke_on_body = true,
       hint = {
          position = 'middle',
          border = 'rounded',
       },
       buffer = true,
    },
    mode = 'n',
    body = '<leader>j',
    heads = {
        { '1', cmd 'call jobstart("jupyter qtconsole", {"dettach":1})' },
        { '2', function()
            vim.cmd('JupyterConnect')
            os.execute([[/opt/homebrew/bin/hs -c 'workspace_swap("Python | kitty")']])
        end },

        { '3', cmd 'JupyterRunFile' },
        { '4', cmd 'PythonImportThisFile' },
        { '5', cmd 'JupyterCd' },
        { '6', cmd 'JupyterSendCell' },
        { '7', cmd 'JupyterSendRange' },
        { '8', cmd 'PythonSetBreak' },
        { '<ESC>', nil, { exit = true, nowait = true } },
    },
})








