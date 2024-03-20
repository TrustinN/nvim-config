local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"
local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local sorters = require "telescope.sorters"

local cfile = vim.fn.bufname()
local cwd = ""
local i = 0

while true do
    if string.sub(cfile, #cfile - i, #cfile - i) == "/" then
        cwd = string.sub(cfile, 1, #cfile - i)
        break
    end
    i = i + 1
end

local figures = {}
local path_to_all_figures = cwd .. "figures/"
local all_figures = vim.fn.readdir(path_to_all_figures)

for v, file in pairs(all_figures) do
    if #file > 4 then
        if string.sub(file, #file - 2, #file) == "svg" then
            table.insert(figures, string.sub(file, 1, #file - 4))
        end
    end
end

local function enter(prompt_bufnr)
    local selected = action_state.get_selected_entry()
    actions.close(prompt_bufnr)
    Remove_Proj(selected[1])
end


local opts = {

    finder = finders.new_table(figures),
    sorter = sorters.get_generic_fuzzy_sorter({}),

    attach_mappings = function(prompt_bufnr, map)
        map("n", "<CR>", enter)
        map("i", "<CR>", enter)
        return true
    end,
}


local images = pickers.new(opts)

images:find()

