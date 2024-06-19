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

function M.get_grep_tag(path)
  path = M.empty_ignore(path)
  local cmd = 'rg -NIie "^  - \\\"?#?" ' .. path
  local handle = io.popen(cmd)
  local input = handle:read("*a")
  handle:close()
  local lines = {}
  for line in input:gmatch("[^\r\n]+") do
    local trimmed = line:gsub("^%s*%- %s*", ""):gsub("\"", ""):gsub("#", "")
    table.insert(lines, trimmed)
  end

  return lines
end

function M.resolce_tag(tag)
  tag = tag:gsub(" ", "")
  tag = tag:gsub("-", "")
  tag = tag:gsub("\"", "")
  tag = tag:gsub("#", "")
  return tag
end

function M.empty_ignore(str)
  return str:gsub(" ", "\\ ")
end

return M
