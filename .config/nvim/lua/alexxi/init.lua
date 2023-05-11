require("alexxi.packer")
require("alexxi.sets")

require('Comment').setup()


-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- empty setup using defaults
require("alexxi.keymaps")
require("nvim-tree").setup()
require("autoclose").setup()
require('gitsigns').setup {
    signcolumn = true,          -- Toggle with `:Gitsigns toggle_signs`
    current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
}
require('smoothcursor').setup()

-- vim.api.nvim_command('autocmd BufEnter * lua vim.defer_fn(function() print("Connected to buffer " .. vim.fn.expand("%")) end, 1000)')

-- Ts server does not connect to the buffer automatically, this is hack to start it manually on connecting to buffer



-- vim.api.nvim_command('autocmd BufEnter * lua vim.defer_fn(function() vim.api.nvim_command("LspStart") end, 500)')

