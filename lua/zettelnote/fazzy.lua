local util = require('zettelnote.util')
local M = {}


local telescope = require("telescope")
telescope.setup({
  defaults = {
    file_ignore_patterns = {
      "^.git/",
      "^.cache/",
      "^Library/",
      "node_modules",
      "vendor",
      ".DS_Store"
    },
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "-uu",
    },
  }
})

function M.open_note_filer(base_path)
  util.create_directory_if_not_exists(base_path)
  telescope.extensions.file_browser.file_browser({
    path = base_path,
    cwd = base_path,
    respect_gitignore = false,
    hidden = false,
    grouped = true,
    previewer = false,
    initial_mode = "normal",
    layout_config = { height = 40 },
  })
end

function M.filtering_by_tags(base_path)
  util.create_directory_if_not_exists(base_path)
  telescope.extensions.live_grep_args.live_grep_args({
    path = base_path,
    cwd = base_path,
    respect_gitignore = false,
    hidden = false,
    grouped = true,
    previewer = false,
    initial_mode = "insert",
    layout_config = { height = 40 },
  })
end

return M
