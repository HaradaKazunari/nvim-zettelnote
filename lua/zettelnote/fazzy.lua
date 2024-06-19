local util = require('zettelnote.util')
local files = require("zettelnote.__files")
local telescope = require("telescope")

local M = {}

function M.open_note_filer(base_path)
  util.create_directory_if_not_exists(base_path)
  telescope.extensions.file_browser.file_browser({
    cwd = base_path,
    respect_gitignore = false,
    grouped = true,
    initial_mode = "normal",
    layout_config = { height = 40 },
  })
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
