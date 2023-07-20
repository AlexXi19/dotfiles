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
    'AlexXi19/recall.nvim',
    'wakatime/vim-wakatime',
    'theprimeagen/harpoon',
    'tpope/vim-fugitive',
    {
        'ggandor/leap.nvim',
    },
    {
        'lewis6991/gitsigns.nvim',
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
        config = function()
            require('git-conflict').setup()
        end
    },
    {
        'utilyre/barbecue.nvim',
        dependencies = {
            'SmiteshP/nvim-navic',
            'nvim-tree/nvim-web-devicons',
        },
        config = function()
            require('barbecue').setup()
        end
    },
    'SmiteshP/nvim-navic',
    'rafamadriz/friendly-snippets',
    'nvim-treesitter/nvim-treesitter-context',
    {
        'folke/zen-mode.nvim',
        config = function()
            require("zen-mode").setup()
        end
    },
    'eandrju/cellular-automaton.nvim',
    {
        'VonHeikemen/lsp-zero.nvim',
        dependencies = {
            -- LSP
            'jose-elias-alvarez/null-ls.nvim',
            'neovim/nvim-lspconfig',
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
            'MunifTanjim/prettier.nvim',
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
    'ishan9299/modus-theme-vim',
    'neovim/nvim-lspconfig',
    'jose-elias-alvarez/null-ls.nvim',
    'MunifTanjim/prettier.nvim',
    'nvim-lua/lsp-status.nvim',
    'mbbill/undotree',
    { 'sindrets/diffview.nvim', dependencies = { 'nvim-lua/plenary.nvim' } },
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
        config = function()
            require("Comment").setup()
        end
    },
    {
        'nvim-tree/nvim-tree.lua',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
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
        'nvim-lualine/lualine.nvim',
        config = function()
            require("lualine").setup {
                sections = {
                    lualine_x = {
                        "require('lsp-status').status()",
                        "filetype",
                    },
                },
            }
        end
    },
    'dhruvmanila/browser-bookmarks.nvim',
    'almo7aya/openingh.nvim',
})
