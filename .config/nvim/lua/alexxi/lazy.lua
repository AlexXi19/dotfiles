local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
    {
        'nvim-treesitter/nvim-treesitter',
        build = ":TSUpdate",
    },
    {
        'AlexXi19/recall.nvim',
        lazy = false,
    },
    'wakatime/vim-wakatime',
    {
        'tpope/vim-fugitive',
        lazy = true,
    },
    {
        'ggandor/leap.nvim',
        lazy = false,
    },
    {
        'lewis6991/gitsigns.nvim',
        lazy = true,
        config = function()
            require('gitsigns').setup {
                signcolumn = true,          -- Toggle with `:Gitsigns toggle_signs`
                current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
            }
        end
    },
    {
        'projekt0n/github-nvim-theme',
        config = function()
            require('github-theme').setup()
        end
    },
    {
        'akinsho/git-conflict.nvim',
        lazy = true,
        config = function()
            require('git-conflict').setup()
        end
    },
    {
        'utilyre/barbecue.nvim',
        lazy = true,
        dependencies = {
            'SmiteshP/nvim-navic',
            'nvim-tree/nvim-web-devicons',
        },
        config = function()
            require('barbecue').setup()
        end
    },
    {
        'SmiteshP/nvim-navic',
        lazy = true,
    },
    'rafamadriz/friendly-snippets',
    'nvim-treesitter/nvim-treesitter-context',
    {
        'folke/zen-mode.nvim',
        lazy = true,
        config = function()
            require("zen-mode").setup()
        end
    },
    {
        'eandrju/cellular-automaton.nvim',
        lazy = true,
    },
    {
        'VonHeikemen/lsp-zero.nvim',
        dependencies = {
            -- LSP
            'jose-elias-alvarez/null-ls.nvim',
            'neovim/nvim-lspconfig',
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
            -- Autocompletion
            'hrsh7th/nvim-cmp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'saadparwaiz1/cmp_luasnip',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-nvim-lua',
            -- Snippets
            'L3MON4D3/LuaSnip',
            'rafamadriz/friendly-snippets',
        },
    },
    {
        'ishan9299/modus-theme-vim',
        lazy = true,
    },
    'neovim/nvim-lspconfig',
    'jose-elias-alvarez/null-ls.nvim',
    {
        'MunifTanjim/prettier.nvim',
        lazy = false,
    },
    {
        'mbbill/undotree',
        lazy = false,
    },
    {
        'sindrets/diffview.nvim',
        lazy = false,
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {
        'xiyaowong/nvim-transparent',
        config = function()
            require("transparent").setup({
                extra_groups = {
                    "all"
                },
                exclude_groups = {},
            })
        end
    },
    {
        'numToStr/Comment.nvim',
        lazy = false,
        config = function()
            require("Comment").setup()
        end
    },
    {
        'nvim-tree/nvim-tree.lua',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        lazy = false,
        keys = {
            { "<C-b>", ":NvimTreeFindFileToggle<CR>", desc = "Toggle tree" },
        },
        config = function()
            require('nvim-tree').setup({
                update_focused_file = {
                    enable = true,
                },
                filters = {
                    dotfiles = true,
                    custom = { '^.git$' }
                },
                diagnostics = {
                    enable = true,
                },
            })
        end
    },
    'github/copilot.vim',
    {
        'rmagatti/auto-session',
        config = function()
            require('auto-session').setup {
                log_level = 'error',
                auto_session_suppress_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
            }
        end
    },
    {
        'dhruvmanila/browser-bookmarks.nvim',
        lazy = true,
        config = function()
            local browser_bookmarks = require("browser_bookmarks")

            -- Default browser bookmarks
            local telescope = require("telescope")
            telescope.load_extension('bookmarks')
            browser_bookmarks.setup({
                selected_browser = 'chrome',
            })
        end
    },
    {
        'almo7aya/openingh.nvim',
        lazy = true,
    },
    {
        "j-hui/fidget.nvim",
        tag = "legacy",
        event = "LspAttach",
        opts = {
            -- options
        },
    }
})
