local util = require("zettelnote.util")
local file = require("zettelnote.file")
local fazzy = require("zettelnote.fazzy")

local M = {
  config = {
    vault = {
      base_path = "$HOME/.config/note/",
      keymaps = {
        {
          keymap = ';nn',
          path = ''
        },
      }
    },
    fazzy = ";nf",
    filter_tags = ";nt"
  }
}

local function create_new_file_new(vault)
  local path = file.create_new_note_file(vault)
  file.open_new_file(path)
end

local function open_fazzy()
  fazzy.open_note_filer(M.config.vault)
end

local function filter_tags()
  fazzy.filtering_by_tags(M.config.vault)
end

function M.setup(config)
  if config ~= nil then
    M.config = vim.tbl_deep_extend('force', M.config, config)
  end

  for k, v in pairs(M.config.vault.keymaps) do
    local base_path = M.config.vault.base_path
    local keymap = v.keymap
    local folder =  v.path
    local vault = base_path .. folder
    vim.keymap.set("n", keymap, function() create_new_file_new(vault) end)
  end

  vim.keymap.set("n", M.config.fazzy, open_fazzy)
  vim.keymap.set("n", M.config.filter_tags, filter_tags)
end

return M
