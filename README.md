# Koala Theme for Neovim

A light theme ported from VS Code. Standalone, no dependencies.

## Installation

Using [lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
{
  dir = "/path/to/koala-neovim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd("colorscheme koala")
  end,
}
```

## Colors

| Role | Hex | Usage |
|------|-----|-------|
| Ink | `#000000` | Variables, functions, punctuation |
| Navy | `#0b0080` | Keywords, storage, tags |
| Maroon | `#800000` | Strings, numbers, constants |
| Forest | `#006600` | Class names |
| Bronze | `#ae6000` | Types, interfaces, attributes |
| Slate | `#6e7781` | Comments (italic) |
