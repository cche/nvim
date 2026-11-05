return {
  "Run1e/pi-agent.nvim",
  config = function()
    local pi = require("pi-agent")
    pi.setup({
      surface = pi.get_surface("nvim"),
    })
  end,
  keys = {
    { "<leader>as", function() require("pi-agent").start() end, mode = "n", desc = "pi: Start" },
    { "<leader>af", function() require("pi-agent").focus() end, mode = "n", desc = "pi: Focus" },
    { "<leader>ac", function() require("pi-agent").close() end, mode = "n", desc = "pi: Close" },
    { "<leader>al", function() require("pi-agent").paste_cursor_location() end, mode = { "n", "x" }, desc = "pi: Paste cursor location" },
    { "<leader>ar", function() require("pi-agent").paste_selection_location() end, mode = { "n", "x" }, desc = "pi: Paste range location" },
    { "<leader>ap", function() require("pi-agent").paste_selection_contents() end, mode = { "n", "x" }, desc = "pi: Paste selection contents" },
  },
}
