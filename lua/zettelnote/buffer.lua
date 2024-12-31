local util = require('zettelnote.util')
local M = {}

function M.get_buffer()
  local buf = vim.api.nvim_get_current_buf()
  return buf
end

function M.add_default_propaty(tag)
  tag = tag or ''
  local id, year, month, day = util.get_date_str()
  local date = year .. month .. day
  local lines = {
    "---",
    "id: " .. id,
    "date: " .. date,
    "tags: ",
    "\t- \"#".. tag .. "\"",
    "---",
  }

  local buf = M.get_buffer()
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
end

return M
