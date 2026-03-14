local palette = require("koala.palette").colors

local M = {}

function M.setup()
    if vim.g.colors_name then
        vim.cmd("hi clear")
    end
    vim.g.colors_name = "koala"
    vim.o.termguicolors = true
    vim.o.background = "light"

    local highlights = {
        -- Base
        Normal = { fg = palette.fg, bg = palette.bg },
        NormalFloat = { fg = palette.inky_black, bg = palette.float_bg },
        FloatBorder = { fg = palette.float_border, bg = palette.float_bg },
        ColorColumn = { bg = palette.bg_highlight },
        Cursor = { fg = palette.bg, bg = palette.cursor },
        CursorLine = { bg = palette.bg_highlight },
        CursorColumn = { bg = palette.bg_highlight },
        Directory = { fg = palette.navy },
        DiffAdd = { fg = palette.green, bg = palette.bg_highlight },
        DiffChange = { fg = palette.navy, bg = palette.bg_highlight },
        DiffDelete = { fg = palette.red, bg = palette.bg_highlight },
        DiffText = { fg = palette.inky_black, bg = palette.bg_highlight },
        EndOfBuffer = { fg = palette.bg },
        ErrorMsg = { fg = palette.red },
        VertSplit = { fg = palette.border },
        WinSeparator = { fg = palette.border },
        Folded = { fg = palette.slate, bg = palette.sidebar_bg },
        FoldColumn = { fg = palette.border, bg = palette.bg },
        SignColumn = { bg = palette.bg },
        IncSearch = { fg = palette.bg, bg = palette.navy },
        LineNr = { fg = palette.line_nr },
        CursorLineNr = { fg = palette.line_nr_active, bold = true },
        MatchParen = { fg = palette.navy, bg = palette.bg_highlight, bold = true },
        ModeMsg = { fg = palette.navy, bold = true },
        MoreMsg = { fg = palette.navy },
        NonText = { fg = palette.slate },
        Pmenu = { fg = palette.inky_black, bg = palette.float_bg },
        PmenuSel = { fg = palette.statusline_fg, bg = palette.float_border },
        PmenuSbar = { bg = palette.float_bg },
        PmenuThumb = { bg = palette.float_border },
        Question = { fg = palette.navy },
        QuickFixLine = { fg = palette.inky_black, bg = palette.selection },
        Search = { fg = palette.inky_black, bg = palette.find_match },
        SpecialKey = { fg = palette.slate },
        SpellBad = { sp = palette.red, undercurl = true },
        SpellCap = { sp = palette.yellow, undercurl = true },
        SpellLocal = { sp = palette.blue, undercurl = true },
        SpellRare = { sp = palette.magenta, undercurl = true },
        StatusLine = { fg = palette.statusline_fg, bg = palette.statusline_bg },
        StatusLineNC = { fg = palette.fg, bg = palette.panel_bg },
        TabLine = { fg = palette.fg, bg = palette.panel_bg },
        TabLineFill = { fg = palette.fg, bg = palette.panel_bg },
        TabLineSel = { fg = palette.statusline_fg, bg = palette.statusline_bg },
        Title = { fg = palette.navy, bold = true },
        Visual = { bg = palette.selection },
        VisualNOS = { bg = palette.selection },
        WarningMsg = { fg = palette.yellow },
        WildMenu = { fg = palette.statusline_fg, bg = palette.navy },

        -- Syntax (Standard)
        Comment = { fg = palette.slate, italic = true },
        Constant = { fg = palette.maroon },
        String = { fg = palette.maroon },
        Character = { fg = palette.maroon },
        Number = { fg = palette.maroon },
        Boolean = { fg = palette.navy, bold = true },
        Float = { fg = palette.maroon },

        Identifier = { fg = palette.inky_black },
        Function = { fg = palette.inky_black },

        Statement = { fg = palette.navy, bold = true },
        Conditional = { fg = palette.navy, bold = true },
        Repeat = { fg = palette.navy, bold = true },
        Label = { fg = palette.navy, bold = true },
        Operator = { fg = palette.navy, bold = true },
        Keyword = { fg = palette.navy, bold = true },
        Exception = { fg = palette.navy, bold = true },

        PreProc = { fg = palette.navy },
        Include = { fg = palette.navy, bold = true },
        Define = { fg = palette.navy, bold = true },
        Macro = { fg = palette.navy, bold = true },
        PreCondit = { fg = palette.navy, bold = true },

        Type = { fg = palette.bronze, bold = true },
        StorageClass = { fg = palette.navy, bold = true },
        Structure = { fg = palette.forest_green, bold = true },
        Typedef = { fg = palette.bronze, bold = true },

        Special = { fg = palette.inky_black },
        SpecialChar = { fg = palette.maroon },
        Tag = { fg = palette.navy, bold = true },
        Delimiter = { fg = palette.inky_black },
        SpecialComment = { fg = palette.slate, italic = true },
        Debug = { fg = palette.inky_black },

        Underlined = { underline = true },
        Ignore = { fg = palette.slate },
        Error = { fg = palette.red, bg = palette.bg_highlight },
        Todo = { fg = palette.magenta, bold = true },

        -- Treesitter
        ["@comment"] = { link = "Comment" },
        ["@constant"] = { link = "Constant" },
        ["@constant.builtin"] = { fg = palette.navy, bold = true },
        ["@constant.macro"] = { link = "Constant" },
        ["@string"] = { link = "String" },
        ["@string.regex"] = { fg = palette.maroon },
        ["@string.escape"] = { fg = palette.maroon },
        ["@character"] = { link = "Character" },
        ["@number"] = { link = "Number" },
        ["@boolean"] = { link = "Boolean" },
        ["@float"] = { link = "Float" },

        ["@function"] = { link = "Function" },
        ["@function.call"] = { link = "Function" },
        ["@function.builtin"] = { fg = palette.navy, bold = true },
        ["@function.macro"] = { link = "Function" },
        ["@parameter"] = { fg = palette.inky_black },
        ["@method"] = { link = "Function" },
        ["@method.call"] = { link = "Function" },
        ["@field"] = { fg = palette.inky_black },
        ["@property"] = { fg = palette.inky_black },
        ["@constructor"] = { fg = palette.forest_green, bold = true },

        ["@conditional"] = { link = "Conditional" },
        ["@repeat"] = { link = "Repeat" },
        ["@label"] = { link = "Label" },
        ["@operator"] = { link = "Operator" },
        ["@keyword"] = { link = "Keyword" },
        ["@exception"] = { link = "Exception" },

        ["@type"] = { link = "Type" },
        ["@type.builtin"] = { fg = palette.bronze, bold = true },
        ["@type.qualifier"] = { fg = palette.navy, bold = true },
        ["@type.definition"] = { link = "Type" },
        ["@structure"] = { link = "Structure" },
        
        ["@class"] = { fg = palette.forest_green, bold = true },

        ["@variable"] = { fg = palette.inky_black },
        ["@variable.builtin"] = { fg = palette.navy, bold = true },

        ["@text"] = { fg = palette.inky_black },
        ["@text.strong"] = { fg = palette.inky_black, bold = true },
        ["@text.emphasis"] = { fg = palette.inky_black, italic = true },
        ["@text.underline"] = { underline = true },
        ["@text.title"] = { fg = palette.navy, bold = true },
        ["@text.literal"] = { fg = palette.maroon },
        ["@text.uri"] = { fg = palette.maroon, underline = true },
        ["@text.reference"] = { fg = palette.navy },

        ["@tag"] = { fg = palette.navy, bold = true },
        ["@tag.attribute"] = { fg = palette.bronze },
        ["@tag.delimiter"] = { fg = palette.inky_black },

        -- LSP Diagnostics
        DiagnosticError = { fg = palette.red },
        DiagnosticWarn = { fg = palette.yellow },
        DiagnosticInfo = { fg = palette.blue },
        DiagnosticHint = { fg = palette.slate },
        DiagnosticUnderlineError = { sp = palette.red, undercurl = true },
        DiagnosticUnderlineWarn = { sp = palette.yellow, undercurl = true },
        DiagnosticUnderlineInfo = { sp = palette.blue, undercurl = true },
        DiagnosticUnderlineHint = { sp = palette.slate, undercurl = true },
        
        -- GitSigns
        GitSignsAdd = { fg = palette.green, bg = palette.bg },
        GitSignsChange = { fg = palette.navy, bg = palette.bg },
        GitSignsDelete = { fg = palette.red, bg = palette.bg },
    }

    for group, settings in pairs(highlights) do
        vim.api.nvim_set_hl(0, group, settings)
    end
end

return M
