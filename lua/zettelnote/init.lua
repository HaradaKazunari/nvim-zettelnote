local util = require("zettelnote.util")
local file = require("zettelnote.file")
local fazzy = require("zettelnote.fazzy")

local M = {
  config = {
    vault = "$HOME/.config/note/",
    keymap = {
      new_file = ";nn",
      fazzy = ";nf",
      filter_tags = ";nt"
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

local function filter_tags()
  fazzy.filtering_by_tags(M.config.vault)
  util.grep_tag(M.config.vault)
end

function M.setup(config)
  if config ~= nil then
    M.config = vim.tbl_deep_extend('force', M.config, config)
  end

  vim.keymap.set("n", M.config.keymap.fazzy, function() open_fazzy() end)
  vim.keymap.set("n", M.config.keymap.new_file, function() create_new_file() end)
  vim.keymap.set("n", M.config.keymap.filter_tags, function() filter_tags() end)
end

return M
