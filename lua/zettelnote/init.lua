local file = require("zettelnote.file")
local fazzy = require("zettelnote.fazzy")
local M = {
  config = {
    vault = "$HOME/.config/note/",
    keymap = {
      new_file = ";nn",
      fazzy = ";nf"
    }
  }
}

local function create_new_file()
  local path = file.create_new_note_file(M.config.vault)
  file.open_new_file(path)
end

local function open_fazzy()
  fazzy.open_note_filer(M.config.vault)
end

function M.setup(config)
  if config ~= nil then
    M.config = vim.tbl_deep_extend('force', M.config, config)
  end

  vim.keymap.set("n", M.config.keymap.fazzy, function() open_fazzy() end)
  vim.keymap.set("n", M.config.keymap.new_file, function() create_new_file() end)
end

return M
