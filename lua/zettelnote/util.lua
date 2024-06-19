local M = {}

function M.create_directory_if_not_exists(path)
  local cmd = 'mkdir -p "' .. path .. '"'
  local success, _, code = os.execute(cmd)
  return success, code
end

function M.get_date_str()
  local d = os.date("*t")
  local year = tostring(d.year)
  local month = string.format("%02d", d.month)
  local day = string.format("%02d", d.day)
  local hour = string.format("%02d", d.hour)
  local min = string.format("%02d", d.min)
  local sec = string.format("%02d", d.sec)
  local join_str = year .. month .. day .. hour .. min .. sec
  return join_str, year, month, day, hour, min, sec
end

function M.set_cursor_position(line, col)
  local win = vim.api.nvim_get_current_win()
  vim.api.nvim_win_set_cursor(win, { line, col })
end

return M
