local default_colorscheme = "github_dark_high_contrast"
COLORSCHEME_DIR=os.getenv("HOME") .. "/.cache/nvim/colorscheme.txt"

-- Read color persisted
local function readColor()
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

-- Persist colorscheme
function HANDLE_COLOR_CHANGE()
    local newcolorscheme = vim.api.nvim_exec('echo g:colors_name', true)

    local file, err = io.open(COLORSCHEME_DIR, 'w')

    if err then
        vim.api.nvim_err_writeln('Failed to open file: ' .. COLORSCHEME_DIR .. '. Error: ' .. err)
        return
    end

    if file == nil then
        vim.api.nvim_err_writeln('Failed to open file: ' .. COLORSCHEME_DIR)
        return
    end

    file:write(newcolorscheme .. '\n')

    file:close()
end

-- Autocommand to call persist method on colorscheme change
vim.cmd([[
    augroup ColorSchemeChange
        autocmd!
        autocmd ColorScheme * lua HANDLE_COLOR_CHANGE()
    augroup END
]])

-- Nvim tree weirdness
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'NvimTree' },
  callback = function(args)
    vim.api.nvim_create_autocmd('VimLeavePre', {
      callback = function()
        vim.api.nvim_buf_delete(args.buf, { force = true })
        return true
      end
    })
  end,
})

vim.api.nvim_create_autocmd({ 'BufEnter' }, {
  pattern = 'NvimTree*',
  callback = function()
    local view = require('nvim-tree.view')
    local is_visible = view.is_visible()

    local api = require('nvim-tree.api')
    if not is_visible then
      api.tree.open()
    end
  end,
})


require('avante_lib').load()
