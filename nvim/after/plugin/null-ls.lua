local null_ls = require("null-ls") -- if using none-ls.nvim

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
    sources = {
        -- PHP
        formatting.pint.with({
            command = "./vendor/bin/sail",
            args = { "php", "./vendor/bin/pint", "--stdin", "--preset=laravel" },
            to_stdin = true,
        }),
        formatting.phpcsfixer.with({
            command = "./vendor/bin/sail",
            args = {
                "php", "./vendor/bin/php-cs-fixer",
                "fix",
                "--using-cache=no",
                "--quiet",
                "--stdin", "$FILENAME"
            },
            to_stdin = true,
        }),
        diagnostics.phpstan.with({
            command = "./vendor/bin/sail",
            args = { "php", "./vendor/bin/phpstan", "analyse", "--error-format=raw", "-" },
        }),
        diagnostics.phpcs.with({
            command = "./vendor/bin/sail",
            args = {
                "php", "./vendor/bin/phpcs",
                "--standard=PSR12",  -- or whatever standard you want
                "--report=json",
                "--stdin-path", "$FILENAME", "-"
            },
            to_stdin = true,
        }),

        -- JS/TS
        formatting.prettier.with({
            extra_filetypes = { "php", "blade.php" },
        }),
        require("none-ls.diagnostics.eslint_d"),
        require("none-ls.formatting.eslint_d"),
    },
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_create_autocmd("BufWritePre", {
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format({ bufnr = bufnr })
                end,
            })
        end
    end,
})

