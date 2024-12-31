local util = require('zettelnote.util')
local buffer = require('zettelnote.buffer')
local M = {}

function M.create_new_note_file(base_path)
  util.create_directory_if_not_exists(base_path)
  local date = util.get_date_str()
  local extention = ".md"
  local filename = date .. extention
  local path = base_path .. filename
  return path, filename
end

function M.open_new_file(vault)
  vim.cmd.edit(vault.path)
  buffer.add_default_propaty(vault.tag)
  util.set_cursor_position(5, 9)
end

return M
