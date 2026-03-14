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

    -- Map Koala palette → vscode.nvim color variables
    --
    -- From Koala-color-theme.json:
    --   INK     #000000  →  variables, functions, punctuation
    --   NAVY    #0b0080  →  keywords, storage, tags
    --   MAROON  #800000  →  strings, numbers, constants
    --   FOREST  #006600  →  class names
    --   BRONZE  #ae6000  →  types, interfaces, attributes
    --   SLATE   #6e7781  →  comments
    color_overrides = {
      -- Canvas
      vscBack = "#dfdfdf",             -- editor.background
      vscFront = "#2d2d2d",            -- editor.foreground

      -- Tabs
      vscTabCurrent = "#dfdfdf",       -- match editor bg
      vscTabOther = "#cdcdcd",         -- sideBarSectionHeader
      vscTabOutside = "#d8d8d8",       -- sideBar.background

      -- Side Panel
      vscLeftDark = "#c0c0c0",         -- sideBar.border
      vscLeftMid = "#d8d8d8",          -- sideBar.background
      vscLeftLight = "#dfdfdf",        -- editor bg

      -- Popups / Completion
      vscPopupFront = "#000000",       -- editorSuggestWidget.foreground
      vscPopupBack = "#e4e4e4",        -- editorSuggestWidget.background
      vscPopupHighlightBlue = "#0b0080", -- editorSuggestWidget.selectedBackground
      vscPopupHighlightGray = "#808080",

      -- Splits
      vscSplitLight = "#c0c0c0",       -- sideBar.border
      vscSplitDark = "#a8a8a8",        -- panel.border
      vscSplitThumb = "#909090",       -- scrollbar

      -- Cursor / Selection
      vscCursorDarkDark = "#c9c8c8",   -- editor.lineHighlightBackground
      vscCursorDark = "#808080",       -- editorLineNumber.foreground
      vscCursorLight = "#284b63",      -- editorCursor.foreground
      vscSelection = "#c5c9d6",        -- editor.selectionBackground (approx)
      vscLineNumber = "#808080",       -- editorLineNumber.foreground

      -- Diff
      vscDiffRedDark = "#f5cccc",
      vscDiffRedLight = "#f5a3a3",
      vscDiffRedLightLight = "#f5cccc",
      vscDiffGreenDark = "#ccddbb",
      vscDiffGreenLight = "#dde8cc",
      vscSearchCurrent = "#F8E71C",    -- editor.findMatchHighlightBackground
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
      vscContext = "#c5cdd4",          -- editorIndentGuide.background (approx)
      vscContextCurrent = "#0b0080",   -- editorIndentGuide.activeBackground

      vscFoldBackground = "#d8d8d8",

      vscSuggestion = "#5a6b7c",       -- gitlens / codelens color

      -- ═══════════════════════════════════════════════
      -- SYNTAX COLORS — The Koala 6-Color Palette
      -- ═══════════════════════════════════════════════

      -- In vscode.nvim light mode, the syntax mapping is:
      --   vscGray     → comments / line numbers
      --   vscViolet   → keywords (navy-ish)
      --   vscBlue     → keywords / control flow
      --   vscLightBlue→ variables / identifiers
      --   vscGreen    → comments
      --   vscBlueGreen→ class names / constructors
      --   vscYellow   → function names
      --   vscYellowOrange → strings
      --   vscOrange   → errors
      --   vscLightRed → strings / escape chars
      --   vscRed      → errors  
      --   vscPink     → keywords (control flow like import/export)
      --   vscLightGreen → numbers

      vscGray = "#6e7781",             -- SLATE (comments)
      vscViolet = "#0b0080",           -- NAVY (keywords: if, for, return, class)
      vscBlue = "#0b0080",             -- NAVY (keywords: function, var, const, let)
      vscAccentBlue = "#0078d4",       -- UI accent (activity bar blue)
      vscDarkBlue = "#284b63",         -- Cursor / status bar
      vscMediumBlue = "#0078d4",       -- UI accent
      vscDisabledBlue = "#808080",     -- Disabled
      vscLightBlue = "#000000",        -- INK (variables, identifiers)
      vscGreen = "#6e7781",            -- SLATE (comments — vscode.nvim uses this for comments in light mode)
      vscBlueGreen = "#006600",        -- FOREST (class names)
      vscLightGreen = "#800000",       -- MAROON (numbers — vscode.nvim maps numbers to LightGreen in light)
      vscRed = "#a31515",              -- Red (errors)
      vscOrange = "#a31515",           -- Red (error text)
      vscLightRed = "#800000",         -- MAROON (strings)
      vscYellowOrange = "#800000",     -- MAROON (strings — this is the main string color in light mode)
      vscYellow = "#000000",           -- INK (function calls)
      vscDarkYellow = "#F8E71C",       -- Search highlight
      vscPink = "#0b0080",             -- NAVY (control flow: import, export, from, await)

      -- Low contrast highlight
      vscDimHighlight = "#c9c8c8",     -- line highlight

      -- UI extras
      vscUiBlue = "#284b63",
      vscUiOrange = "#ae6000",         -- BRONZE
      vscPopupHighlightLightBlue = "#c5c9d6",
    },

    -- Additional group overrides for Koala-specific styling
    group_overrides = {
      -- Types/Interfaces → BRONZE
      ["@type"] = { fg = "#ae6000" },
      ["@type.builtin"] = { fg = "#ae6000" },
      ["@type.definition"] = { fg = "#006600" },     -- class defs → FOREST
      ["@tag.attribute"] = { fg = "#ae6000" },        -- HTML/JSX attrs → BRONZE
      ["@attribute"] = { fg = "#ae6000" },
      Type = { fg = "#ae6000" },
      Typedef = { fg = "#ae6000" },
      Structure = { fg = "#006600" },

      -- Ensure constructors are FOREST
      ["@constructor"] = { fg = "#006600" },

      -- Ensure all plain code is INK
      ["@variable"] = { fg = "#000000" },
      ["@variable.builtin"] = { fg = "#000000" },
      ["@variable.parameter"] = { fg = "#000000" },
      ["@variable.member"] = { fg = "#000000" },
      ["@property"] = { fg = "#000000" },
      ["@field"] = { fg = "#000000" },
      ["@punctuation.delimiter"] = { fg = "#000000" },
      ["@punctuation.bracket"] = { fg = "#000000" },
      ["@punctuation.special"] = { fg = "#000000" },

      -- Boolean/constant.language → MAROON (not keyword)
      ["@boolean"] = { fg = "#800000" },
      ["@constant.builtin"] = { fg = "#800000" },
    },
  })

  vim.cmd.colorscheme("vscode")
end

return M
