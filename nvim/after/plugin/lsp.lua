-- Protege los require con pcall para evitar crasheos si algo no está disponible
local ok_mason, mason = pcall(require, "mason")
if not ok_mason then return end

local ok_mason_lsp, mason_lspconfig = pcall(require, "mason-lspconfig")
if not ok_mason_lsp then return end

local ok_lspconfig, lspconfig = pcall(require, "lspconfig")
if not ok_lspconfig then return end

local ok_cmp_lsp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not ok_cmp_lsp then return end

local lsp_capabilities = cmp_nvim_lsp.default_capabilities()

-- Setup mason and mason-lspconfig
mason.setup()

mason_lspconfig.setup({
    ensure_installed = {
        "intelephense",
        "jsonls",
        "bashls",
        "eslint",
        "dockerls",
        "ts_ls",
        "pyright",
        "phpactor",
        "lua_ls",
    },
    automatic_installation = false,  -- Evita el bug de auto-enable
    automatic_enable = false,        -- Evita que se llame a `vim.lsp.enable`
    handlers = {
        function(server_name)
            lspconfig[server_name].setup({
                capabilities = lsp_capabilities,
            })
        end,
        lua_ls = function()
            lspconfig.lua_ls.setup({
                capabilities = lsp_capabilities,
                settings = {
                    Lua = {
                        runtime = { version = "LuaJIT" },
                        diagnostics = { globals = { "vim" } },
                        workspace = {
                            library = {
                                vim.env.VIMRUNTIME,
                            },
                        },
                    },
                },
            })
        end,
    },
})

require("lspconfig").intelephense.setup({})

-- Autocommand para keymaps de LSP
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("user_lsp_attach", { clear = true }),
    callback = function(event)
        local opts = { buffer = event.buf }

        local map = vim.keymap.set
        map("n", "gd", vim.lsp.buf.definition, opts)
        map("n", "K", vim.lsp.buf.hover, opts)
        map("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
        map("n", "<leader>vd", vim.diagnostic.open_float, opts)
        map("n", "[d", vim.diagnostic.goto_next, opts)
        map("n", "]d", vim.diagnostic.goto_prev, opts)
        map("n", "<leader>vca", vim.lsp.buf.code_action, opts)
        map("n", "<leader>vrr", vim.lsp.buf.references, opts)
        map("n", "<leader>vrn", vim.lsp.buf.rename, opts)
        map("i", "<C-h>", vim.lsp.buf.signature_help, opts)
    end,
})

vim.filetype.add({
  pattern = {
    ['.*%.blade%.php'] = 'blade',
  },
})

-- Diagnostic config
vim.diagnostic.config({
    virtual_text = {
        prefix = "●",
        severity = vim.diagnostic.severity.ERROR,
    },
    signs = true,
    update_in_insert = false,
    underline = true,
    severity_sort = true,
})

-- nvim-cmp config
local ok_cmp, cmp = pcall(require, "cmp")
if not ok_cmp then return end

local cmp_select = { behavior = cmp.SelectBehavior.Select }

require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
    sources = {
        { name = "path" },
        { name = "nvim_lsp" },
        { name = "luasnip", keyword_length = 2 },
        { name = "buffer", keyword_length = 3 },
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
        ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
        ["<C-y>"] = cmp.mapping.confirm({ select = true }),
        ["<C-Space>"] = cmp.mapping.complete(),
    }),
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },
})

