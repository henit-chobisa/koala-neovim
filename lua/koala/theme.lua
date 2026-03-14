-- Koala Theme for Neovim — Standalone, no dependencies.
--
-- Token colors (from the JSON):
--   INK     #000000  →  variables, functions, punctuation
--   NAVY    #0b0080  →  keywords, storage, tags
--   MAROON  #800000  →  strings, numbers, booleans, constants
--   FOREST  #006600  →  class names
--   BRONZE  #ae6000  →  types, interfaces, attributes
--   SLATE   #6e7781  →  comments (italic)

local c = require("koala.palette").colors
local M = {}

function M.setup()
  if vim.g.colors_name then
    vim.cmd("hi clear")
  end
  if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
  end

  vim.g.colors_name = "koala"
  vim.o.termguicolors = true
  vim.o.background = "light"

  -- ┌─────────────────────────────────────────────────────────────┐
  -- │ DISABLE LSP SEMANTIC TOKENS                                 │
  -- │                                                             │
  -- │ This is the nuclear fix. LSP semantic tokens override       │
  -- │ treesitter in Neovim, causing keywords like import/export   │
  -- │ to lose their color. By disabling the LSP's semantic token  │
  -- │ provider, treesitter has guaranteed full control.            │
  -- └─────────────────────────────────────────────────────────────┘
  vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("KoalaDisableSemanticTokens", { clear = true }),
    callback = function(args)
      local client = vim.lsp.get_client_by_id(args.data.client_id)
      if client and client.server_capabilities then
        client.server_capabilities.semanticTokensProvider = nil
      end
    end,
  })

  local hl = vim.api.nvim_set_hl

  -- ── EDITOR UI ──────────────────────────────────────────────────

  hl(0, "Normal",        { fg = c.fg, bg = c.bg })
  hl(0, "NormalFloat",   { fg = c.ink, bg = "#ececec" })          -- softer float bg
  hl(0, "FloatBorder",   { fg = "#b0b0b0", bg = "#ececec" })     -- subtle gray border
  hl(0, "FloatTitle",    { fg = c.fg, bg = "#ececec" })
  hl(0, "ColorColumn",   { bg = c.line_hl })
  hl(0, "Cursor",        { fg = c.bg, bg = c.cursor })
  hl(0, "CursorLine",    { bg = c.line_hl })
  hl(0, "CursorColumn",  { bg = c.line_hl })
  hl(0, "Directory",     { fg = c.navy })
  hl(0, "EndOfBuffer",   { fg = c.bg })
  hl(0, "ErrorMsg",      { fg = c.ansi_red })
  hl(0, "VertSplit",     { fg = c.border })
  hl(0, "WinSeparator",  { fg = c.border })
  hl(0, "Folded",        { fg = c.slate, bg = c.panel_bg })
  hl(0, "FoldColumn",    { fg = c.border, bg = c.bg })
  hl(0, "SignColumn",    { bg = c.bg })
  hl(0, "IncSearch",     { fg = c.status_fg, bg = c.accent })
  hl(0, "LineNr",        { fg = c.line_nr })
  hl(0, "CursorLineNr",  { fg = c.line_nr_cur })
  hl(0, "MatchParen",    { fg = c.navy, bg = c.line_hl })
  hl(0, "ModeMsg",       { fg = c.fg })
  hl(0, "MoreMsg",       { fg = c.fg })
  hl(0, "NonText",       { fg = c.slate })

  -- Popups / Autocomplete — match VS Code suggest widget
  hl(0, "Pmenu",         { fg = c.ink, bg = "#ececec" })          -- editorSuggestWidget.background
  hl(0, "PmenuSel",      { fg = "#ffffff", bg = "#0b0080" })     -- selected → navy bg, white text
  hl(0, "PmenuSbar",     { bg = "#d8d8d8" })                     -- scrollbar track
  hl(0, "PmenuThumb",    { bg = "#909090" })                     -- scrollbar thumb
  hl(0, "PmenuKind",     { fg = c.slate, bg = "#ececec" })       -- kind label (Variable, Function)
  hl(0, "PmenuKindSel",  { fg = "#c0c0ff", bg = "#0b0080" })    -- kind when selected
  hl(0, "PmenuExtra",    { fg = c.slate, bg = "#ececec" })
  hl(0, "PmenuExtraSel", { fg = "#c0c0ff", bg = "#0b0080" })

  hl(0, "Question",      { fg = c.navy })
  hl(0, "QuickFixLine",  { fg = c.ink, bg = c.selection })
  hl(0, "Search",        { fg = c.ink, bg = c.find_match })
  hl(0, "SpecialKey",    { fg = c.slate })
  hl(0, "SpellBad",      { sp = c.ansi_red, undercurl = true })
  hl(0, "SpellCap",      { sp = c.ansi_yellow, undercurl = true })
  hl(0, "SpellLocal",    { sp = c.ansi_blue, undercurl = true })
  hl(0, "SpellRare",     { sp = c.ansi_magenta, undercurl = true })
  hl(0, "StatusLine",    { fg = c.status_fg, bg = c.status_bg })
  hl(0, "StatusLineNC",  { fg = c.fg, bg = c.panel_bg })
  hl(0, "TabLine",       { fg = c.fg, bg = c.panel_bg })
  hl(0, "TabLineFill",   { fg = c.fg, bg = c.panel_bg })
  hl(0, "TabLineSel",    { fg = c.status_fg, bg = c.status_bg })
  hl(0, "Title",         { fg = c.fg })
  hl(0, "Visual",        { bg = c.selection })
  hl(0, "VisualNOS",     { bg = c.selection })
  hl(0, "WarningMsg",    { fg = c.ansi_yellow })
  hl(0, "WildMenu",      { fg = "#ffffff", bg = "#0b0080" })
  hl(0, "DiffAdd",       { fg = c.diff_green, bg = c.line_hl })
  hl(0, "DiffChange",    { fg = c.diff_blue, bg = c.line_hl })
  hl(0, "DiffDelete",    { fg = c.diff_red, bg = c.line_hl })
  hl(0, "DiffText",      { fg = c.ink, bg = c.line_hl })

  -- ── VIM STANDARD SYNTAX ───────────────────────────────────────

  hl(0, "Identifier",    { fg = c.ink })
  hl(0, "Function",      { fg = c.ink })
  hl(0, "Delimiter",     { fg = c.ink })
  hl(0, "Special",       { fg = c.ink })
  hl(0, "Debug",         { fg = c.ink })
  hl(0, "Statement",     { fg = c.navy })
  hl(0, "Conditional",   { fg = c.navy })
  hl(0, "Repeat",        { fg = c.navy })
  hl(0, "Label",         { fg = c.navy })
  hl(0, "Operator",      { fg = c.navy })
  hl(0, "Keyword",       { fg = c.navy })
  hl(0, "Exception",     { fg = c.navy })
  hl(0, "PreProc",       { fg = c.navy })
  hl(0, "Include",       { fg = c.navy })
  hl(0, "Define",        { fg = c.navy })
  hl(0, "Macro",         { fg = c.navy })
  hl(0, "PreCondit",     { fg = c.navy })
  hl(0, "StorageClass",  { fg = c.navy })
  hl(0, "Tag",           { fg = c.navy })
  hl(0, "Constant",      { fg = c.maroon })
  hl(0, "String",        { fg = c.maroon })
  hl(0, "Character",     { fg = c.maroon })
  hl(0, "Number",        { fg = c.maroon })
  hl(0, "Boolean",       { fg = c.maroon })
  hl(0, "Float",         { fg = c.maroon })
  hl(0, "SpecialChar",   { fg = c.maroon })
  hl(0, "Structure",     { fg = c.forest })
  hl(0, "Type",          { fg = c.bronze })
  hl(0, "Typedef",       { fg = c.bronze })
  hl(0, "Comment",       { fg = c.slate, italic = true })
  hl(0, "SpecialComment",{ fg = c.slate, italic = true })
  hl(0, "Underlined",    { underline = true })
  hl(0, "Ignore",        { fg = c.slate })
  hl(0, "Error",         { fg = "#ffffff", bg = "#b81511" })
  hl(0, "Todo",          { fg = c.ansi_magenta })

  -- ── VIM SYNTAX FALLBACK (TypeScript / JavaScript) ──────────────
  -- These map vim's built-in regex syntax groups (used when
  -- treesitter is NOT active) to the correct Koala colors.
  -- Without treesitter, `import` → typescriptImport → Special → black.
  -- With these mappings, `import` → typescriptImport → navy.

  -- NAVY — keywords, control flow, storage
  hl(0, "typescriptImport",          { fg = c.navy })  -- import
  hl(0, "typescriptExport",          { fg = c.navy })  -- export
  hl(0, "typescriptVariable",        { fg = c.navy })  -- const, let, var
  hl(0, "typescriptOperator",        { fg = c.navy })  -- typeof, instanceof, new, delete
  hl(0, "typescriptStatement",       { fg = c.navy })  -- return, break, continue
  hl(0, "typescriptConditional",     { fg = c.navy })  -- if, else, switch
  hl(0, "typescriptRepeat",          { fg = c.navy })  -- for, while, do
  hl(0, "typescriptExceptions",      { fg = c.navy })  -- try, catch, finally, throw
  hl(0, "typescriptStorageClass",    { fg = c.navy })  -- static, abstract
  hl(0, "typescriptAccessibilityModifier", { fg = c.navy })  -- public, private, protected
  hl(0, "typescriptReadonlyModifier",{ fg = c.navy })  -- readonly
  hl(0, "typescriptAsyncFuncKeyword",{ fg = c.navy })  -- async
  hl(0, "typescriptAwaitKeyword",    { fg = c.navy })  -- await
  hl(0, "typescriptCastKeyword",     { fg = c.navy })  -- as
  hl(0, "typescriptKeywordOp",       { fg = c.navy })  -- keyof
  hl(0, "typescriptClassKeyword",    { fg = c.navy })  -- class
  hl(0, "typescriptClassName",       { fg = c.forest })-- class NAME → forest
  hl(0, "typescriptClassExtends",    { fg = c.navy })  -- extends
  hl(0, "typescriptClassHeritage",   { fg = c.navy })  -- implements
  hl(0, "typescriptFuncKeyword",     { fg = c.navy })  -- function
  hl(0, "typescriptForOperator",     { fg = c.navy })  -- of, in
  hl(0, "typescriptDefault",         { fg = c.navy })  -- default
  hl(0, "typescriptCase",            { fg = c.navy })  -- case
  hl(0, "typescriptModule",          { fg = c.navy })  -- namespace, module
  hl(0, "typescriptAbstract",        { fg = c.navy })  -- abstract
  hl(0, "typescriptEnum",            { fg = c.navy })  -- enum
  hl(0, "typescriptTypeReference",   { fg = c.bronze })-- type names → bronze
  hl(0, "typescriptPredefinedType",  { fg = c.bronze })-- string, number, boolean (as types)
  hl(0, "typescriptTypeAnnotation",  { fg = c.ink })   -- : (colon in type annotations)
  hl(0, "typescriptInterfaceKeyword",{ fg = c.navy })  -- interface
  hl(0, "typescriptInterfaceName",   { fg = c.bronze })-- interface NAME → bronze
  hl(0, "typescriptTypeAliasDeclaration", { fg = c.bronze })-- type alias name → bronze
  hl(0, "typescriptAliasKeyword",    { fg = c.navy })  -- type (as keyword)
  hl(0, "typescriptDecorator",       { fg = c.bronze })-- @decorator

  -- MAROON — strings, numbers, booleans
  hl(0, "typescriptString",          { fg = c.maroon })
  hl(0, "typescriptTemplateSB",      { fg = c.maroon })-- ${} in template strings
  hl(0, "typescriptNumber",          { fg = c.maroon })
  hl(0, "typescriptBoolean",         { fg = c.maroon })
  hl(0, "typescriptNull",            { fg = c.maroon })-- null, undefined
  hl(0, "typescriptRegexpString",    { fg = c.maroon })

  -- INK — identifiers, properties, calls
  hl(0, "typescriptIdentifier",      { fg = c.ink })   -- this
  hl(0, "typescriptProp",            { fg = c.ink })
  hl(0, "typescriptCall",            { fg = c.ink })
  hl(0, "typescriptMember",          { fg = c.ink })
  hl(0, "typescriptMethodAccessor",  { fg = c.navy })  -- get/set
  hl(0, "typescriptArrowFunc",       { fg = c.navy })  -- =>
  hl(0, "typescriptBraces",          { fg = c.ink })
  hl(0, "typescriptParens",          { fg = c.ink })
  hl(0, "typescriptEndColons",       { fg = c.ink })   -- ; , :
  hl(0, "typescriptDotNotation",     { fg = c.ink })   -- .
  hl(0, "typescriptObjectLabel",     { fg = c.ink })   -- object keys
  hl(0, "typescriptGlobalObjects",   { fg = c.ink })   -- Promise, Array, etc
  hl(0, "typescriptFuncCallArg",     { fg = c.ink })

  -- JavaScript equivalents (same colors)
  hl(0, "javaScriptImport",         { fg = c.navy })
  hl(0, "javaScriptExport",         { fg = c.navy })
  hl(0, "javaScriptIdentifier",     { fg = c.navy })   -- var, let, const
  hl(0, "javaScriptOperator",       { fg = c.navy })
  hl(0, "javaScriptConditional",    { fg = c.navy })
  hl(0, "javaScriptRepeat",         { fg = c.navy })
  hl(0, "javaScriptStatement",      { fg = c.navy })
  hl(0, "javaScriptException",      { fg = c.navy })
  hl(0, "javaScriptFunction",       { fg = c.navy })
  hl(0, "javaScriptString",         { fg = c.maroon })
  hl(0, "javaScriptNumber",         { fg = c.maroon })
  hl(0, "javaScriptBoolean",        { fg = c.maroon })
  hl(0, "javaScriptNull",           { fg = c.maroon })
  hl(0, "javaScriptMember",         { fg = c.ink })
  hl(0, "javaScriptBraces",         { fg = c.ink })

  -- ── TREESITTER ─────────────────────────────────────────────────

  -- INK — variables, functions, punctuation
  hl(0, "@variable",                    { fg = c.ink })
  hl(0, "@variable.builtin",           { fg = c.ink })
  hl(0, "@variable.parameter",         { fg = c.ink })
  hl(0, "@variable.member",            { fg = c.ink })
  hl(0, "@function",                   { fg = c.ink })
  hl(0, "@function.call",              { fg = c.ink })
  hl(0, "@function.builtin",           { fg = c.ink })
  hl(0, "@function.method",            { fg = c.ink })
  hl(0, "@function.method.call",       { fg = c.ink })
  hl(0, "@method",                     { fg = c.ink })
  hl(0, "@method.call",                { fg = c.ink })
  hl(0, "@field",                      { fg = c.ink })
  hl(0, "@property",                   { fg = c.ink })
  hl(0, "@parameter",                  { fg = c.ink })
  hl(0, "@punctuation.delimiter",      { fg = c.ink })
  hl(0, "@punctuation.bracket",        { fg = c.ink })
  hl(0, "@punctuation.special",        { fg = c.ink })
  hl(0, "@text",                       { fg = c.ink })
  hl(0, "@namespace",                  { fg = c.ink })
  hl(0, "@module",                     { fg = c.ink })
  hl(0, "@module.builtin",             { fg = c.ink })

  -- NAVY — every keyword variant from ecma + typescript queries
  hl(0, "@keyword",                     { fg = c.navy })
  hl(0, "@keyword.function",            { fg = c.navy })
  hl(0, "@keyword.operator",            { fg = c.navy })
  hl(0, "@keyword.import",              { fg = c.navy })
  hl(0, "@keyword.export",              { fg = c.navy })
  hl(0, "@keyword.return",              { fg = c.navy })
  hl(0, "@keyword.coroutine",           { fg = c.navy })
  hl(0, "@keyword.conditional",         { fg = c.navy })
  hl(0, "@keyword.conditional.ternary", { fg = c.navy })
  hl(0, "@keyword.repeat",              { fg = c.navy })
  hl(0, "@keyword.exception",           { fg = c.navy })
  hl(0, "@keyword.type",                { fg = c.navy })
  hl(0, "@keyword.modifier",            { fg = c.navy })
  hl(0, "@keyword.directive",           { fg = c.navy })
  hl(0, "@conditional",                { fg = c.navy })
  hl(0, "@repeat",                      { fg = c.navy })
  hl(0, "@label",                       { fg = c.navy })
  hl(0, "@operator",                    { fg = c.navy })
  hl(0, "@exception",                   { fg = c.navy })
  hl(0, "@include",                     { fg = c.navy })
  hl(0, "@storageclass",                { fg = c.navy })
  hl(0, "@tag",                         { fg = c.navy })
  hl(0, "@tag.delimiter",               { fg = c.ink })

  -- MAROON — strings, numbers, constants
  hl(0, "@string",                 { fg = c.maroon })
  hl(0, "@string.regex",           { fg = c.maroon })
  hl(0, "@string.regexp",          { fg = c.maroon })
  hl(0, "@string.escape",          { fg = c.maroon })
  hl(0, "@string.special",         { fg = c.maroon })
  hl(0, "@string.special.url",     { fg = c.maroon })
  hl(0, "@character",              { fg = c.maroon })
  hl(0, "@character.special",      { fg = c.maroon })
  hl(0, "@number",                 { fg = c.maroon })
  hl(0, "@number.float",           { fg = c.maroon })
  hl(0, "@boolean",                { fg = c.maroon })
  hl(0, "@float",                  { fg = c.maroon })
  hl(0, "@constant",               { fg = c.maroon })
  hl(0, "@constant.builtin",       { fg = c.maroon })
  hl(0, "@constant.macro",         { fg = c.maroon })

  -- FOREST — class names
  hl(0, "@constructor",            { fg = c.forest })
  hl(0, "@type.definition",        { fg = c.forest })

  -- BRONZE — types, interfaces, attributes
  hl(0, "@type",                   { fg = c.bronze })
  hl(0, "@type.builtin",           { fg = c.bronze })
  hl(0, "@type.qualifier",         { fg = c.navy })
  hl(0, "@tag.attribute",          { fg = c.bronze })
  hl(0, "@attribute",              { fg = c.bronze })

  -- SLATE — comments
  hl(0, "@comment",                { fg = c.slate, italic = true })
  hl(0, "@comment.documentation",  { fg = c.slate, italic = true })

  -- Markup
  hl(0, "@text.strong",            { fg = c.ink })
  hl(0, "@text.emphasis",          { fg = c.ink, italic = true })
  hl(0, "@text.underline",         { underline = true })
  hl(0, "@text.title",             { fg = c.navy })
  hl(0, "@text.literal",           { fg = c.maroon })
  hl(0, "@text.uri",               { fg = c.maroon, underline = true })
  hl(0, "@text.reference",         { fg = c.navy })
  hl(0, "@text.diff.add",          { fg = c.diff_green })
  hl(0, "@text.diff.delete",       { fg = c.diff_red })
  hl(0, "@markup.heading",         { fg = c.navy })
  hl(0, "@markup.bold",            { fg = c.ink })
  hl(0, "@markup.italic",          { italic = true })
  hl(0, "@markup.list",            { fg = c.bronze })
  hl(0, "@markup.link",            { fg = c.maroon })
  hl(0, "@markup.link.url",        { fg = c.maroon, underline = true })
  hl(0, "@markup.raw",             { fg = c.maroon })

  -- ── DIAGNOSTICS ────────────────────────────────────────────────

  hl(0, "DiagnosticError",          { fg = c.ansi_red })
  hl(0, "DiagnosticWarn",           { fg = c.ansi_yellow })
  hl(0, "DiagnosticInfo",           { fg = c.ansi_blue })
  hl(0, "DiagnosticHint",           { fg = c.slate })
  hl(0, "DiagnosticUnderlineError", { sp = c.ansi_red, undercurl = true })
  hl(0, "DiagnosticUnderlineWarn",  { sp = c.ansi_yellow, undercurl = true })
  hl(0, "DiagnosticUnderlineInfo",  { sp = c.ansi_blue, undercurl = true })
  hl(0, "DiagnosticUnderlineHint",  { sp = c.slate, undercurl = true })

  -- ── PLUGINS ────────────────────────────────────────────────────

  -- GitSigns
  hl(0, "GitSignsAdd",    { fg = c.diff_green, bg = c.bg })
  hl(0, "GitSignsChange", { fg = c.diff_blue, bg = c.bg })
  hl(0, "GitSignsDelete", { fg = c.diff_red, bg = c.bg })

  -- fzf-lua — clean, VS Code-like file picker
  hl(0, "FzfLuaNormal",        { fg = c.ink, bg = "#ececec" })
  hl(0, "FzfLuaBorder",        { fg = "#b0b0b0", bg = "#ececec" })
  hl(0, "FzfLuaTitle",         { fg = c.fg, bg = "#ececec" })
  hl(0, "FzfLuaPreviewNormal", { fg = c.fg, bg = c.bg })
  hl(0, "FzfLuaPreviewBorder", { fg = "#b0b0b0", bg = c.bg })
  hl(0, "FzfLuaPreviewTitle",  { fg = c.fg, bg = c.bg })
  hl(0, "FzfLuaCursorLine",    { bg = "#d0d4dd" })               -- softer selection highlight
  hl(0, "FzfLuaCursorLineNr",  { fg = c.ink, bg = "#d0d4dd" })
  hl(0, "FzfLuaSearch",        { fg = c.list_hl })               -- match highlight → red
  hl(0, "FzfLuaHeaderBind",    { fg = c.accent })
  hl(0, "FzfLuaHeaderText",    { fg = c.fg })
  hl(0, "FzfLuaFzfNormal",     { fg = c.ink })
  hl(0, "FzfLuaFzfMatch",      { fg = c.list_hl })               -- fuzzy match color
  hl(0, "FzfLuaFzfBorder",     { fg = "#b0b0b0" })
  hl(0, "FzfLuaFzfPointer",    { fg = c.accent })
  hl(0, "FzfLuaFzfCursorLine", { bg = "#d0d4dd" })

  -- nvim-cmp — autocomplete popup
  hl(0, "CmpItemAbbr",              { fg = c.ink })            -- normal text
  hl(0, "CmpItemAbbrMatch",         { fg = c.list_hl })        -- matched characters → red
  hl(0, "CmpItemAbbrMatchFuzzy",    { fg = c.list_hl })        -- fuzzy matched
  hl(0, "CmpItemAbbrDeprecated",    { fg = c.slate, strikethrough = true })
  hl(0, "CmpItemKind",              { fg = c.slate })          -- kind label text
  hl(0, "CmpItemKindVariable",      { fg = c.ink })
  hl(0, "CmpItemKindFunction",      { fg = c.ink })
  hl(0, "CmpItemKindMethod",        { fg = c.ink })
  hl(0, "CmpItemKindField",         { fg = c.ink })
  hl(0, "CmpItemKindProperty",      { fg = c.ink })
  hl(0, "CmpItemKindKeyword",       { fg = c.navy })
  hl(0, "CmpItemKindClass",         { fg = c.forest })
  hl(0, "CmpItemKindInterface",     { fg = c.bronze })
  hl(0, "CmpItemKindStruct",        { fg = c.bronze })
  hl(0, "CmpItemKindEnum",          { fg = c.bronze })
  hl(0, "CmpItemKindEnumMember",    { fg = c.maroon })
  hl(0, "CmpItemKindConstant",      { fg = c.maroon })
  hl(0, "CmpItemKindModule",        { fg = c.ink })
  hl(0, "CmpItemKindSnippet",       { fg = c.slate })
  hl(0, "CmpItemKindText",          { fg = c.fg })
  hl(0, "CmpItemKindValue",         { fg = c.maroon })
  hl(0, "CmpItemKindTypeParameter", { fg = c.bronze })
  hl(0, "CmpItemMenu",              { fg = c.slate })          -- source label

  -- Telescope (kept for compatibility)
  hl(0, "TelescopeBorder",        { fg = "#b0b0b0", bg = "#ececec" })
  hl(0, "TelescopeNormal",        { fg = c.ink, bg = "#ececec" })
  hl(0, "TelescopeSelection",     { fg = c.ink, bg = "#d0d4dd" })
  hl(0, "TelescopeMatching",      { fg = c.list_hl })
  hl(0, "TelescopePromptBorder",  { fg = "#b0b0b0", bg = "#ececec" })
  hl(0, "TelescopePromptNormal",  { fg = c.ink, bg = "#ececec" })
  hl(0, "TelescopePromptPrefix",  { fg = c.accent })
  hl(0, "TelescopePreviewBorder", { fg = "#b0b0b0", bg = c.bg })
  hl(0, "TelescopePreviewNormal", { fg = c.fg, bg = c.bg })

  -- Indent guides
  hl(0, "IblIndent",  { fg = c.indent })
  hl(0, "IblScope",   { fg = c.indent_active })

  -- Floaterm (lazygit, terminals)
  hl(0, "Floaterm",       { bg = c.bg })
  hl(0, "FloatermBorder", { fg = "#b0b0b0", bg = c.bg })

  -- Netrw (file browser)
  hl(0, "netrwDir",       { fg = c.navy })
  hl(0, "netrwExe",       { fg = c.forest })
  hl(0, "netrwSymLink",   { fg = c.bronze })

  -- ── TERMINAL ───────────────────────────────────────────────────

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
