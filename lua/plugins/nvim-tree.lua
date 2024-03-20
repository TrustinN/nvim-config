vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
    on_attach = require("config.nvim-tree-mappings").on_attach,
    root_dirs = { "~/" },
    view = {
        adaptive_size = true,
    },
    sync_root_with_cwd = true,
    respect_buf_cwd = true,
    update_focused_file = {
        enable = true,
        update_root = true
    },
    filters = {
        dotfiles = true,
    }
})

local function find_directory_and_focus()
    local actions = require("telescope.actions")
    local action_state = require("telescope.actions.state")

    local function open_nvim_tree(prompt_bufnr, _)
        actions.select_default:replace(function()
            local api = require("nvim-tree.api")

            actions.close(prompt_bufnr)
            local selection = action_state.get_selected_entry()
            api.tree.open()
            api.tree.find_file(selection.cwd .. "/" .. selection.value)
        end)
        return true
    end

    require("telescope.builtin").find_files({
        find_command = { "fd", "--type", "directory", "--hidden", "--exclude", ".git/*" },
        attach_mappings = open_nvim_tree,
    })
end

vim.keymap.set("n", "fd", find_directory_and_focus)









