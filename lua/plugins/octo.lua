return {
  "pwntester/octo.nvim",
  cmd = "Octo",
  opts = {
    -- or "fzf-lua" or "snacks" or "default"
    picker = "telescope",
    -- bare Octo command opens picker of commands
    enable_builtin = true,
  },
  keys = {
    {
      "<leader>gi",
      "<CMD>Octo issue list<CR>",
      desc = "List GitHub Issues",
    },
    {
      "<leader>gp",
      "<CMD>Octo pr list<CR>",
      desc = "List GitHub PullRequests",
    },
    {
      "<leader>gd",
      "<CMD>Octo discussion list<CR>",
      desc = "List GitHub Discussions",
    },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    -- OR "ibhagwan/fzf-lua",
    -- OR "folke/snacks.nvim",
    "nvim-tree/nvim-web-devicons", -- optional if file_panel.icons is a function
  },
}
