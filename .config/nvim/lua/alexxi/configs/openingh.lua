-- for repository page
vim.api.nvim_set_keymap("n", "<leader>gr", ":OpenInGHRepo <CR>", { silent = true, noremap = true })

-- for current file page
vim.api.nvim_set_keymap("n", "<leader>gf", ":OpenInGHFile <CR>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("v", "<leader>gf", ":OpenInGHFileLines <CR>", { silent = true, noremap = true })
