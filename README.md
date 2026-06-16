# Koala Theme for Neovim

A consistency-first colorscheme, ported from VS Code. Standalone, no dependencies.

Two city variants, one grammar:

- **`koala-hyderabad`** — light ("paper"). The original. (`koala` still works as an alias.)
- **`koala-bengaluru`** — dark ("soft evening"). Eye-friendly companion built
  from the same 6 syntax roles, remapped to desaturated pastels — never neon.

Both share one highlight engine, so a keyword is navy, a string is maroon, and a
comment is slate in *both* themes. Only the hex values shift.

## Installation

Using [lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
{
  dir = "/path/to/koala-neovim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd("colorscheme koala-hyderabad")    -- light
    -- vim.cmd("colorscheme koala-bengaluru") -- dark
  end,
}
```

Or drive it from Lua:

```lua
require("koala").setup()        -- light  (koala-hyderabad)
require("koala").setup("dark")  -- dark   (koala-bengaluru)
```

## The 6 syntax roles

| Role | Usage | `koala-hyderabad` (light) | `koala-bengaluru` (dark) |
|------|-------|-----------------|--------------------------|
| Ink | Variables, functions, punctuation | `#000000` | `#cccfd4` |
| Navy | Keywords, storage, tags | `#0b0080` | `#8fb6e3` |
| Maroon | Strings, numbers, constants | `#800000` | `#d49a8c` |
| Forest | Class names | `#006600` | `#9cc59b` |
| Bronze | Types, interfaces, attributes | `#ae6000` | `#d6b780` |
| Slate | Comments (italic) | `#6e7781` | `#6f7680` |

### Koala Bengaluru base

| Element | Hex |
|---------|-----|
| Background | `#1e2024` |
| Foreground | `#cccfd4` |
| Cursor line | `#26282d` |
| Selection | `#33394a` |
| Status bar | `#28313f` |
| Accent | `#8fb6e3` |
