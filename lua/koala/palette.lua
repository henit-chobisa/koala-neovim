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

  -- Diff background tints
  diff_add_bg    = "#c9c8c8",
  diff_change_bg = "#c9c8c8",
  diff_delete_bg = "#c9c8c8",
  diff_text_bg   = "#c9c8c8",
}

-- ── DARK — "Koala Bengaluru" (soft evening) ──────────────────────────
-- Warm-neutral charcoal base. Every syntax color is a desaturated
-- pastel sibling of the light role — never neon — so long sessions
-- stay easy on the eyes while the 6-role grammar reads identically.
M.dark = {
  bg            = "#1e2024",
  fg            = "#cccfd4",
  line_hl       = "#26282d",
  selection     = "#33394a",
  border        = "#33363d",
  panel_border  = "#3a3d44",
  panel_bg      = "#24262b",
  float_bg      = "#26282d",
  float_border  = "#3a3d44",
  float_sel_bg  = "#33415c",
  float_sel_fg  = "#e8edf4",
  line_nr       = "#565c66",
  line_nr_cur   = "#9fb3d4",
  cursor        = "#9fb3d4",
  status_bg     = "#28313f",
  status_fg     = "#cdd2d8",
  accent        = "#8fb6e3",
  list_hl       = "#d98a8a",
  indent        = "#2c2f35",
  indent_active = "#4a5570",
  codelens      = "#5f6772",

  -- Search / find-match — muted amber, dark text for contrast
  find_match    = "#c9a227",
  search_fg     = "#1e2024",
  search_bg     = "#c9a227",

  -- Menus / popups / borders
  menu_bg       = "#26282d",
  menu_border   = "#3a3d44",
  menu_sel_bg   = "#2f3744",
  sel_bg        = "#33415c",
  sel_fg        = "#e8edf4",
  sel_dim_fg    = "#9fb3d4",
  scroll_track  = "#2c2e34",
  scroll_thumb  = "#4a4d55",

  -- Inline error chip
  error_fg      = "#1e2024",
  error_bg      = "#d98a8a",

  -- The 6 Koala syntax colors — soft pastel siblings of the light set
  ink           = "#cccfd4",  -- variables, functions, punctuation
  navy          = "#8fb6e3",  -- keywords, storage, tags
  maroon        = "#d49a8c",  -- strings, numbers, constants
  forest        = "#9cc59b",  -- class names
  bronze        = "#d6b780",  -- types, interfaces, attributes
  slate         = "#6f7680",  -- comments (italic)

  -- ANSI
  ansi_red      = "#d98a8a",
  ansi_green    = "#9cc59b",
  ansi_yellow   = "#d6b780",
  ansi_blue     = "#8fb6e3",
  ansi_cyan     = "#8fc5c2",
  ansi_magenta  = "#c4a3d6",

  -- Diff foreground
  diff_red      = "#d98a8a",
  diff_green    = "#9cc59b",
  diff_blue     = "#8fb6e3",

  -- Diff background tints — subtle, channel-tinted
  diff_add_bg    = "#23302a",
  diff_change_bg = "#243040",
  diff_delete_bg = "#332629",
  diff_text_bg   = "#2b3a4c",
}

-- Backward compat: `colors` is the original light table.
M.colors = M.light

return M
