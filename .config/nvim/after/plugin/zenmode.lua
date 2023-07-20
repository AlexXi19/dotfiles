vim.keymap.set("n", "<leader>m", function()
    require("zen-mode").setup {
        window = {
            backdrop = 0.2,
            width = 0.9,
            height = 0.9,
            options = {

            }
        },
        plugins = {
            options = {
                showcmd = true,
            },
            tmux = { enabled = true }, -- disables the tmux statusline
            kitty = {
                enabled = true,
                font = "+80", -- font size increment
            },
        },
        on_open = function(win)
            require("barbecue.ui").toggle()
            -- Clear prev command output
            print(" ")
        end,
        on_close = function(win)
            require("barbecue.ui").toggle()
        end,
    }
    require("zen-mode").toggle()
    vim.wo.wrap = false
    vim.wo.number = true
    vim.wo.rnu = true
end)
