local default_colorscheme = "github_dark_high_contrast"

-- Read color persisted 
function readColor()
  local file = io.open(COLORSCHEME_DIR, "r")
  if file then
    local firstLine = file:read("*line")
    file:close()
    return firstLine
  else
    return default_colorscheme
  end
end

local colorscheme = readColor()

vim.api.nvim_command("colorscheme " .. colorscheme)

require("transparent").setup({
  extra_groups = {
     "all"
  },
  exclude_groups = {},
})

require("barbecue.ui").toggle(true)

-- Persist colorscheme
function handleColorChange()
    local colorscheme = vim.api.nvim_exec('echo g:colors_name', true)

    local file, err = io.open(COLORSCHEME_DIR, 'w')

    if err then
        vim.api.nvim_err_writeln('Failed to open file: ' .. COLORSCHEME_DIR .. '. Error: ' .. err)
        return
    end

    file:write(colorscheme .. '\n')

    file:close()
end

-- Autocommand to call persist method on colorscheme change
vim.cmd([[
    augroup ColorSchemeChange
        autocmd!
        autocmd ColorScheme * lua handleColorChange()
    augroup END
]])
