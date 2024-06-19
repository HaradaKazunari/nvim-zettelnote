local util = require('zettelnote.util')
local files = require("zettelnote.__files")

local M = {}

function M.open_note_filer(base_path)
  local path = util.empty_ignore(base_path)
  util.create_directory_if_not_exists(base_path)
  vim.cmd("Telescope file_browser file_ignore_patterns=.DS_Store cwd=" .. path)
end

function M.filtering_by_tags(base_path)
  util.create_directory_if_not_exists(base_path)
  local path = base_path
  local prefix = "  - \"?#?"
  local opts = {
    path = path,
    cwd = path,
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
      '-uu',
      '-U',
    },
    prompt_title = "Filter by tags",
    initial_mode = "insert",
    previewer = true,
    theme = "dropdown",
    prev_prompt = prefix,
  }
  files.live_grep(opts)
end

return M
