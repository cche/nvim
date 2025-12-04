return {
<<<<<<< HEAD
  "epwalsh/obsidian.nvim",
  event = { "BufReadPre " .. vim.fn.expand "~" .. "/Documents/notes/**.md" },
=======
  "obsidian-nvim/obsidian.nvim",
  version = "*",
  lazy = true,
  ft = "markdown",
  -- event = { 'BufReadPre ' .. vim.fn.expand '~' .. '/Documents/notes/**.md' },
>>>>>>> master
  -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand':
  -- event = { "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md" },
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",
<<<<<<< HEAD

    -- Optional, for completion.
    "hrsh7th/nvim-cmp",

    -- Optional, for search and quick-switch functionality.
    "nvim-telescope/telescope.nvim",

    -- Optional, alternative to nvim-treesitter for syntax highlighting.
    "godlygeek/tabular",
    "preservim/vim-markdown",
  },
  opts = {
    dir = "~/Documents/notes",  -- no need to call 'vim.fn.expand' here

    -- Optional, if you keep notes in a specific subdirectory of your vault.
    notes_subdir = "",

    -- Optional, if you keep daily notes in a separate directory.
    daily_notes = {
      folder = "",
    },

    -- Optional, completion.
    completion = {
      nvim_cmp = true,  -- if using nvim-cmp, otherwise set to false
    },
    mappings = {
      -- This is used if the function in config is not used.
      -- ["gf"] = require("obsidian.mapping").gf_passthrough(),
    },

    -- Optional, customize how names/IDs for new notes are created.
    note_id_func = function(title)
      -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
      -- In this case a note with the title 'My new note' will given an ID that looks
=======
    -- Optional, for completion.
    -- "hrsh7th/nvim-cmp",
    -- Optional, for search and quick-switch functionality.
    "nvim-telescope/telescope.nvim",
  },
  opts = {
    workspaces = {
      {
        name = "work",
        path = "~/Documents/notes",
        -- Optional, override certain settings.
        overrides = {},
      },
      {
        name = "chronoget",
        path = "~/src/repos/chronoget/data/docs",
      },
    },

    -- Optional, customize how note IDs are generated given an optional title.
    ---@param title string|?
    ---@return string
    note_id_func = function(title)
      -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
      -- In this case a note with the title 'My new note' will be given an ID that looks
>>>>>>> master
      -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
      local suffix = ""
      if title ~= nil then
        -- If title is given, transform it into valid file name.
<<<<<<< HEAD
        suffix = title:gsub(" ", "_"):gsub("[^A-Za-z0-9-]", ""):lower()
=======
        suffix = title:gsub(" ", "_"):gsub("[^A-Za-z0-9-_]", ""):lower()
>>>>>>> master
      else
        -- If title is nil, just add 4 random uppercase letters to the suffix.
        for _ = 1, 4 do
          suffix = suffix .. string.char(math.random(65, 90))
        end
      end
<<<<<<< HEAD
      return tostring(os.time()) .. "-" .. suffix
    end,

    -- Optional, set to true if you don't want Obsidian to manage frontmatter.
    disable_frontmatter = false,

    -- Optional, alternatively you can customize the frontmatter data.
    note_frontmatter_func = function(note)
      -- This is equivalent to the default frontmatter function.
      local out = { id = note.id, aliases = note.aliases, tags = note.tags }
      -- `note.metadata` contains any manually added fields in the frontmatter.
      -- So here we just make sure those fields are kept in the frontmatter.
      if note.metadata ~= nil and require("obsidian").util.table_length(note.metadata) > 0 then
        for k, v in pairs(note.metadata) do
          out[k] = v
        end
      end
      return out
=======
      return suffix
    end,

    -- Optional, customize how note file names are generated given the ID, target directory, and title.
    ---@param spec { id: string, dir: obsidian.Path, title: string|? }
    ---@return string|obsidian.Path The full path to the new note.
    note_path_func = function(spec)
      -- This is equivalent to the default behavior.
      local path = spec.dir / tostring(spec.id)
      return path:with_suffix(".md")
>>>>>>> master
    end,

    -- Optional, for templates (see below).
    templates = {
<<<<<<< HEAD
      subdir = "templates",
      date_format = "%d-%m-%Y",
      time_format = "%H:%M",
=======
      folder = "templates",
      date_format = "%Y-%m-%d",
      time_format = "%H:%M",
      -- A map for custom variables, the key should be the variable and the value a function
      substitutions = {},

      ---@class obsidian.config.CustomTemplateOpts
      ---
      ---@field notes_subdir? string
      ---@field note_id_func? (fun(title: string|?, path: obsidian.Path|?): string)
      customizations = {},
>>>>>>> master
    },

    -- Optional, by default when you use `:ObsidianFollowLink` on a link to an external
    -- URL it will be ignored but you can customize this behavior here.
    follow_url_func = function(url)
      -- Open the URL in the default web browser.
      -- vim.fn.jobstart({"open", url})  -- Mac OS
<<<<<<< HEAD
      vim.fn.jobstart({"xdg-open", url})  -- linux
    end,

    -- Optional, set to true if you use the Obsidian Advanced URI plugin.
    -- https://github.com/Vinzent03/obsidian-advanced-uri
    use_advanced_uri = true,

    -- Optional, set to true to force ':ObsidianOpen' to bring the app to the foreground.
    open_app_foreground = false,

    -- Optional, by default commands like `:ObsidianSearch` will attempt to use
    -- telescope.nvim, fzf-lua, and fzf.nvim (in that order), and use the
    -- first one they find. By setting this option to your preferred
    -- finder you can attempt it first. Note that if the specified finder
    -- is not installed, or if it the command does not support it, the
    -- remaining finders will be attempted in the original order.
    finder = "telescope.nvim",
  },
  config = function(_, opts)
    require("obsidian").setup(opts)

    -- Optional, override the 'gf' keymap to utilize Obsidian's search functionality.
    -- see also: 'follow_url_func' config option above.
    vim.keymap.set("n", "gf", function()
      if require("obsidian").util.cursor_on_markdown_link() then
        return "<cmd>ObsidianFollowLink<CR>"
      else
        return "gf"
      end
    end, { noremap = false, expr = true })
    vim.keymap.set("n", "<leader>on", "<cmd>ObsidianNew<cr>", { noremap = false, expr = true, desc = "New note" })
    vim.keymap.set("n", "<leader>os", "<cmd>ObsidianSearch<cr>", { noremap = false, expr = true, desc = "Search notes" })
    vim.keymap.set("n", "<leader>oo", "<cmd>ObsidianQuickSwitch<cr>", { noremap = false, expr = true, desc = "Open note" })
    vim.keymap.set("n", "<leader>of", "<cmd>ObsidianFollowLink<cr>", { noremap = false, expr = true, desc = "Follow link" })
    vim.keymap.set("n", "<leader>ol", "<cmd>ObsidianLink<cr>", { noremap = false, expr = true, desc = "Create link to note" })
    vim.keymap.set("v", "<leader>oc", "<cmd>ObsidianLinkNew<cr>", { noremap = false, expr = true, desc = "Create new link and note" })
    vim.keymap.set("n", "<leader>ob", "<cmd>ObsidianBacklinks<cr>", { noremap = false, expr = true, desc = "Backlinks" })
    vim.keymap.set("n", "<leader>ot", "<cmd>ObsidianTemplate<cr>", { noremap = false, expr = true, desc = "Insert Template" })
  end,
}
=======
      vim.fn.jobstart({ "xdg-open", url }) -- linux
    end,

    -- Optional, by default when you use `:ObsidianFollowLink` on a link to an image
    -- file it will be ignored but you can customize this behavior here.
    ---@param img string
    follow_img_func = function(img)
      -- vim.fn.jobstart { "qlmanage", "-p", img }  -- Mac OS quick look preview
      vim.fn.jobstart({ "xdg-open", img }) -- linux
      -- vim.cmd(':silent exec "!start ' .. url .. '"') -- Windows
    end,

    picker = {
      -- Set your preferred picker. Can be one of 'telescope.nvim', 'fzf-lua', or 'mini.pick'.
      -- name = "telescope.nvim",
    },
    -- Optional, define your own callbacks to further customize behavior.
    callbacks = {},
    ui = {
      enable = false, -- set to false to disable all additional syntax features
      -- Define how various check-boxes are displayed
      -- checkboxes = {
      --   -- NOTE: the 'char' value has to be a single character, and the highlight groups are defined below.
      --   [" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
      --   ["x"] = { char = "", hl_group = "ObsidianDone" },
      --   [">"] = { char = "", hl_group = "ObsidianRightArrow" },
      --   ["~"] = { char = "󰰱", hl_group = "ObsidianTilde" },
      --   ["!"] = { char = "", hl_group = "ObsidianImportant" },
      --   -- Replace the above with this if you don't have a patched font:
      --   -- [" "] = { char = "☐", hl_group = "ObsidianTodo" },
      --   -- ["x"] = { char = "✔", hl_group = "ObsidianDone" },
      --
      --   -- You can also add more custom ones...
      -- },
      -- Use bullet marks for non-checkbox lists.
      bullets = { char = "•", hl_group = "ObsidianBullet" },
      external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
      reference_text = { hl_group = "ObsidianRefText" },
      highlight_text = { hl_group = "ObsidianHighlightText" },
      tags = { hl_group = "ObsidianTag" },
      block_ids = { hl_group = "ObsidianBlockID" },
      hl_groups = {
        -- The options are passed directly to `vim.api.nvim_set_hl()`. See `:help nvim_set_hl`.
        ObsidianTodo = { bold = true, fg = "#f78c6c" },
        ObsidianDone = { bold = true, fg = "#89ddff" },
        ObsidianRightArrow = { bold = true, fg = "#f78c6c" },
        ObsidianTilde = { bold = true, fg = "#ff5370" },
        ObsidianImportant = { bold = true, fg = "#d73128" },
        ObsidianBullet = { bold = true, fg = "#89ddff" },
        ObsidianRefText = { underline = true, fg = "#c792ea" },
        ObsidianExtLinkIcon = { fg = "#c792ea" },
        ObsidianTag = { italic = true, fg = "#89ddff" },
        ObsidianBlockID = { italic = true, fg = "#89ddff" },
        ObsidianHighlightText = { bg = "#75662e" },
      },
    },
  },

  -- Specify how to handle attachments.
  attachments = {
    -- The default folder to place images in via `:ObsidianPasteImg`.
    -- If this is a relative path it will be interpreted as relative to the vault root.
    -- You can always override this per image by passing a full path to the command instead of just a filename.
    img_folder = "attachments", -- This is the default

    -- Optional, customize the default name or prefix when pasting images via `:ObsidianPasteImg`.
    ---@return string
    img_name_func = function()
      -- Prefix image names with timestamp.
      return string.format("%s-", os.time())
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
>>>>>>> master
