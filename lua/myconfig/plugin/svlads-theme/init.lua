
local M = {};

local colors = {
    bg = "#090c10",
    khaki_1 = "#BDB76B",
    khaki_2 = "#F3EA9F",
    khaki_4 = "#F0E68C",
    red_1 = "#D06666",
    red_2 = "#FF7979",
    red_3 = "#532E2E",
    red_4 = "#FF4D4D",
    rose_1 = "#FFA0A0",
    palm_1 = "#7FCF78",
    sky_1 = "#87CEEB",
    teal_1 = "#68C0B6",
    teal_2 = "#2B4A46",
    copper_1 = "#D89A72",
    lavender_1 = "#C28EFF",
    iris_1 = "#8D8DE7",
    sunset_1 = "#FFA34D",
    sand_1 = "#F9D9AB",
    sand_2 = "#FFE0CC",
    slate_1 = "#A3ABB8",
    slate_2 = "#69809D",
    slate_3 = "#d4d8de",
    sundown_1 = "#F7997D",
    sundown_2 = "#E28E6F",
    visual_gray = "#666666",
    olive_1 = "#A1C254",
    stone_1 = "#4D4A42",
    stone_2 = "#1E2A38",
    stone_3 = "#D9E6FA",
    black_2 = "#0E1219",
    yellow_1 = "#F0E68C",
    yellow_2 = "#4D4528",
    yellow_3 = "#EAE161",
    blue_1 = "#81C0FF",
    blue_2 = "#335668",
    cyan_1 = "#8FD1C7",
    green_1 = "#A3E39A",
    green_2 = "#6CD35F",
    sapphire_1 = "#47A3FF",
}

function M.colorscheme()
    vim.cmd('highlight clear')
    vim.cmd('syntax reset')

    vim.o.background = 'dark'
    vim.g.colors_name = 'svlads-theme'

    local set = vim.api.nvim_set_hl
    -- UI
    set(0, "Normal", { bg = colors.bg, fg = colors.slate_3 })
    set(0, "Visual", { bg = colors.stone_2, fg = "none" })
    set(0, "Search", { bg = colors.visual_gray, fg = colors.stone_3 })
    set(0, "match", { bg = colors.olive_1, fg = colors.stone_2 })
    set(0, "match_parent", { bg = colors.stone_1, fg = colors.khaki_1 })
    set(0, "dir", { fg = colors.sky_1 })
    set(0, "Title", { fg = colors.red_2 })
    set(0, "Border", { fg = colors.red_1 })
    set(0, "cursor_line", { fg = colors.stone_2 })
    set(0, "nontext", { fg = colors.stone_2 })
    set(0, "float", { fg = colors.sand_2, bg = colors.black_2 })
    set(0, "floatborder", { fg = colors.red_1, bg = colors.black_2 })
    set(0, "diagnosticerror", { fg = colors.rose_1, bg = colors.red_3 })
    set(0, "diagnosticwarn", { fg = colors.yellow_1, bg = colors.yellow_2 })
    set(0, "diagnosticinfo", { fg = colors.blue_1, bg = colors.blue_2 })
    set(0, "diagnostichint", { fg = colors.cyan_1, bg = colors.teal_2 })
    set(0, "diagnosticok", { fg = colors.green_1, bg = "none" })
    -- nvim tree
    set(0, "NvimTreeFolderName", { fg = colors.khaki_1 })
    set(0, "NvimTreeFolderName", { fg = colors.sunset_1 })
    set(0, "NvimTreeOpenedFolderName", { fg = colors.sunset_1 })
    set(0, "NvimTreeEmptyFolderName", { fg = colors.sunset_1 })
    set(0, "NvimTreeExecFile", { fg = colors.olive_1 })
    set(0, "NvimTreeIndentMarker", { fg = colors.sand_2 })
    -- SYNTAX
    -- data
    set(0, "parameter", { fg = colors.palm_1 })
    set(0, "identifier", { fg = colors.sky_1 })
    set(0, "delimiter", { fg = colors.red_1 })
    set(0, "type", { fg = colors.rose_1 })
    set(0, "typedef", { fg = colors.teal_1 })
    set(0, "string", { fg = colors.green_1 })
    set(0, "regex", { fg = colors.copper_1 })
    set(0, "builtin_var", { fg = colors.lavender_1 })
    set(0, "builtin_const", { fg = colors.iris_1 })
    set(0, "constant", { fg = colors.green_2 })
    -- control / flow
    set(0, "function", { fg = colors.sapphire_1 })
    set(0, "builtin_func", { fg = colors.sand_1 })
    set(0, "statement", { fg = colors.sunset_1, bold = true })
    set(0, "conditional", { fg = colors.yellow_3, bold = true })
    set(0, "exception", { fg = colors.red_4 })
    set(0, "special", { fg = colors.khaki_4 })
    set(0, "operator", { fg = colors.sundown_1, italic = true })
    set(0, "punctuation", { fg = colors.khaki_1 })
    -- connections / info
    set(0, "bracket", { fg = colors.slate_1 })
    set(0, "preproc", { fg = colors.sundown_1 })
    set(0, "macro", { fg = colors.sundown_2 })
    set(0, "comment", { fg = colors.slate_2 })
end

return M
