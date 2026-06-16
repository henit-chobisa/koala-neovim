-- Koala Color Palettes
--
-- Two variants share ONE structure. Same keys, same roles — only the
-- hex values change. That shared structure is what keeps the light and
-- dark themes feeling like the same theme.
--
--   koala            → light  ("paper")        original VS Code port
--   koala-bengaluru  → dark   ("soft evening") eye-friendly companion
--
-- The 6 syntax roles are identical across both:
--   INK     variables, functions, punctuation
--   NAVY    keywords, storage, tags
--   MAROON  strings, numbers, constants
--   FOREST  class names
--   BRONZE  types, interfaces, attributes
--   SLATE   comments (italic)

local M = {}

-- ── LIGHT — "Koala" (paper) ──────────────────────────────────────────
M.light = {
  bg            = "#dfdfdf",
  fg            = "#2d2d2d",
  line_hl       = "#c9c8c8",
  selection     = "#c5c9d6",
  border        = "#c0c0c0",
  panel_border  = "#a8a8a8",
  panel_bg      = "#d8d8d8",
  float_bg      = "#e4e4e4",
  float_border  = "#0b0080",
  float_sel_bg  = "#0b0080",
  float_sel_fg  = "#ffffff",
  line_nr       = "#808080",
  line_nr_cur   = "#284b63",
  cursor        = "#284b63",
  status_bg     = "#284b63",
  status_fg     = "#ffffff",
  accent        = "#0078d4",
  list_hl       = "#b70000",
  indent        = "#c5cdd4",
  indent_active = "#0b0080",
  codelens      = "#5a6b7c",

  -- Search / find-match
  find_match    = "#F8E71C",
  search_fg     = "#000000",
  search_bg     = "#F8E71C",

  -- Menus / popups / borders (suggest widget, fzf, telescope)
  menu_bg       = "#ececec",
  menu_border   = "#b0b0b0",
  menu_sel_bg   = "#d0d4dd",
  sel_bg        = "#0b0080",
  sel_fg        = "#ffffff",
  sel_dim_fg    = "#c0c0ff",
  scroll_track  = "#d8d8d8",
  scroll_thumb  = "#909090",

  -- Inline error chip
  error_fg      = "#ffffff",
  error_bg      = "#b81511",

  -- The 6 Koala syntax colors
  ink           = "#000000",
  navy          = "#0b0080",
  maroon        = "#800000",
  forest        = "#006600",
  bronze        = "#ae6000",
  slate         = "#6e7781",

  -- ANSI
  ansi_red      = "#a31515",
  ansi_green    = "#006600",
  ansi_yellow   = "#9e5f00",
  ansi_blue     = "#0b0080",
  ansi_cyan     = "#005555",
  ansi_magenta  = "#560090",

  -- Diff foreground
  diff_red      = "#a31515",
  diff_green    = "#006600",
  diff_blue     = "#0b0080",

  -- Diff line backgrounds (light tints) + readable fg for diff syntax
  diff_add_bg    = "#bce8bc",
  diff_change_bg = "#e2ead0",
  diff_delete_bg = "#f2c2c2",
  diff_text_bg   = "#f3cd7a",
  diff_add_fg    = "#008000",
  diff_change_fg = "#0b0080",
  diff_delete_fg = "#e00000",
}

-- ── DARK — "Koala Bengaluru" (soft evening) ──────────────────────────
-- Neutral near-black base (#141414) — no color cast on the editor. The
-- syntax colors are soft, medium-saturation hues curated for clear
-- separation without glare, so long sessions stay easy on the eyes
-- while the 6-role grammar reads identically to the light theme.
M.dark = {
  bg            = "#141414",
  fg            = "#e0e1e4",
  line_hl       = "#1c1c1c",
  selection     = "#2b3344",
  border        = "#292929",
  panel_border  = "#303030",
  panel_bg      = "#181818",
  float_bg      = "#1b1b1b",
  float_border  = "#313131",
  float_sel_bg  = "#2d3a52",
  float_sel_fg  = "#dde4f0",
  line_nr       = "#474747",
  line_nr_cur   = "#7dacff",
  cursor        = "#c6cad4",
  status_bg     = "#1c2029",
  status_fg     = "#c6cad4",
  accent        = "#7dacff",
  list_hl       = "#ef8aa0",
  indent        = "#232323",
  indent_active = "#39435a",
  codelens      = "#585e69",

  -- Search / find-match — muted amber, dark text for contrast
  find_match    = "#d0a833",
  search_fg     = "#141414",
  search_bg     = "#d0a833",

  -- Menus / popups / borders
  menu_bg       = "#1b1b1b",
  menu_border   = "#313131",
  menu_sel_bg   = "#282d38",
  sel_bg        = "#2d3a52",
  sel_fg        = "#dde4f0",
  sel_dim_fg    = "#9fb3d4",
  scroll_track  = "#1b1b1b",
  scroll_thumb  = "#3a3a3a",

  -- Inline error chip
  error_fg      = "#141414",
  error_bg      = "#e8797f",

  -- The 6 Koala syntax colors — soft, curated siblings of the light set
  ink           = "#e0e1e4",  -- variables, functions, punctuation
  navy          = "#7dacff",  -- keywords, storage, tags
  maroon        = "#e88f8f",  -- strings, numbers, constants
  forest        = "#9dd07e",  -- class names
  bronze        = "#e2b574",  -- types, interfaces, attributes
  slate         = "#6b7180",  -- comments (italic)

  -- ANSI
  ansi_red      = "#e8797f",
  ansi_green    = "#9dd07e",
  ansi_yellow   = "#e2b574",
  ansi_blue     = "#7dacff",
  ansi_cyan     = "#74c7c2",
  ansi_magenta  = "#c4a2e8",

  -- Diff foreground
  diff_red      = "#e8797f",
  diff_green    = "#9dd07e",
  diff_blue     = "#7dacff",

  -- Diff line backgrounds — subtle channel tints + readable fg for diff syntax
  diff_add_bg    = "#16261a",
  diff_change_bg = "#16212e",
  diff_delete_bg = "#271619",
  diff_text_bg   = "#1d2c3a",
  diff_add_fg    = "#9dd07e",
  diff_change_fg = "#7dacff",
  diff_delete_fg = "#e8797f",
}

-- Backward compat: `colors` is the original light table.
M.colors = M.light

return M
