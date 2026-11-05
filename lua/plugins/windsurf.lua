return {
  {
    "Exafunction/windsurf.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    -- event = 'BufEnter',
    config = function()
      require("codeium").setup({
        enable_cmp_source = false,
        --  default keymap
        virtual_text = {
          enabled = true,
          filetypes = {
            -- default = true
            markdown = false,
            text = false,
            mail = false,
            -- typr = false,
          },
        },
      })
    end,
  },
}
