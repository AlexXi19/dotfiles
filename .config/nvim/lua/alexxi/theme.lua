
require("transparent").setup({
  enable = true, -- boolean: enable transparent
  extra_groups = { -- table/string: additional groups that should be cleared
    -- In particular, when you set it to 'all', that means all available groups
     "all"
  },
  exclude = {}, -- table: groups you don't want to clear
})


require('Comment').setup({
    toggler = {
        ---Line-comment toggle keymap
        --- line = '<C-/>',
        ---Block-comment toggle keymap
        -- block = '<C-/>',
    },
})

require("catppuccin").setup({
    flavour = "mocha", -- latte, frappe, macchiato, mocha
    transparent_background = true,
    term_colors = false,
    dim_inactive = {
        enabled = true,
        shade = "dark",
        percentage = 0.15,
    },
})
