local cmp = require('cmp')

cmp.setup({
    experimental = {
        ghost_text = true,
    },
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)  -- expand snippet
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }),
    sources = cmp.config.sources({
        -- { name = 'copilot' },      -- copilot source first (optional)
        { name = 'codeium' },
        { name = 'nvim_lsp' },     -- LSP completions
        { name = 'luasnip' },      -- snippets
        { name = 'buffer' },       -- buffer words
        { name = 'path' },         -- file paths
    }),
})

