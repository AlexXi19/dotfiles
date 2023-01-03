require("alexxi.packer")
require("alexxi.sets")
require("alexxi.theme")

require('Comment').setup()


-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- empty setup using defaults
require("nvim-tree").setup()


require("alexxi.keymaps")
