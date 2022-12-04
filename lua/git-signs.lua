require("gitsigns").setup({
    signs = {
        add = { hl = "GitSignsAdd", text = "▎", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
        change = { hl = "GitSignsChange", text = "▎", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
        delete = { hl = "GitSignsDelete", text = "契", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
        topdelete = { hl = "GitSignsDelete", text = "契", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
        changedelete = { hl = "GitSignsChange", text = "▎", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
    },
    numhl = false,
    linehl = false,
    keymaps = {
        -- Default keymap options
        noremap = true,
        buffer = true,
    },
    current_line_blame = false,
    sign_priority = 6,
    update_debounce = 100,
    status_formatter = nil, -- Use default
    diff_opts = { internal = true }, -- if luajit is present
})
