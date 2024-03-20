local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"
local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local sorters = require "telescope.sorters"
local spaces = {
    "Safari",
    "Skim | kitty",
    "Python | kitty",
    "Google Chrome",
}

local function enter(prompt_bufnr)
    local selected = action_state.get_selected_entry()
    local cmd = [[/opt/homebrew/bin/hs -c "workspace_swap(]] .. "'" .. selected[1] .. [[')"]]
    actions.close(prompt_bufnr)
    os.execute(cmd)
end

local opts = {

    finder = finders.new_table(spaces),
    sorter = sorters.get_generic_fuzzy_sorter({}),

    attach_mappings = function(prompt_bufnr, map)
        map("n", "<CR>", enter)
        map("i", "<CR>", enter)
        return true
    end,
}


local windows = pickers.new(opts)

windows:find()







