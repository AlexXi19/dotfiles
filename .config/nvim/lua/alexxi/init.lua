require("alexxi.lazy")
require("alexxi.sets")
require("alexxi.keymaps")
require("alexxi.lazy")

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local function load_configs()
  local configs_path = vim.fn.stdpath('config') .. '/lua/alexxi/configs/*.lua'
  local files = vim.fn.glob(configs_path, false, true)

  for _, file in ipairs(files) do
    local module = file:match(".+/([^/]+)%.lua$")
    if module then
      require('alexxi.configs.' .. module)
    end
  end
end

load_configs()

vim.loader.enable()
