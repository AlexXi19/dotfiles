require('telescope').load_extension('bookmarks')
require('browser_bookmarks').setup({
  selected_browser = 'chrome',
})

vim.keymap.set('n', '<C-p>', require('telescope.builtin').find_files)
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<C-G>', function() require('telescope.builtin').live_grep({ additional_args = { "-j1" } }) end, { desc = '[G]rep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sp', require('telescope.builtin').git_files)
vim.keymap.set('n', '<leader>qw', require('telescope.builtin').oldfiles)
vim.keymap.set('n', '<C-t>', require('telescope.builtin').lsp_dynamic_workspace_symbols, {})
-- vim.keymap.set('n', '<C-t>', require('telescope.builtin').lsp_workspace_symbols, {})
vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, { desc = '[G]et [R]eferences' })
vim.keymap.set('n', '<leader>sb', require('telescope.builtin').git_branches, {})
vim.keymap.set('n', '<leader>ff', require('telescope.builtin').current_buffer_fuzzy_find, {})
vim.keymap.set('n', '<leader>ts', require('telescope.builtin').builtin, {})
vim.keymap.set('n', '<leader>sl', function () require('telescope').extensions.bookmarks.bookmarks({ selected_browser = "chrome" }) end, {})

