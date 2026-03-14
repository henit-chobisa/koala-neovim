# Koala Theme for Neovim

A light, clean theme ported from VS Code, featuring navy, maroon, forest green, and bronze syntax highlights.

## Installation

Using [lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
{
  "YOUR_GITHUB_USERNAME/koala.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd([[colorscheme koala]])
  end,
}
```

## Usage

```lua
require('koala').setup()
vim.cmd('colorscheme koala')
```
