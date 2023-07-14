require("alexxi.packer")
require("alexxi.sets")
require("alexxi.keymaps")

COLORSCHEME_DIR=os.getenv("HOME") .. "/.cache/nvim/colorscheme.txt"


-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.loader.enable()
