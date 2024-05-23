----------------------------------------------------------------------------
--Auto-Completion 
----------------------------------------------------------------------------

local cmp = require("cmp")
local lspkind = require("lspkind")

require("cmp").setup({
    snippet =
        {
            expand = function(args)
                require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
            end,
        },
    window =
        {
            completion = cmp.config.window.bordered(),
            documentation = cmp.config.window.bordered(),
        },
    mapping = cmp.mapping.preset.insert(
        {
            ['<Tab>'] = cmp.mapping.select_next_item({'i'}),
            ['<Enter>'] = cmp.mapping.confirm({ select = false }),
        }
    ),
    sources = cmp.config.sources(
        {
            { name = 'nvim_lsp' },
            { name = 'luasnip' },
            { name = 'calc' },
        },
        {
            { name = 'buffer' },
        }
    ),
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
	sources = cmp.config.sources(
		{
			{ name = 'cmp_git' },
		},
		{
			{ name = 'buffer' },
		}
	)
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




