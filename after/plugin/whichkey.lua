local wk = require("which-key")
wk.register({
  l = {
    name = "LSP",
  },
  t = {
    name = "Todo",
  },
  d = {
    name = "Test/Debug",
  },
  w = {
    name = "Workspace",
  },
  s = {
    name = "Spell",
      s = { "<cmd>Telescope spell_suggest<cr>", "spelling" },
      n = { ']s', 'next' },
      p = { '[s', 'previous' },
      g = { 'zg', 'good' },
      r = { 'zg', 'right' },
      w = { 'zw', 'wrong' },
      b = { 'zw', 'bad' },
  },
  g = {
    name = "Git",
  },
  f = {
    name = "Find/search",
      f = { '<cmd>Telescope find_files<cr>', 'files' },
      h = { '<cmd>Telescope help_tags<cr>', 'help' },
      k = { '<cmd>Telescope keymaps<cr>', 'keymaps' },
      r = { '<cmd>Telescope lsp_references<cr>', 'references' },
      g = { "<cmd>Telescope live_grep<cr>", "grep" },
      c = { "<cmd>Telescope git_commits<cr>", "git commits" },
      q = { "<cmd>Telescope quickfix<cr>", "quickfix" },
      l = { "<cmd>Telescope loclist<cr>", "loclist" },
      j = { "<cmd>Telescope jumplist<cr>", "jumplist" },
      w = { "<cmd>Telescope file_browser<cr>", "File browser" },
  },
  o = {
    name = "Obsidian",
  },
  c = {
    name = 'code',
    c = { ':SlimeConfig<cr>', 'slime config' },
    n = { ':split term://$SHELL<cr>', 'new terminal' },
    r = { ':split term://R<cr>', 'new R terminal' },
    p = { ':split term://python<cr>', 'new python terminal' },
    i = { ':split term://ipython<cr>', 'new ipython terminal' },
    j = { ':split term://julia<cr>', 'new julia terminal' },
  },
  q = {
    name = "Quarto",
  },
  x = { '<cmd>bd<cr>', 'close buffer' },
}, { prefix = "<leader>" })
return {}
