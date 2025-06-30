-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.6',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use 'AlexvZyl/nordic.nvim'

    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use('nvim-treesitter/playground')
    use('theprimeagen/harpoon')
    use('mbbill/undotree')
    use('tpope/vim-fugitive')
    use('ThePrimeagen/vim-be-good')

    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },
            { 'nvimtools/none-ls.nvim' },
            { 'phpactor/phpactor' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },

        }
    }

    use('nvimtools/none-ls-extras.nvim')

    -- Laravel extras
    use {
	'adalessa/laravel.nvim',
        requires = {
            'kevinhwang91/promise-async',
        }
    }

    use('jwalton512/vim-blade')             -- Blade syntax
    use('emmanueltouzery/agitator.nvim')    -- Blade-aware Git diffing
    use('themaxmarchuk/tailwindcss-colors.nvim') -- Tailwind color previews
    use('gbprod/phpactor.nvim')
    use('MunifTanjim/nui.nvim')

    use {
        'lewis6991/gitsigns.nvim',
        requires = {
            'nvim-lua/plenary.nvim'
        },
        config = function()
            require('gitsigns').setup()
        end
    }

    -- Debug Adapter Protocol (DAP) for Neovim
    use {
        'mfussenegger/nvim-dap',
        requires = {
            "rcarriga/nvim-dap-ui",
            "theHamsta/nvim-dap-virtual-text", -- Virtual text for breakpoints
            "nvim-telescope/telescope-dap.nvim", -- DAP integration with Telescope}
            "nvim-neotest/nvim-nio" -- Add this dependency
        }
    }


    -- PHP Debug Adapter
    use 'xdebug/vscode-php-debug'

    -- Codeium
    use({
        "Exafunction/codeium.nvim",
        requires = {
            "nvim-lua/plenary.nvim",
            "hrsh7th/nvim-cmp",
        },
        config = function()
            require("codeium").setup({
                virtual_text = {
                    enabled = true,
                }
            })
            vim.g.codeium_enable_virtual_text = 1
        end,
    })

    -- -- Copilot
    -- use {
    --     "zbirenbaum/copilot.lua",
    --     cmd = "Copilot",
    --     event = "InsertEnter",
    --     config = function()
    --         require("copilot").setup({
    --             suggestion = { enabled = true },
    --             panel = { enabled = false },
    --         })
    --     end,
    -- }
    --
    -- use {
    --     "zbirenbaum/copilot-cmp",
    --     after = { "copilot.lua" },
    --     config = function()
    --         require("copilot_cmp").setup({
    --             sources = {
    --                 { name = "copilot" }
    --                 -- other sources like nvim_lsp, path, buffer...
    --             }
    --         })
    --     end,
    -- }

end)
