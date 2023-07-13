vim.cmd [[packadd packer.nvim]]

local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
    use('wbthomason/packer.nvim')

    use {
        'nvim-telescope/telescope.nvim',
        requires = { { 'nvim-lua/plenary.nvim' } },
        config = function()
            require('telescope').setup {
                defaults = {
                    file_ignore_patterns = { "node_modules/*", ".git/*", "build/*", "dist/*" },
                },
                pickers = {
                    oldfiles = {
                        cwd_only = true,
                    }
                },
                extensions = {
                    bookmarks = {
                        selected_browser = 'chrome',
                    },
                },
            }
        end,
    }


    use({ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' })

    use 'AlexXi19/recall.nvim'

    use 'wakatime/vim-wakatime'

    use 'theprimeagen/harpoon'

    use 'tpope/vim-fugitive'

    use {
        'ggandor/leap.nvim',
        config = function()
            require('leap').add_default_mappings()
        end
    }

    use {
        'gen740/SmoothCursor.nvim',
        config = function()
            require('smoothcursor').setup()
        end
    }

    use {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup {
                signcolumn = true,          -- Toggle with `:Gitsigns toggle_signs`
                current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
            }
        end
    }

    -- use {
    --     'm4xshen/autoclose.nvim',
    --     config = function()
    --         require("autoclose").setup({
    --             options = {
    --                 disable_when_touch = true,
    --             },
    --         })
    --     end
    -- }

    use({
        'projekt0n/github-nvim-theme',
        config = function()
            require('github-theme').setup()
        end
    })

    use { 'akinsho/git-conflict.nvim', tag = "*", config = function()
        require('git-conflict').setup()
    end }

    use({
        "utilyre/barbecue.nvim",
        requires = {
            "SmiteshP/nvim-navic",
            "nvim-tree/nvim-web-devicons", -- optional dependency
        },
        config = function()
            require("barbecue").setup()
        end,
    })

    use "rafamadriz/friendly-snippets"

    use "nvim-treesitter/nvim-treesitter-context"

    use {
        "folke/zen-mode.nvim",
        config = function()
            require("zen-mode").setup()
        end
    }

    use('eandrju/cellular-automaton.nvim')

    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            { 'jose-elias-alvarez/null-ls.nvim' },
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },
            { 'MunifTanjim/prettier.nvim' },


            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        }
    }

    use 'ishan9299/modus-theme-vim'

    use('neovim/nvim-lspconfig')

    use('jose-elias-alvarez/null-ls.nvim')

    use('MunifTanjim/prettier.nvim')

    use 'nvim-lua/lsp-status.nvim'

    use 'mbbill/undotree'

    use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }

    use { 'xiyaowong/nvim-transparent' }

    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }

    use {
        'nvim-tree/nvim-tree.lua',
        config = function()
            require("nvim-tree").setup({
                update_focused_file = {
                    enable = true,
                },
                filters = {
                    dotfiles = false,
                    custom = { '^.git$' }
                },
                diagnostics = {
                    enable = true,
                },
            })
        end,
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional, for file icons
        },
    }

    use("github/copilot.vim")

    use {
        'rmagatti/auto-session',
        config = function()
            require("auto-session").setup {
                log_level = "error",
                auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
            }
        end
    }

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true },
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
    }

    use {
      'dhruvmanila/browser-bookmarks.nvim',
      tag = '*',
      requires = {
        'nvim-telescope/telescope.nvim',
      }
    }

    use "almo7aya/openingh.nvim"


    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)
