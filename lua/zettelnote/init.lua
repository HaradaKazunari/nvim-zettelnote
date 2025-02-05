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
          path = '',
          tag = ''
        },
      }
    },
    fazzy = ";nf",
    filter_tags = ";nt"
  }
}

local function create_new_file_new(vault)
  local path = file.create_new_note_file(vault.path)
  file.open_new_file(path, vault.tag)
end

local function open_fazzy(config)
  local path = config.vault.base_path
  fazzy.open_note_filer(path)
end

local function filter_tags(config)
  local path = config.vault.base_path
  fazzy.filtering_by_tags(path)
end

function M.setup(config)
  if config ~= nil then
    M.config = vim.tbl_deep_extend('force', M.config, config)
  end

  for k, v in pairs(M.config.vault.keymaps) do
    local base_path = M.config.vault.base_path
    local keymap = v.keymap
    local folder = v.path
    local vault = base_path .. folder

    local tag = v.tag
    vim.keymap.set("n", keymap, function()
      create_new_file_new({
        path = vault,
        tag = tag
      })
    end)
  end

  vim.keymap.set("n", M.config.fazzy, function() open_fazzy(M.config) end)
  vim.keymap.set("n", M.config.filter_tags, function() filter_tags(M.config) end)
end

return M
