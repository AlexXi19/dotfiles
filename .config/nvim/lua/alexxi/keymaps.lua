vim.g.mapleader = " "

-- Moving visual blocks around
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")

-- Override scroll because the scroll options always get reset
vim.keymap.set("n", "<C-d>", "15jzz")
vim.keymap.set("n", "<C-u>", "15kzz")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "gd", "gdzz")

vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- Leap
vim.keymap.set({ 'n', 'x', 'o' }, 'q', '<Plug>(leap-forward-to)')
vim.keymap.set({ 'n', 'x', 'o' }, 'Q', '<Plug>(leap-backward-to)')

-- Toggle search highlighting
vim.keymap.set("n", "<leader>/", ":set invhlsearch  \n")

-- Tmux sessionizer
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer-full<CR>")

-- Find and replace
vim.keymap.set("n", "<leader>fr", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Remove bracket paragraph jumping from jump list
vim.api.nvim_set_keymap("n", "}", [[:keepjumps normal! }<cr>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "{", [[:keepjumps normal! {<cr>]], { noremap = true, silent = true })

-- Toggle NvimTree file directory
vim.keymap.set("n", "<C-b>", "<cmd>NvimTreeFindFileToggle<CR>")

-- Git branch diff
vim.keymap.set("n", "<leader>gd", "<cmd>DiffviewOpen<CR>")
vim.keymap.set("n", "z", "zz")

-- Cursor movement
vim.keymap.set({ "n", "v" }, "+", "_", { noremap = true })
vim.keymap.set({ "n", "v" }, "_", "$", { noremap = true })
-- vim.keymap.set("n", "<leader>k", "H", { noremap = true })
-- vim.keymap.set("n", "<leader>j", "L", { noremap = true })
-- vim.keymap.set("n", "<leader>m", "M", { noremap = true })
-- vim.keymap.set({ "n", "v" }, "L", "$")
-- vim.keymap.set({ "n", "v" }, "H", "^")
-- vim.keymap.set('n', 'F', '<cmd>lua vim.lsp.buf.hover()<CR>', { noremap = true, silent = true })

-- Close/Save Commands
vim.api.nvim_create_user_command("W", "w", {})
vim.api.nvim_create_user_command("X", "x", {})
vim.api.nvim_create_user_command("Q", "q", {})
vim.keymap.set("n", "<C-z>", ":xa \n")
vim.keymap.set("n", "<C-c>", ":q \n")

-- Exit
vim.keymap.set("n", "<C-z>", ":xa \n")

-- Prev file
vim.keymap.set("n", "<C-q>", "<C-^>zz")

-- Navigate jump list
vim.keymap.set("n", "<C-i>", "<C-i>zz")
vim.keymap.set("n", "<C-o>", "<C-o>zz")

-- Pane movement
vim.keymap.set("n", "<leader>h", "<C-w>h")
vim.keymap.set("n", "<leader>l", "<C-w>l")

-- Disable continuation of comment on neew line
vim.cmd("autocmd BufEnter * set formatoptions-=cro")
vim.cmd("autocmd BufEnter * setlocal formatoptions-=cro")

-- Copilot keybinds
vim.keymap.set("i", "<Right>", "copilot#Accept(\"<CR>\")", { expr = true, silent = true, replace_keycodes = false })

-- Line movement
vim.keymap.set({"n", "v"}, "<Right>", "$")
vim.keymap.set({"n", "v"}, "<Left>", "^")

-- Undo and redo in insert mode
vim.keymap.set("i", "<C-u>", "<cmd>:normal! u<CR>")
vim.keymap.set("i", "<C-r>", "<cmd>:normal! <C-r><CR>")

-- MAKE IT RAIN
vim.api.nvim_create_user_command("Kms", "CellularAutomaton make_it_rain", {})

-- Git blame
vim.keymap.set("n", "<leader>gb", "<cmd>Gitsigns toggle_current_line_blame<CR>")

-- Format
vim.keymap.set("n", "<leader>fm", vim.lsp.buf.format)

-- Toggle Diagnostic
local diagnostics_active = true
vim.keymap.set('n', '<leader>di', function()
    diagnostics_active = not diagnostics_active
    if diagnostics_active then
        vim.diagnostic.show()
    else
        vim.diagnostic.hide()
    end
end)

-- Recall list
vim.keymap.set("n", "<C-e>", "<cmd>lua require('recall').toggle()<CR>")

-- Undo tree
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
