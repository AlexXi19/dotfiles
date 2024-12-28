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
    {
        'AlexXi19/share.nvim',
        lazy = false,
    },
    'wakatime/vim-wakatime',
    {
        'tpope/vim-fugitive',
        lazy = true,
        cmd = {
            "Git",
        }
    },
    {
        'ggandor/leap.nvim',
        lazy = false,
    },
    {
        'lewis6991/gitsigns.nvim',
        lazy = true,
        cmd = {
            'Gitsigns',
            'Gitsigns toggle_signs',
            'Gitsigns toggle_current_line_blame',
        },
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
        'AlexXi19/nvim-code-action-menu',
        lazy = true,
        cmd = 'CodeActionMenu',

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
    -- 'nvim-treesitter/nvim-treesitter-context',
    {
        'folke/zen-mode.nvim',
        lazy = true,
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
        lazy = true,
        cmd = {
            'Prettier',
            'PrettierAsync',
        },
    },
    {
        'mbbill/undotree',
        lazy = true,
        cmd = {
            'UndotreeToggle',
        },
    },
    {
        'sindrets/diffview.nvim',
        lazy = true,
        cmd = {
            'DiffviewOpen',
            'DiffviewClose',
            'DiffviewToggleFiles',
            'DiffviewFocusFiles',
            'DiffviewRefresh',
            'DiffviewToggleOption',
            'DiffviewToggleFiles',
        },
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
        lazy = true,
        cmd = {
            "NvimTreeToggle",
            "NvimTreeOpen",
            "NvimTreeClose",
            "NvimTreeRefresh",
            "NvimTreeFindFile",
            "NvimTreeFindFileToggle",
        },
        keys = {
            { "<C-b>", ":NvimTreeFindFileToggle<CR>", desc = "Toggle tree" },
        },
        config = function()
            require('nvim-tree').setup({
                update_focused_file = {
                    enable = true,
                },
                filters = {
                    dotfiles = false,
                    git_ignored = false,
                    custom = { '^.git$' }
                },
                diagnostics = {
                    enable = true,
                },
            })
        end
    },
    'github/copilot.vim',
    -- {
    --     "zbirenbaum/copilot.lua",
    --     cmd = "Copilot",
    --     event = "InsertEnter",
    --     config = function()
    --         require("copilot").setup({})
    --     end,
    -- },
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
        cmd = {
            "OpenInGHRepo",
            "OpenInGHFile",
            "OpenInGHFileLines",
        }
    },
    {
        "j-hui/fidget.nvim",
        tag = "legacy",
        event = "LspAttach",
        opts = {
            -- options
        },
    },
    {
        "yetone/avante.nvim",
        event = "VeryLazy",
        lazy = false,
        version = false, -- set this if you want to always pull the latest change
        opts = {
            -- add any opts here
        },
        -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
        build = "make",
        -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "stevearc/dressing.nvim",
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            --- The below dependencies are optional,
            "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
            "zbirenbaum/copilot.lua",      -- for providers='copilot'
            {
                -- support for image pasting
                "HakonHarnes/img-clip.nvim",
                event = "VeryLazy",
                opts = {
                    -- recommended settings
                    default = {
                        embed_image_as_base64 = false,
                        prompt_for_file_name = false,
                        drag_and_drop = {
                            insert_mode = true,
                        },
                        -- required for Windows users
                        use_absolute_path = true,
                    },
                },
            },
            {
                -- Make sure to set this up properly if you have lazy=true
                'MeanderingProgrammer/render-markdown.nvim',
                opts = {
                    file_types = { "markdown", "Avante" },
                },
                ft = { "markdown", "Avante" },
            },
        },
    },
    {
        "jackMort/ChatGPT.nvim",
        event = "VeryLazy",
        config = function()
            require("chatgpt").setup()
        end,
        dependencies = {
            "MunifTanjim/nui.nvim",
            "nvim-lua/plenary.nvim",
            "folke/trouble.nvim", -- optional
            "nvim-telescope/telescope.nvim"
        }
    },
    -- {
    --     "pmizio/typescript-tools.nvim",
    --     dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    --     opts = {},
    -- }
})
