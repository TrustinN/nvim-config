return {

    {
        "Zeioth/compiler.nvim",
        cmd = {"CompilerOpen", "CompilerToggleResults", "CompilerRedo"},
        dependencies = { "stevearc/overseer.nvim" },
        opts = {},
    },
    {
        "stevearc/overseer.nvim",
        commit = "19aac0426710c8fc0510e54b7a6466a03a1a7377",
        cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
        opts = {
            task_list = {
                direction = "bottom",
                min_height = 25,
                max_height = 20,
                default_detail = 1,
                bindings = {
                    ["e"] = "IncreaseDetail",
                    ["c"] = "DecreaseDetail",
                    ["E"] = "IncreaseAllDetail",
                    ["C"] = "DecreaseAllDetail",
                    [","] = "ScrollOutputUp",
                    ["."] = "ScrollOutputDown",
                    ["q"] = "Close",
                },
            },
        },
    },
    {
        "ahmedkhalf/project.nvim",
        config = function()
            require("project_nvim").setup({
                detection_methods = { "lsp", "pattern" },
                patterns = {
                    "*.lua",
                    "*.py",
                    "*.cpp",
                    "*.txt",
                    "*.html",
                    "*.jsx",
                    "*.m"
                },
            })
        end
    },
}



