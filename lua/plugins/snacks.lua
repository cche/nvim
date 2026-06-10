-- lazy.nvim
return {
  "folke/snacks.nvim",
  ---@type snacks.Config
  opts = {
    image = {
      -- your image configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      resolve = function(path, src)
        local api = require("obsidian.api")
        if api.path_is_note(path) then
          return api.resolve_attachment_path(src)
        end
      end,
    },
  },
}
