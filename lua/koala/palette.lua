local M = {}

M.colors = {
    -- Core Canvas
    bg = "#dfdfdf",
    fg = "#2d2d2d",
    bg_highlight = "#c9c8c8",
    find_match = "#F8E71C", -- Removed alpha channel for Neovim compatibility
    
    -- UI Containers
    border = "#c0c0c0",
    selection = "#bac4d4",
    selection_strong = "#0b0080",
    selection_fg = "#ffffff",
    
    -- Koala Syntax Palette
    inky_black = "#000000",   -- CORE INK
    navy = "#0b0080",         -- STRUCTURE
    maroon = "#800000",       -- DATA
    forest_green = "#006600", -- CLASSES
    bronze = "#ae6000",       -- TYPES / (User's choice for Imports)
    slate = "#6e7781",        -- ASIDE
    
    -- ANSI Colors (Terminals)
    red = "#a31515",
    green = "#006600",
    yellow = "#9e5f00",
    blue = "#0b0080",
    magenta = "#560090",
    cyan = "#005555",
    
    -- Refined UI Specifics
    line_nr = "#808080",
    line_nr_active = "#284b63",
    cursor = "#284b63",

    sidebar_bg = "#d8d8d8",
    sidebar_fg = "#2d2d2d",
    sidebar_header = "#cdcdcd",
    
    panel_bg = "#d8d8d8",
    panel_border = "#a8a8a8",
    
    float_bg = "#e4e4e4",
    float_border = "#0b0080",
    
    statusline_bg = "#284b63",
    statusline_fg = "#ffffff",
    
    activity_bar = "#0078d4",
    activity_fg = "#ffffff",
    
    breadcrumb = "#c7c7c7",
    breadcrumb_fg = "#5d5d5d",

    input_bg = "#d0d0d0",
    button_bg = "#0078d4",
}

return M
