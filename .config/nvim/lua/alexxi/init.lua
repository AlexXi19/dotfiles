require("alexxi.packer")
require("alexxi.sets")
require("alexxi.keymaps")

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Leave only current window on startup
vim.cmd([[
    wincmd o
]])

