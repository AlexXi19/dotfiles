local lsp = require("lsp-zero")
local lspconfig = require('lspconfig')


-- local event = "BufWritePre" -- or "BufWritePost"

lsp.preset("recommended")

lsp.ensure_installed({
    'tsserver',
    'rust_analyzer',
})

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<CR>'] = cmp.mapping.confirm({ select = true }),
  ["<C-Space>"] = cmp.mapping.complete(),
})


lsp.set_preferences({
    suggest_lsp_servers = true,
    setup_servers_on_start = true,
    set_lsp_keymaps = { omit = { 'gd', 'gr' } },
    configure_diagnostics = true,
    cmp_capabilities = true,
    manage_nvim_cmp = true,
    call_servers = 'local',
})

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})


lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }
    vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
    vim.keymap.set("n", "gd", function()
        vim.lsp.buf.definition()
        vim.cmd("normal! zz")
    end, {
        buffer = bufnr,
        remap = false,
        silent = true
    })

    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)


    vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
        vim.lsp.diagnostic.on_publish_diagnostics, {
            virtual_text = true
        }
    )
end)

-- require 'lspconfig'.tsserver.setup {
--     filetypes = { "javascript", "typescript", "typescriptreact", "typescript.tsx" },
--     root_dir = function() return vim.loop.cwd() end,
--     single_file_support = false,
-- }

vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    update_in_insert = false,
    underline = true,
    float = true,
})


-- Fix undefined global variable
lsp.nvim_workspace()

lsp.setup()

-- Lsp status line
local lsp_status = require('lsp-status')
lsp_status.register_progress()
