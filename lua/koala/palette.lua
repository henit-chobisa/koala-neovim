-- Koala Color Palette
-- Exact colors from Koala-color-theme.json for VS Code
local M = {}

M.colors = {
  -- ── Editor Canvas ──────────────────────────────────────────────
  bg            = "#dfdfdf",  -- editor.background
  fg            = "#2d2d2d",  -- editor.foreground
  line_hl       = "#c9c8c8",  -- editor.lineHighlightBackground
  selection     = "#c5c9d6",  -- editor.selectionBackground (approximated, no alpha in nvim)
  find_match    = "#F8E71C",  -- editor.findMatchHighlightBackground (no alpha)
  word_hl       = "#d5dae0",  -- editor.wordHighlightBackground (approximated)

  -- ── Line Numbers / Cursor ──────────────────────────────────────
  line_nr       = "#808080",  -- editorLineNumber.foreground
  line_nr_cur   = "#284b63",  -- editorLineNumber.activeForeground
  cursor        = "#284b63",  -- editorCursor.foreground

  -- ── Borders ────────────────────────────────────────────────────
  border        = "#c0c0c0",  -- titleBar.border / sideBar.border
  panel_border  = "#a8a8a8",  -- panel.border / input.border

  -- ── Title Bar ──────────────────────────────────────────────────
  title_bg      = "#000000",  -- titleBar.activeBackground
  title_fg      = "#ffffff",  -- titleBar.activeForeground

  -- ── Status Bar ─────────────────────────────────────────────────
  status_bg     = "#284b63",  -- statusBar.background
  status_fg     = "#ffffff",  -- statusBar.foreground
  status_dbg_bg = "#800000",  -- statusBar.debuggingBackground

  -- ── Activity Bar ───────────────────────────────────────────────
  accent        = "#0078d4",  -- activityBar.background / focusBorder / button

  -- ── Side Bar / Panel / Terminal ────────────────────────────────
  panel_bg      = "#d8d8d8",  -- sideBar / panel / terminal background
  panel_fg      = "#2d2d2d",  -- sideBar / panel foreground
  section_bg    = "#cdcdcd",  -- sideBarSectionHeader.background

  -- ── Suggest / Completion ───────────────────────────────────────
  float_bg      = "#e4e4e4",  -- editorSuggestWidget.background
  float_border  = "#0b0080",  -- editorSuggestWidget.border
  float_sel_bg  = "#0b0080",  -- editorSuggestWidget.selectedBackground
  float_sel_fg  = "#ffffff",  -- editorSuggestWidget.selectedForeground

  -- ── List ───────────────────────────────────────────────────────
  list_sel_bg   = "#0b0080",  -- list.activeSelectionBackground
  list_sel_fg   = "#ffffff",  -- list.activeSelectionForeground
  list_hover    = "#f0f4f8",  -- list.hoverBackground
  list_hl       = "#b70000",  -- list.highlightForeground

  -- ── Input ──────────────────────────────────────────────────────
  input_bg      = "#d0d0d0",  -- input.background

  -- ── Breadcrumb ─────────────────────────────────────────────────
  breadcrumb_bg = "#c7c7c7",
  breadcrumb_fg = "#5d5d5d",

  -- ── Indent Guide ───────────────────────────────────────────────
  indent        = "#c5cdd4",  -- editorIndentGuide.background (approximated, no alpha)
  indent_active = "#0b0080",  -- editorIndentGuide.activeBackground

  -- ── Misc UI ────────────────────────────────────────────────────
  codelens      = "#5a6b7c",  -- editorCodeLens / gitlens trailing
  scrollbar     = "#909090",  -- scrollbarSlider.background (no alpha)

  -- ══════════════════════════════════════════════════════════════
  -- TOKEN COLORS — The 6 Koala Syntax Colors
  -- ══════════════════════════════════════════════════════════════

  ink           = "#000000",  -- CORE INK: variables, functions, plain text
  navy          = "#0b0080",  -- STRUCTURE: keywords, storage, tags
  maroon        = "#800000",  -- DATA: strings, numbers, constants
  forest        = "#006600",  -- CLASSES: class names
  bronze        = "#ae6000",  -- TYPES: interfaces, types, attributes
  slate         = "#6e7781",  -- ASIDE: comments

  -- ── ANSI Terminal ──────────────────────────────────────────────
  ansi_red      = "#a31515",
  ansi_green    = "#006600",
  ansi_yellow   = "#9e5f00",
  ansi_blue     = "#0b0080",
  ansi_cyan     = "#005555",
  ansi_magenta  = "#560090",

  -- ── Diff / Markup ──────────────────────────────────────────────
  diff_red      = "#a31515",  -- markup.deleted
  diff_green    = "#006600",  -- markup.inserted
  diff_blue     = "#0b0080",  -- markup.changed

  -- ── Invalid ────────────────────────────────────────────────────
  invalid_bg    = "#b81511",  -- invalid.illegal background
  invalid_fg    = "#FFFFFF",
}

return M
