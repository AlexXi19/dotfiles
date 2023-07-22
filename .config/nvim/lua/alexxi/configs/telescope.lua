local actions = require("telescope.actions")
local previewers = require("telescope.previewers")
local telescope_config = require("telescope.config")


-- Do not preview files larger than 100kb
local new_maker = function(filepath, bufnr, opts)
  opts = opts or {}

  filepath = vim.fn.expand(filepath)
  vim.loop.fs_stat(filepath, function(_, stat)
    if not stat then return end
    if stat.size > 100000 then
      return
    else
      previewers.buffer_previewer_maker(filepath, bufnr, opts)
    end
  end)
end

-- Find files: Falling back to find_files if git_files can't find a .git directory
local find_files = function()
  local opts = {}
  vim.fn.system('git rev-parse --is-inside-work-tree')
  if vim.v.shell_error == 0 then
    require"telescope.builtin".git_files(opts)
  else
    require"telescope.builtin".find_files(opts)
  end
end

-- Clone the default Telescope configuration
local vimgrep_arguments = { unpack(telescope_config.values.vimgrep_arguments) }

-- I want to search in hidden/dot files.
table.insert(vimgrep_arguments, "--hidden")
-- I don't want to search in the `.git` directory.
table.insert(vimgrep_arguments, "--glob")
table.insert(vimgrep_arguments, "!**/.git/*")

require('telescope').setup {
    defaults = {
        file_ignore_patterns = { "node_modules/*", ".git/*", "build/*", "dist/*", "target/*" },
        buffer_previewer_maker = new_maker,
        vimgrep_arguments = vimgrep_arguments,
        mappings = {
            i = {
                ["<esc>"] = actions.close -- Close telescope on escape
            },
        },
        pickers = {
            oldfiles = {
                cwd_only = true,
            },
            find_files = {
                find_command = { "rg", "--files", "--hidden", "--glob", "--unrestricted", "!**/.git/*"},
                hidden = true
            },
        },
        extensions = {
            bookmarks = {
                selected_browser = 'chrome',
            },
        },
    }
}

-- Keymaps
vim.keymap.set('n', '<C-p>', find_files)
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

