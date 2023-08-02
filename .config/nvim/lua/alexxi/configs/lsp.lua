local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
    'tsserver',
    'rust_analyzer',
})

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
})

lsp.setup_nvim_cmp({
    mapping = cmp_mappings
})

lsp.set_preferences({
    suggest_lsp_servers = true,
    setup_servers_on_start = true,
    set_lsp_keymaps = { omit = { 'gd', 'gr', '<Tab>' } },
    configure_diagnostics = true,
    cmp_capabilities = true,
    manage_nvim_cmp = true,
    call_servers = 'local',
})

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }
    vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "gd", function()
        vim.lsp.buf.definition()
        vim.cmd("normal! zz")
    end, {
        buffer = bufnr,
        remap = false,
        silent = true
    })

    vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
        vim.lsp.diagnostic.on_publish_diagnostics, {
            virtual_text = true
        }
    )

    local ignore_lst = { "copilot", "yamlls" }

    if vim.tbl_contains(ignore_lst, client.name) then
        return
    end

    -- Define format functions
    local function format_fn()
        if client.name == "tsserver" then
            return vim.cmd("Prettier")
        else
            return vim.lsp.buf.format()
        end
    end

    vim.keymap.set("n", "<leader>fm", format_fn)

    -- Autoformatting on save but only if buffer has changed
    local buffer_changed = false

    function _G.set_buffer_changed()
        buffer_changed = true
    end

    function _G.format_if_changed()
        if buffer_changed then
            buffer_changed = false
            format_fn()
        end
    end

    vim.cmd [[
            augroup ChangeAutogroup
                autocmd!
                autocmd TextChanged,TextChangedI * lua set_buffer_changed()
            augroup END
        ]]

    vim.cmd [[
            augroup FormatAutogroup
                autocmd!
                autocmd BufWritePost *.js,*.rs,*.lua,*.py,*.go,*.c,*.cpp,*.java,*.ts,*.tsx,*.css,*.html,*.json,*.yaml,*.yml,*.md,*.graphql,*.vue,*.svelte lua format_if_changed()
            augroup END
        ]]
end)

vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    update_in_insert = false,
    underline = true,
    float = true,
})

lsp.nvim_workspace()

lsp.setup()
