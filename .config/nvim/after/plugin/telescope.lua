vim.keymap.set('n', '<C-p>', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<C-G>', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sp', require('telescope.builtin').git_files, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>qw', require('telescope.builtin').oldfiles, { desc = '[G]et [R]eferences' })
vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, { desc = '[G]et [R]eferences' })
vim.keymap.set('n', '<C-t>', require('telescope.builtin').lsp_workspace_symbols, {})


-- vim.keymap.set('n', '<C-p>', builtin.git_files, {})

-- vim.keymap.set('n', '<leader>ps', function()
-- 	builtin.grep_string({ search = vim.fn.input("Grep > ")})
-- end)
