local lsp = require("lsp-zero")
local prettier = require("prettier")
local avante = require("avante")

prettier.setup({
    bin = 'prettierd',
    filetypes = {
        "css",
        "graphql",
        "html",
        "javascript",
        "javascriptreact",
        "json",
        "less",
        "markdown",
        "scss",
        "typescript",
        "typescriptreact",
        "yaml",
    },
})


lsp.preset("recommended")

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

local allowed_actions = { "Fix all auto-fixable problems", "Organize Imports" }

local function fix_problems()
    vim.lsp.buf.code_action({
        apply = true,
        filter = function(action)
            return vim.tbl_contains(allowed_actions, action.title)
        end,
    })
end

lsp.configure('ts_ls', {
    flags = {
        debounce_text_changes = 200,
    },
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
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<leader>df", vim.diagnostic.open_float, opts)
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

    local ignore_lst = { "GitHub Copilot", "yamlls", "tailwindcss", "eslint" }

    if vim.tbl_contains(ignore_lst, client.name) then
        return
    end

    -- Define format functions
    local function format_fn()
        if client.name == "ts_ls" then
            vim.cmd("Prettier")
            return
        else
            vim.lsp.buf.format()
        end
        fix_problems()
    end

    vim.keymap.set("n", "<leader>fm", function() format_fn() end)

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
                autocmd BufWritePost *.js,*.rs,*.lua,*.py,*.go,*.c,*.cpp,*.java,*.ts,*.mts,*.tsx,*.css,*.html,*.json,*.md,*.graphql,*.vue,*.svelte lua format_if_changed()
            augroup END
        ]]
end)

-- @source https://gist.github.com/alextes/e6704e5376709d194d21f615f8542ccb

vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    update_in_insert = false,
    underline = true,
    float = true,
})

lsp.nvim_workspace()

-- require('copilot').setup({
--     panel = {
--         enabled = true,
--         auto_refresh = false,
--         keymap = {
--             jump_prev = "[[",
--             jump_next = "]]",
--             accept = "<CR>",
--             refresh = "gr",
--             open = "<M-CR>"
--         },
--         layout = {
--             position = "bottom", -- | top | left | right
--             ratio = 0.4
--         },
--     },
--     suggestion = {
--         enabled = true,
--         auto_trigger = false,
--         hide_during_completion = true,
--         debounce = 75,
--         keymap = {
--             accept = "<Right>",
--             accept_word = false,
--             accept_line = false,
--             next = "<M-]>",
--             prev = "<M-[>",
--             dismiss = "<C-]>",
--         },
--     },
--     filetypes = {
--         yaml = false,
--         markdown = false,
--         help = false,
--         gitcommit = false,
--         gitrebase = false,
--         hgcommit = false,
--         svn = false,
--         cvs = false,
--         ["."] = false,
--     },
--     copilot_node_command = 'node', -- Node.js version must be > 18.x
--     server_opts_overrides = {},
-- })

vim.keymap.set("i", "<Right>", "copilot#Accept(\"<CR>\")", { expr = true, silent = true, replace_keycodes = false })

lsp.setup()
-- Copilot keybinds

avante.setup {
    ---@alias Provider "claude" | "openai" | "azure" | "gemini" | "cohere" | "copilot" | string
    provider = "openai",                  -- Recommend using Claude
    auto_suggestions_provider = "claude", -- Since auto-suggestions are a high-frequency operation and therefore expensive, it is recommended to specify an inexpensive provider or even a free provider: copilotA
    claude = {
        endpoint = "https://api.anthropic.com",
        model = "claude-3-5-sonnet-20241022",
        temperature = 0,
        max_tokens = 4096,
    },
    openai = {
        endpoint = "https://openrouter.ai/api/v1",
        -- model = "anthropic/claude-3.5-sonnet",
        model = "anthropic/claude-3.5-sonnet",
        api_key_name = "OPENROUTER_API_KEY",
        temperature = 0.6,
        max_tokens = 8000,
    },
    vendors = {
        openrouter = {
            -- __inherited_from = "openai",
            api_key_name = "OPENROUTER_API_KEY",
            endpoint = "https://openrouter.ai/api/v1",
            model = "anthropic/claude-3.5-sonnet",
            max_tokens = 4096,
        },
    },
    behaviour = {
        auto_set_keymaps = false,
        auto_apply_diff_after_generation = false,
        support_paste_from_clipboard = false,
    },
    mappings = {
        --- @class AvanteConflictMappings
        diff = {
            ours = "co",
            theirs = "ct",
            all_theirs = "ca",
            both = "cb",
            cursor = "cc",
            next = "]x",
            prev = "[x",
        },
        suggestion = {
            accept = "<M-l>",
            next = "<M-]>",
            prev = "<M-[>",
            dismiss = "<C-]>",
        },
        jump = {
            next = "]]",
            prev = "[[",
        },
        submit = {
            normal = "<CR>",
            insert = "<CR>",
        },
        sidebar = {
            apply_all = "A",
            apply_cursor = "a",
            switch_windows = "<Tab>",
            reverse_switch_windows = "<S-Tab>",
        },
    },
    hints = { enabled = false },
    windows = {
        ---@type "right" | "left" | "top" | "bottom"
        position = "right",   -- the position of the sidebar
        wrap = true,          -- similar to vim.o.wrap
        width = 30,           -- default % based on available width
        sidebar_header = {
            enabled = true,   -- true, false to enable/disable the header
            align = "center", -- left, center, right for title
            rounded = true,
        },
        input = {
            prefix = "-- ",
        },
        edit = {
            border = "rounded",
            start_insert = true, -- Start insert mode when opening the edit window
        },
        ask = {
            floating = false,    -- Open the 'AvanteAsk' prompt in a floating window
            start_insert = true, -- Start insert mode when opening the ask window, only effective if floating = true.
            border = "rounded",
        },
    },
    highlights = {
        ---@type AvanteConflictHighlights
        diff = {
            current = "DiffText",
            incoming = "DiffAdd",
        },
    },
    --- @class AvanteConflictUserConfig
    diff = {
        autojump = true,
        ---@type string | fun(): any
        list_opener = "copen",
    },
}

require("chatgpt").setup({
    -- this config assumes you have OPENAI_API_KEY environment variable set
    openai_params = {
        -- NOTE: model can be a function returning the model name
        -- this is useful if you want to change the model on the fly
        -- using commands
        -- Example:
        -- model = function()
        --     if some_condition() then
        --         return "gpt-4-1106-preview"
        --     else
        --         return "gpt-3.5-turbo"
        --     end
        -- end,
        model = "gpt-4o",
        frequency_penalty = 0,
        presence_penalty = 0,
        max_tokens = 4095,
        temperature = 0.2,
        top_p = 0.1,
        n = 1,
    },
    chat = {
        keymaps = {
            close = "<C-c>",
            close_n = "<Esc>",
            yank_last = "<C-y>",
            yank_last_code = "<C-k>",
            scroll_up = "<C-u>",
            scroll_down = "<C-d>",
            new_session = "<C-n>",
            cycle_windows = "<Tab>",
            cycle_modes = "<C-f>",
            next_message = "<C-j>",
            prev_message = "<C-k>",
            select_session = "<CR>",
            rename_session = "r",
            delete_session = "d",
            draft_message = "<C-r>",
            edit_message = "e",
            delete_message = "d",
            toggle_settings = "<C-o>",
            toggle_sessions = "<C-p>",
            toggle_help = "<C-h>",
            toggle_message_role = "<C-r>",
            toggle_system_role_open = "<C-s>",
            stop_generating = "<C-x>",
        },
    }
})
