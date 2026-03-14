# Koala Theme for Neovim

A light theme ported from VS Code, using [Mofiqul/vscode.nvim](https://github.com/Mofiqul/vscode.nvim) as the rendering engine with Koala's custom palette.

## Installation

Using [lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
{
  "henit-chobisa/koala-neovim",
  dependencies = { "Mofiqul/vscode.nvim" },
  lazy = false,
  priority = 1000,
  config = function()
    require("koala").setup()
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
