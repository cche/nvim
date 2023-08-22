return {
  'Exafunction/codeium.vim',
  config = function()
    -- vim.g.codeium_theme = 'one-dark'
    -- vim.g.codeium_theme_dark = true
    vim.g.codeium_no_map_tab = true
    vim.cmd('let g:codeium_filetypes = { "mail": v:false, "markdown": v:false, "text": v:false}' )
    -- vim.g.codeium_filetypes = { "mail", "text"}
    -- Change '<C-g>' here to any keycode you like.
    vim.keymap.set('i', '<C-g>', function() return vim.fn['codeium#Accept']() end, { expr = true })
    vim.keymap.set('i', '<C-;>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true })
    vim.keymap.set('i', '<C-,>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true })
    vim.keymap.set('i', '<C-x>', function() return vim.fn['codeium#Clear']() end, { expr = true })
  end
}
