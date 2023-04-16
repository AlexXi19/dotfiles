vim.g.mapleader = " "

-- Moving visual blocks around
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")

-- Navigating with pages
vim.keymap.set("n", "<C-d>", "<C-d>zz")

vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- Toggle search highlighting
vim.keymap.set("n", "<leader>/", ":set invhlsearch  \n")

-- Tmux sessionizer
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer-full<CR>")

-- Find and replace
vim.keymap.set("n", "<leader>fr", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Lsp format
vim.keymap.set("n", "<leader>fm", ":LspZeroFormat \n")

-- Remove bracket paragraph jumping from jump list
vim.api.nvim_set_keymap("n", "}", [[:keepjumps normal! }<cr>]], { noremap = true })
vim.api.nvim_set_keymap("n", "{", [[:keepjumps normal! {<cr>]], { noremap = true })

-- Toggle NvimTree file directory
vim.keymap.set("n", "<leader>fd", ":NvimTreeToggle \n")

-- Git branch diff
vim.keymap.set("n", "<leader>gd", ":DiffviewOpen \n")
vim.keymap.set("n", "z", "zz")

-- Close/Save Commands
vim.api.nvim_create_user_command("W", "w", {})
vim.api.nvim_create_user_command("X", "x", {})
vim.api.nvim_create_user_command("Q", "q", {})
vim.keymap.set("n", "<C-z>", ":xa \n")
vim.keymap.set("n", "<C-c>", ":q \n")
vim.keymap.set("n", "<C-x>", ":x \n")
vim.keymap.set("n", "<C-s>", ":w \n")

-- Exit
vim.keymap.set("n", "<C-z>", ":xa \n")

-- Prev file
vim.keymap.set("n", "<C-q>", "<C-^>")

-- Save actions

-- Pane movement
vim.keymap.set("n", "<C-n>", "<C-w><C-w>")
vim.keymap.set("n", "<leader>h", "<C-w>h")
vim.keymap.set("n", "<leader>l", "<C-w>l")

-- Disable continuation of comment on neew line
vim.cmd("autocmd BufEnter * set formatoptions-=cro")
vim.cmd("autocmd BufEnter * setlocal formatoptions-=cro")

-- Copilot keybinds
vim.keymap.set("i", "<Right>", "copilot#Accept(\"<CR>\")", { expr = true, silent = true })
