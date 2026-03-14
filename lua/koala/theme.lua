-- Koala Theme for Neovim
-- Faithful port of Koala-color-theme.json (VS Code)
--
-- Token color philosophy (from the JSON):
--   INK     #000000  →  variables, functions, punctuation, plain text
--   NAVY    #0b0080  →  keywords, storage, tags (bold)
--   MAROON  #800000  →  strings, numbers, constant.language
--   FOREST  #006600  →  class names (bold)
--   BRONZE  #ae6000  →  types, interfaces, HTML/JSX attributes (bold)
--   SLATE   #6e7781  →  comments (italic)

local c = require("koala.palette").colors

local M = {}

function M.setup()
  if vim.g.colors_name then
    vim.cmd("hi clear")
  end
  vim.g.colors_name = "koala"
  vim.o.termguicolors = true
  vim.o.background = "light"

  local hl = vim.api.nvim_set_hl

  -- ╔══════════════════════════════════════════════════════════════╗
  -- ║  EDITOR UI                                                  ║
  -- ╚══════════════════════════════════════════════════════════════╝

  hl(0, "Normal",        { fg = c.fg, bg = c.bg })
  hl(0, "NormalFloat",   { fg = c.ink, bg = c.float_bg })
  hl(0, "FloatBorder",   { fg = c.float_border, bg = c.float_bg })
  hl(0, "ColorColumn",   { bg = c.line_hl })
  hl(0, "Cursor",        { fg = c.bg, bg = c.cursor })
  hl(0, "CursorLine",    { bg = c.line_hl })
  hl(0, "CursorColumn",  { bg = c.line_hl })
  hl(0, "Directory",     { fg = c.navy, bold = true })
  hl(0, "EndOfBuffer",   { fg = c.bg })
  hl(0, "ErrorMsg",      { fg = c.ansi_red })
  hl(0, "VertSplit",     { fg = c.border })
  hl(0, "WinSeparator",  { fg = c.border })
  hl(0, "Folded",        { fg = c.slate, bg = c.panel_bg })
  hl(0, "FoldColumn",    { fg = c.border, bg = c.bg })
  hl(0, "SignColumn",    { bg = c.bg })
  hl(0, "IncSearch",     { fg = c.status_fg, bg = c.accent })
  hl(0, "LineNr",        { fg = c.line_nr })
  hl(0, "CursorLineNr",  { fg = c.line_nr_cur, bold = true })
  hl(0, "MatchParen",    { fg = c.navy, bg = c.line_hl, bold = true })
  hl(0, "ModeMsg",       { fg = c.navy, bold = true })
  hl(0, "MoreMsg",       { fg = c.navy })
  hl(0, "NonText",       { fg = c.slate })
  hl(0, "Pmenu",         { fg = c.ink, bg = c.float_bg })
  hl(0, "PmenuSel",      { fg = c.float_sel_fg, bg = c.float_sel_bg })
  hl(0, "PmenuSbar",     { bg = c.float_bg })
  hl(0, "PmenuThumb",    { bg = c.float_border })
  hl(0, "Question",      { fg = c.navy })
  hl(0, "QuickFixLine",  { fg = c.ink, bg = c.selection })
  hl(0, "Search",        { fg = c.ink, bg = c.find_match })
  hl(0, "SpecialKey",    { fg = c.slate })
  hl(0, "SpellBad",      { sp = c.ansi_red, undercurl = true })
  hl(0, "SpellCap",      { sp = c.ansi_yellow, undercurl = true })
  hl(0, "SpellLocal",    { sp = c.ansi_blue, undercurl = true })
  hl(0, "SpellRare",     { sp = c.ansi_magenta, undercurl = true })
  hl(0, "StatusLine",    { fg = c.status_fg, bg = c.status_bg })
  hl(0, "StatusLineNC",  { fg = c.panel_fg, bg = c.panel_bg })
  hl(0, "TabLine",       { fg = c.panel_fg, bg = c.panel_bg })
  hl(0, "TabLineFill",   { fg = c.panel_fg, bg = c.panel_bg })
  hl(0, "TabLineSel",    { fg = c.status_fg, bg = c.status_bg })
  hl(0, "Title",         { fg = c.navy, bold = true })
  hl(0, "Visual",        { bg = c.selection })
  hl(0, "VisualNOS",     { bg = c.selection })
  hl(0, "WarningMsg",    { fg = c.ansi_yellow })
  hl(0, "WildMenu",      { fg = c.float_sel_fg, bg = c.float_sel_bg })

  -- Diff
  hl(0, "DiffAdd",       { fg = c.diff_green, bg = c.line_hl })
  hl(0, "DiffChange",    { fg = c.diff_blue, bg = c.line_hl })
  hl(0, "DiffDelete",    { fg = c.diff_red, bg = c.line_hl })
  hl(0, "DiffText",      { fg = c.ink, bg = c.line_hl, bold = true })

  -- ╔══════════════════════════════════════════════════════════════╗
  -- ║  VIM STANDARD SYNTAX — mapped from JSON tokenColors         ║
  -- ╚══════════════════════════════════════════════════════════════╝

  -- CORE INK (#000000) — variable, entity.name.function, support.function, punctuation
  hl(0, "Identifier",    { fg = c.ink })
  hl(0, "Function",      { fg = c.ink })
  hl(0, "Delimiter",     { fg = c.ink })
  hl(0, "Special",       { fg = c.ink })
  hl(0, "Debug",         { fg = c.ink })

  -- STRUCTURE (#0b0080 bold) — keyword, storage, entity.name.tag
  hl(0, "Statement",     { fg = c.navy, bold = true })
  hl(0, "Conditional",   { fg = c.navy, bold = true })
  hl(0, "Repeat",        { fg = c.navy, bold = true })
  hl(0, "Label",         { fg = c.navy, bold = true })
  hl(0, "Operator",      { fg = c.navy, bold = true })
  hl(0, "Keyword",       { fg = c.navy, bold = true })
  hl(0, "Exception",     { fg = c.navy, bold = true })
  hl(0, "PreProc",       { fg = c.navy, bold = true })
  hl(0, "Include",       { fg = c.navy, bold = true })
  hl(0, "Define",        { fg = c.navy, bold = true })
  hl(0, "Macro",         { fg = c.navy, bold = true })
  hl(0, "PreCondit",     { fg = c.navy, bold = true })
  hl(0, "StorageClass",  { fg = c.navy, bold = true })
  hl(0, "Tag",           { fg = c.navy, bold = true })

  -- DATA (#800000) — string, constant.numeric, constant.language, constant.character
  hl(0, "Constant",      { fg = c.maroon })
  hl(0, "String",        { fg = c.maroon })
  hl(0, "Character",     { fg = c.maroon })
  hl(0, "Number",        { fg = c.maroon })
  hl(0, "Boolean",       { fg = c.maroon })          -- constant.language → DATA
  hl(0, "Float",         { fg = c.maroon })
  hl(0, "SpecialChar",   { fg = c.maroon })

  -- CLASSES (#006600 bold) — entity.name.class, support.class
  hl(0, "Structure",     { fg = c.forest, bold = true })

  -- TYPES (#ae6000 bold) — entity.name.type, support.type, entity.other.attribute-name
  hl(0, "Type",          { fg = c.bronze, bold = true })
  hl(0, "Typedef",       { fg = c.bronze, bold = true })

  -- ASIDE (#6e7781 italic) — comment
  hl(0, "Comment",       { fg = c.slate, italic = true })
  hl(0, "SpecialComment",{ fg = c.slate, italic = true })

  -- Other
  hl(0, "Underlined",    { underline = true })
  hl(0, "Ignore",        { fg = c.slate })
  hl(0, "Error",         { fg = c.invalid_fg, bg = c.invalid_bg })
  hl(0, "Todo",          { fg = c.ansi_magenta, bold = true })

  -- ╔══════════════════════════════════════════════════════════════╗
  -- ║  TREESITTER — exact mapping from VS Code TextMate scopes    ║
  -- ╚══════════════════════════════════════════════════════════════╝

  -- ── CORE INK (#000000) ─────────────────────────────────────────
  -- JSON scopes: variable, variable.other, variable.language,
  --   variable.function, entity.name.function, meta.function-call,
  --   support.function, meta.object-literal.key,
  --   punctuation.separator, punctuation.terminator,
  --   punctuation.section, source, text
  hl(0, "@variable",                { fg = c.ink })
  hl(0, "@variable.builtin",       { fg = c.ink })           -- variable.language → INK
  hl(0, "@variable.parameter",     { fg = c.ink })
  hl(0, "@variable.member",        { fg = c.ink })
  hl(0, "@function",               { fg = c.ink })           -- entity.name.function → INK
  hl(0, "@function.call",          { fg = c.ink })           -- meta.function-call → INK
  hl(0, "@function.builtin",       { fg = c.ink })           -- support.function → INK
  hl(0, "@function.method",        { fg = c.ink })
  hl(0, "@function.method.call",   { fg = c.ink })
  hl(0, "@method",                 { fg = c.ink })
  hl(0, "@method.call",            { fg = c.ink })
  hl(0, "@field",                  { fg = c.ink })
  hl(0, "@property",               { fg = c.ink })           -- meta.object-literal.key → INK
  hl(0, "@parameter",              { fg = c.ink })
  hl(0, "@punctuation.delimiter",  { fg = c.ink })           -- punctuation.separator → INK
  hl(0, "@punctuation.bracket",    { fg = c.ink })           -- punctuation.section → INK
  hl(0, "@punctuation.special",    { fg = c.ink })
  hl(0, "@text",                   { fg = c.ink })
  hl(0, "@namespace",              { fg = c.ink })

  -- ── STRUCTURE (#0b0080 bold) ───────────────────────────────────
  -- JSON scopes: keyword, keyword.control, keyword.operator,
  --   storage, storage.type, storage.modifier,
  --   entity.name.tag, meta.tag.sgml, meta.selector
  hl(0, "@keyword",                { fg = c.navy, bold = true })
  hl(0, "@keyword.function",       { fg = c.navy, bold = true })  -- storage.type (function/class)
  hl(0, "@keyword.operator",       { fg = c.navy, bold = true })  -- keyword.operator
  hl(0, "@keyword.import",         { fg = c.navy, bold = true })  -- keyword.control.import
  hl(0, "@keyword.export",         { fg = c.navy, bold = true })  -- keyword.control.export
  hl(0, "@keyword.return",         { fg = c.navy, bold = true })
  hl(0, "@keyword.directive",      { fg = c.navy, bold = true })
  hl(0, "@keyword.conditional",    { fg = c.navy, bold = true })
  hl(0, "@keyword.repeat",        { fg = c.navy, bold = true })
  hl(0, "@keyword.exception",      { fg = c.navy, bold = true })
  hl(0, "@keyword.type",           { fg = c.navy, bold = true })  -- storage.type
  hl(0, "@keyword.modifier",       { fg = c.navy, bold = true })  -- storage.modifier
  hl(0, "@conditional",            { fg = c.navy, bold = true })
  hl(0, "@repeat",                 { fg = c.navy, bold = true })
  hl(0, "@label",                  { fg = c.navy, bold = true })
  hl(0, "@operator",               { fg = c.navy, bold = true })
  hl(0, "@exception",              { fg = c.navy, bold = true })
  hl(0, "@include",                { fg = c.navy, bold = true })  -- keyword.control (import)
  hl(0, "@storageclass",           { fg = c.navy, bold = true })
  hl(0, "@tag",                    { fg = c.navy, bold = true })  -- entity.name.tag
  hl(0, "@tag.delimiter",          { fg = c.ink })                -- punctuation in tags → INK

  -- ── DATA (#800000) ────────────────────────────────────────────
  -- JSON scopes: string, constant.numeric, constant.language,
  --   constant.character, constant.other, string.quoted
  hl(0, "@string",                 { fg = c.maroon })
  hl(0, "@string.regex",           { fg = c.maroon })
  hl(0, "@string.escape",          { fg = c.maroon })
  hl(0, "@string.special",         { fg = c.maroon })
  hl(0, "@character",              { fg = c.maroon })
  hl(0, "@number",                 { fg = c.maroon })
  hl(0, "@number.float",           { fg = c.maroon })
  hl(0, "@boolean",                { fg = c.maroon })         -- constant.language → DATA
  hl(0, "@float",                  { fg = c.maroon })
  hl(0, "@constant",               { fg = c.maroon })
  hl(0, "@constant.builtin",       { fg = c.maroon })         -- constant.language → DATA
  hl(0, "@constant.macro",         { fg = c.maroon })

  -- ── CLASSES (#006600 bold) ─────────────────────────────────────
  -- JSON scopes: entity.name.class, entity.other.inherited-class,
  --   support.class
  hl(0, "@constructor",            { fg = c.forest, bold = true })
  hl(0, "@type.definition",        { fg = c.forest, bold = true }) -- class definitions
  hl(0, "@lsp.type.class",         { fg = c.forest, bold = true })

  -- ── TYPES (#ae6000 bold) ───────────────────────────────────────
  -- JSON scopes: entity.name.type, support.type,
  --   entity.other.attribute-name
  hl(0, "@type",                   { fg = c.bronze, bold = true })
  hl(0, "@type.builtin",           { fg = c.bronze, bold = true })
  hl(0, "@type.qualifier",         { fg = c.navy, bold = true })  -- storage.modifier → STRUCTURE
  hl(0, "@tag.attribute",          { fg = c.bronze, bold = true }) -- entity.other.attribute-name → TYPES
  hl(0, "@attribute",              { fg = c.bronze, bold = true })
  hl(0, "@lsp.type.type",          { fg = c.bronze, bold = true })
  hl(0, "@lsp.type.interface",     { fg = c.bronze, bold = true })
  hl(0, "@lsp.type.typeParameter", { fg = c.bronze, bold = true })
  hl(0, "@lsp.type.enum",          { fg = c.bronze, bold = true })
  hl(0, "@lsp.type.struct",        { fg = c.bronze, bold = true })

  -- ── ASIDE (#6e7781 italic) ─────────────────────────────────────
  -- JSON scopes: comment, punctuation.definition.comment
  hl(0, "@comment",                { fg = c.slate, italic = true })

  -- ── MARKUP ─────────────────────────────────────────────────────
  hl(0, "@text.strong",            { fg = c.ink, bold = true })
  hl(0, "@text.emphasis",          { fg = c.ink, italic = true })
  hl(0, "@text.underline",         { underline = true })
  hl(0, "@text.title",             { fg = c.navy, bold = true })   -- markup.heading
  hl(0, "@text.literal",           { fg = c.maroon })
  hl(0, "@text.uri",               { fg = c.maroon, underline = true }) -- markup.underline.link
  hl(0, "@text.reference",         { fg = c.navy })
  hl(0, "@text.diff.add",          { fg = c.diff_green })
  hl(0, "@text.diff.delete",       { fg = c.diff_red })
  hl(0, "@markup.heading",         { fg = c.navy, bold = true })
  hl(0, "@markup.bold",            { fg = c.ink, bold = true })
  hl(0, "@markup.italic",          { italic = true })
  hl(0, "@markup.list",            { fg = c.bronze })              -- markup.list → bronze
  hl(0, "@markup.link",            { fg = c.maroon })
  hl(0, "@markup.link.url",        { fg = c.maroon, underline = true })
  hl(0, "@markup.raw",             { fg = c.maroon })

  -- ╔══════════════════════════════════════════════════════════════╗
  -- ║  LSP SEMANTIC TOKENS                                        ║
  -- ╚══════════════════════════════════════════════════════════════╝

  hl(0, "@lsp.type.variable",      { fg = c.ink })
  hl(0, "@lsp.type.property",      { fg = c.ink })
  hl(0, "@lsp.type.function",      { fg = c.ink })
  hl(0, "@lsp.type.method",        { fg = c.ink })
  hl(0, "@lsp.type.parameter",     { fg = c.ink })
  hl(0, "@lsp.type.keyword",       { fg = c.navy, bold = true })
  hl(0, "@lsp.type.namespace",     { fg = c.ink })
  hl(0, "@lsp.type.string",        { fg = c.maroon })
  hl(0, "@lsp.type.number",        { fg = c.maroon })
  hl(0, "@lsp.type.enumMember",    { fg = c.maroon })  -- constant → DATA
  hl(0, "@lsp.type.decorator",     { fg = c.bronze, bold = true })
  hl(0, "@lsp.mod.declaration",    {})  -- don't override; let the type-based hl win

  -- ╔══════════════════════════════════════════════════════════════╗
  -- ║  DIAGNOSTICS                                                ║
  -- ╚══════════════════════════════════════════════════════════════╝

  hl(0, "DiagnosticError",          { fg = c.ansi_red })
  hl(0, "DiagnosticWarn",           { fg = c.ansi_yellow })
  hl(0, "DiagnosticInfo",           { fg = c.ansi_blue })
  hl(0, "DiagnosticHint",           { fg = c.slate })
  hl(0, "DiagnosticUnderlineError", { sp = c.ansi_red, undercurl = true })
  hl(0, "DiagnosticUnderlineWarn",  { sp = c.ansi_yellow, undercurl = true })
  hl(0, "DiagnosticUnderlineInfo",  { sp = c.ansi_blue, undercurl = true })
  hl(0, "DiagnosticUnderlineHint",  { sp = c.slate, undercurl = true })

  -- ╔══════════════════════════════════════════════════════════════╗
  -- ║  PLUGIN: GitSigns                                           ║
  -- ╚══════════════════════════════════════════════════════════════╝

  hl(0, "GitSignsAdd",    { fg = c.diff_green, bg = c.bg })
  hl(0, "GitSignsChange", { fg = c.diff_blue, bg = c.bg })
  hl(0, "GitSignsDelete", { fg = c.diff_red, bg = c.bg })

  -- ╔══════════════════════════════════════════════════════════════╗
  -- ║  PLUGIN: Telescope                                          ║
  -- ╚══════════════════════════════════════════════════════════════╝

  hl(0, "TelescopeBorder",        { fg = c.float_border, bg = c.float_bg })
  hl(0, "TelescopeNormal",        { fg = c.ink, bg = c.float_bg })
  hl(0, "TelescopeSelection",     { fg = c.float_sel_fg, bg = c.float_sel_bg })
  hl(0, "TelescopeMatching",      { fg = c.list_hl, bold = true })
  hl(0, "TelescopePromptBorder",  { fg = c.float_border, bg = c.float_bg })
  hl(0, "TelescopePromptNormal",  { fg = c.ink, bg = c.float_bg })
  hl(0, "TelescopePromptPrefix",  { fg = c.accent })
  hl(0, "TelescopeResultsBorder", { fg = c.float_border, bg = c.float_bg })
  hl(0, "TelescopePreviewBorder", { fg = c.float_border, bg = c.float_bg })

  -- ╔══════════════════════════════════════════════════════════════╗
  -- ║  INDENT GUIDES                                              ║
  -- ╚══════════════════════════════════════════════════════════════╝

  hl(0, "IblIndent",       { fg = c.indent })
  hl(0, "IblScope",        { fg = c.indent_active })
  hl(0, "IndentBlanklineChar",           { fg = c.indent })
  hl(0, "IndentBlanklineContextChar",    { fg = c.indent_active })

  -- ╔══════════════════════════════════════════════════════════════╗
  -- ║  TERMINAL COLORS                                            ║
  -- ╚══════════════════════════════════════════════════════════════╝

  vim.g.terminal_color_0  = c.ink
  vim.g.terminal_color_1  = c.ansi_red
  vim.g.terminal_color_2  = c.ansi_green
  vim.g.terminal_color_3  = c.ansi_yellow
  vim.g.terminal_color_4  = c.ansi_blue
  vim.g.terminal_color_5  = c.ansi_magenta
  vim.g.terminal_color_6  = c.ansi_cyan
  vim.g.terminal_color_7  = c.fg
  vim.g.terminal_color_8  = c.slate
  vim.g.terminal_color_9  = c.ansi_red
  vim.g.terminal_color_10 = c.ansi_green
  vim.g.terminal_color_11 = c.ansi_yellow
  vim.g.terminal_color_12 = c.ansi_blue
  vim.g.terminal_color_13 = c.ansi_magenta
  vim.g.terminal_color_14 = c.ansi_cyan
  vim.g.terminal_color_15 = c.status_fg
end

return M
