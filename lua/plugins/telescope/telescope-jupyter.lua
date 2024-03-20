local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"
local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local sorters = require "telescope.sorters"

local function enter(prompt_bufnr)
    local selected = action_state.get_selected_entry()[1]
    local i, j = string.find(selected, " - ")
    selected = string.sub(selected, j + 3, #selected)
    actions.close(prompt_bufnr)
    if selected == "StartJupyter" then
        vim.cmd("call jobstart('jupyter qtconsole', {'dettach':1})")
    else
        vim.cmd(selected)
    end
end

local opts = {

    finder = finders.new_table({
        "1 - StartJupyter",
        "2 - JupyterConnect",
        "3 - JupyterRunFile",
        "4 - PythonImportThisFile",
        "5 - JupyterCd",
        "6 - JupyterSendCell",
        "7 - JupyterSendRange",
        "8 - <Plug>JupyterRunTextObj",
        "9 - <Plug>JupyterRunVisual",
        "10 - PythonSetBreak",
    }),
    sorter = sorters.get_generic_fuzzy_sorter({}),

    attach_mappings = function(prompt_bufnr, map)
        map("n", "<CR>", enter)
        map("i", "<CR>", enter)
        return true
    end,
}


local jupyter_cmds = pickers.new(opts)

jupyter_cmds:find()










