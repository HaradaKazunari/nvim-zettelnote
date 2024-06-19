local util = require('zettelnote.util')
local M = {}

local _, telescope = pcall(require, "telescope")
function M.open_note_filer(base_path)
  local success, _ = util.create_directory_if_not_exists(base_path)
  if success then
    telescope.extensions.file_browser.file_browser({
      path = base_path,
      cwd = vim.fn.expand("%:p:h"),
      respect_gitignore = false,
      hidden = true,
      grouped = true,
      previewer = false,
      initial_mode = "normal",
      layout_config = { height = 40 },
    })
  end
end

return M
