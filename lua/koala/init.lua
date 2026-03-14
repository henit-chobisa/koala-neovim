-- Koala Theme for Neovim
-- Uses Mofiqul/vscode.nvim as the rendering engine,
-- with Koala's color palette injected via color_overrides.

local M = {}

function M.setup()
  vim.o.background = "light"

  require("vscode").setup({
    style = "light",
    transparent = false,
    italic_comments = true,

    -- ═══════════════════════════════════════════════════════════
    -- Map Koala palette → vscode.nvim color variables
    --
    -- How vscode.nvim uses these in LIGHT mode (from theme.lua):
    --   vscBlue      → @keyword, @constructor, @boolean,
    --                   @constant.builtin, @variable.builtin,
    --                   Type, StorageClass, Typedef, @tag
    --   vscPink      → @keyword.import, @keyword.conditional,
    --                   @keyword.repeat, @keyword.return,
    --                   @keyword.exception, Statement, Keyword,
    --                   Include, Define, Conditional, Repeat
    --   vscBlueGreen → @type, Structure, @module,
    --                   @constant.macro, @attribute.builtin
    --   vscLightBlue → @variable, @property, @field,
    --                   @variable.parameter
    --   vscYellow    → @function, @function.call,
    --                   @function.method, @function.method.call
    --   vscOrange    → @string (in light mode)
    --   vscYellowOrange → strings (Vim standard String group)
    --   vscLightRed  → @string.escape
    --   vscLightGreen → @number, @number.float
    --   vscGreen     → comments
    --   vscGray      → line-level comments
    --   vscViolet    → misc (spell, md bold in light)
    -- ═══════════════════════════════════════════════════════════
    color_overrides = {
      -- Canvas
      vscBack = "#dfdfdf",             -- editor.background
      vscFront = "#2d2d2d",            -- editor.foreground

      -- Tabs
      vscTabCurrent = "#dfdfdf",
      vscTabOther = "#cdcdcd",
      vscTabOutside = "#d8d8d8",

      -- Side Panel
      vscLeftDark = "#c0c0c0",
      vscLeftMid = "#d8d8d8",
      vscLeftLight = "#dfdfdf",

      -- Popups / Completion
      vscPopupFront = "#000000",
      vscPopupBack = "#e4e4e4",
      vscPopupHighlightBlue = "#0b0080",
      vscPopupHighlightGray = "#808080",

      -- Splits
      vscSplitLight = "#c0c0c0",
      vscSplitDark = "#a8a8a8",
      vscSplitThumb = "#909090",

      -- Cursor / Selection
      vscCursorDarkDark = "#c9c8c8",
      vscCursorDark = "#808080",
      vscCursorLight = "#284b63",
      vscSelection = "#c5c9d6",
      vscLineNumber = "#808080",

      -- Diff
      vscDiffRedDark = "#f5cccc",
      vscDiffRedLight = "#f5a3a3",
      vscDiffRedLightLight = "#f5cccc",
      vscDiffGreenDark = "#ccddbb",
      vscDiffGreenLight = "#dde8cc",
      vscSearchCurrent = "#F8E71C",
      vscSearch = "#F8E71C",

      -- Git
      vscGitAdded = "#006600",
      vscGitModified = "#9e5f00",
      vscGitDeleted = "#a31515",
      vscGitRenamed = "#006600",
      vscGitUntracked = "#006600",
      vscGitIgnored = "#808080",
      vscGitStageModified = "#9e5f00",
      vscGitStageDeleted = "#a31515",
      vscGitConflicting = "#a31515",
      vscGitSubmodule = "#0b0080",

      -- Indent / Context
      vscContext = "#c5cdd4",
      vscContextCurrent = "#0b0080",

      vscFoldBackground = "#d8d8d8",
      vscSuggestion = "#5a6b7c",

      -- ═════════════════════════════════════════════
      -- SYNTAX COLORS — The Koala 6-Color Palette
      -- ═════════════════════════════════════════════

      -- NAVY #0b0080 — ALL keywords
      vscBlue = "#0b0080",             -- @keyword, @constructor, @boolean, Type, StorageClass, @tag
      vscPink = "#0b0080",             -- @keyword.import/conditional/repeat/return/exception, Statement, Keyword, Include

      -- BRONZE #ae6000 — types, interfaces, attributes
      vscBlueGreen = "#ae6000",        -- @type, Structure, @module, @constant.macro

      -- INK #000000 — variables, functions, punctuation
      vscLightBlue = "#000000",        -- @variable, @property, @field, @variable.parameter
      vscYellow = "#000000",           -- @function, @function.call, @function.method

      -- MAROON #800000 — strings, numbers, constants
      vscOrange = "#800000",           -- @string (light mode)
      vscYellowOrange = "#800000",     -- String (vim standard)
      vscLightRed = "#800000",         -- @string.escape
      vscLightGreen = "#800000",       -- @number, @number.float

      -- SLATE #6e7781 — comments
      vscGreen = "#6e7781",            -- comments (vscode.nvim uses vscGreen for comments in light)
      vscGray = "#6e7781",             -- also comments

      -- Other
      vscViolet = "#0b0080",           -- misc (navy)
      vscRed = "#a31515",              -- errors
      vscAccentBlue = "#0078d4",       -- UI accent
      vscDarkBlue = "#284b63",         -- cursor/status
      vscMediumBlue = "#0078d4",       -- UI accent
      vscDisabledBlue = "#808080",     -- disabled
      vscDarkYellow = "#F8E71C",       -- search
      vscDimHighlight = "#c9c8c8",     -- line highlight

      vscUiBlue = "#284b63",
      vscUiOrange = "#ae6000",
      vscPopupHighlightLightBlue = "#c5c9d6",
    },

    -- Fine-tune groups where vscode.nvim's mapping doesn't
    -- match our Koala philosophy exactly
    group_overrides = {
      -- Variables/functions → INK (not LightBlue default)
      ["@variable"] = { fg = "#000000" },
      ["@variable.builtin"] = { fg = "#000000" },
      ["@variable.parameter"] = { fg = "#000000" },
      ["@variable.member"] = { fg = "#000000" },
      ["@property"] = { fg = "#000000" },
      ["@function"] = { fg = "#000000" },
      ["@function.call"] = { fg = "#000000" },
      ["@function.method"] = { fg = "#000000" },
      ["@function.method.call"] = { fg = "#000000" },
      ["@function.builtin"] = { fg = "#000000" },
      ["@punctuation.delimiter"] = { fg = "#000000" },
      ["@punctuation.bracket"] = { fg = "#000000" },
      ["@punctuation.special"] = { fg = "#000000" },
      ["@tag.delimiter"] = { fg = "#000000" },

      -- Types → BRONZE (vscBlueGreen is now bronze, but override @type.builtin too)
      ["@type"] = { fg = "#ae6000" },
      ["@type.builtin"] = { fg = "#ae6000" },
      ["@type.definition"] = { fg = "#006600" },  -- class definitions → FOREST
      ["@tag.attribute"] = { fg = "#ae6000" },
      Type = { fg = "#ae6000" },

      -- Classes/Constructors → FOREST
      ["@constructor"] = { fg = "#006600" },
      Structure = { fg = "#006600" },

      -- Boolean → MAROON (not Blue)
      ["@boolean"] = { fg = "#800000" },
      Boolean = { fg = "#800000" },
      ["@constant.builtin"] = { fg = "#800000" },

      -- Module → INK
      ["@module"] = { fg = "#000000" },
      ["@module.builtin"] = { fg = "#000000" },
    },
  })

  vim.cmd.colorscheme("vscode")
end

return M
