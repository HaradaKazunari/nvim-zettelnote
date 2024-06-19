# nvim-zettelnote
nvim-zettelnote is note plugin for neovim.

## Install
It is required telescope.  
```
  {
    "HaradaKazunari/nvim-zettelnote",
    dependencies = {
      {
        "nvim-telescope/telescope.nvim",
        "nvim-telescope/telescope-file-browser.nvim",
      },
    },
  }
```

## Usage
open new note file `;nn`
open filter `;nf`

## Customization
default of vault path is `$HOME/note/`
```
require("zettelnote").setup({
  vault = "/path/to/save/note file",
  keymap = {
      new_file = ";nn",
      fazzy = ";nf"
  }
})
```
