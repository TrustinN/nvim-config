----------------------------------------------------------------------------
--Auto-Completion 
----------------------------------------------------------------------------

local cmp = require("cmp")
local lspkind = require("lspkind")

require("cmp").setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        end,
    },
    window = {
        completion = {
            border = {
                { "󱐋", "WarningMsg" },
                { "─", "Comment" },
                { "╮", "Comment" },
                { "│", "Comment" },
                { "╯", "Comment" },
                { "─", "Comment" },
                { "╰", "Comment" },
                { "│", "Comment" },
            },
            scrollbar = false,
        },
        documentation = {
            border = {
                { "", "DiagnosticHint" },
                { "─", "Comment" },
                { "╮", "Comment" },
                { "│", "Comment" },
                { "╯", "Comment" },
                { "─", "Comment" },
                { "╰", "Comment" },
                { "│", "Comment" },
            },
            scrollbar = false,
        },
    },
    mapping = cmp.mapping.preset.insert({
        ['<Tab>'] = cmp.mapping.select_next_item({'i'}),
        ['<S-Tab>'] = cmp.mapping.select_prev_item({'i'}),
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ['<Enter>'] = cmp.mapping.confirm({ select = true }),
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'calc' },
        { name = 'codeium' },
        {
            name = "spell",
            option = {
                keep_all_entries = false,
                enable_in_context = function()
                    return true
                end,
                preselect_correct_word = true,
            },
        },
    },
    {
        { name = 'buffer' },
    }),
    formatting = {
        format = lspkind.cmp_format({
            mode = "symbol_text",
            menu = ({
                buffer = "",
                nvim_lsp = "",
                luasnip = "",
                nvim_lua = "",
                latex_symbols = "",
            }),
        }),
    },
})

cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
        { name = 'cmp_git' },
    },
    {
        { name = 'buffer' },
    })
})

cmp.setup.cmdline(
    { '/', '?' },
    {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
            { name = 'buffer' }
        }
    }
)

cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' }
    },
    {
        { name = 'cmdline' }
    })
})




