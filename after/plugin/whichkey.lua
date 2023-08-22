local wk = require("which-key")
wk.register({
  l = {
    name = "LSP",
  },
  t = {
    name = "Todo",
  },
  w = {
    name = "Workspace",
  },
  s = {
    name = "Spell",
  },
  g = {
    name = "Git",
  },
  f = {
    name = "Find/search",
  },
  o = {
    name = "Obsidian",
  },
}, { prefix = "<leader>" })
return {}
