return function(use)
  use({
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup({})
    end
  })

  use({"zane-/howdoi.nvim"})

  use({
    "nvim-tree/nvim-tree.lua",
    requires = {
      "nvim-tree/nvim-web-devicons", -- optional, for file icons
    },
    tag = "nightly", -- optional, updated every week. (see issue #1193)
    config = function ()
      require 'nvim-tree'.setup {
        auto_reload_on_write = true,
        disable_netrw = false,
        -- hide_root_folder = false,
        hijack_cursor = false,
        hijack_netrw = true,
        hijack_unnamed_buffer_when_opening = false,
        ignore_buffer_on_setup = false,
        open_on_setup = false,
        open_on_tab = false,
        sort_by = "name",
        update_cwd = false,
        respect_buf_cwd = true,
        create_in_closed_folder = false,
        view = {
          width = 30,
          side = "left",
          preserve_window_proportions = false,
          number = false,
          relativenumber = false,
          signcolumn = "yes",
          mappings = {
            custom_only = false,
            list = {
              -- user mappings go here
            },
          },
        },
        hijack_directories = {
          enable = true,
          auto_open = true,
        },
        update_focused_file = {
          enable = false,
          update_cwd = false,
          ignore_list = {},
        },
        ignore_ft_on_setup = {},
        system_open = {
          cmd = nil,
          args = {},
        },
        diagnostics = {
          enable = false,
          show_on_dirs = false,
          icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
          },
        },
        filters = {
          dotfiles = false,
          custom = {},
          exclude = {},
        },
        git = {
          enable = true,
          ignore = true,
          timeout = 400,
        },
        actions = {
          change_dir = {
            enable = true,
            global = false,
          },
          open_file = {
            quit_on_open = true,
            resize_window = false,
            window_picker = {
              enable = true,
              chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
              exclude = {
                filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
                buftype = { "nofile", "terminal", "help" },
              },
            },
          },
        },
        renderer = {
          indent_markers = {
            enable = true,
          },
          highlight_git = true,
          highlight_opened_files = "icon",
          root_folder_modifier = ':~',
          add_trailing = true,
          group_empty = true,
          icons = {
            padding = ' ',
            symlink_arrow = ' >> ',
            show = { git = true, folder = true, file = true, folder_arrow = true },
            glyphs = {
              default = "",
              symlink = "",
              git = {
                unstaged = "",
                staged = "✓",
                unmerged = "",
                renamed = "➜",
                untracked = "★",
                deleted = "",
                ignored = "◌"
              },
              folder = {
                arrow_open = "",
                arrow_closed = "",
                default = "",
                open = "",
                empty = "",
                empty_open = "",
                symlink = "",
                symlink_open = "",
              }
            },
          },
          special_files = { "README.md", "Makefile", "MAKEFILE" }

        },
        trash = {
          cmd = "trash",
          require_confirm = true,
        },
        log = {
          enable = false,
          truncate = false,
          types = {
            all = false,
            config = false,
            copy_paste = false,
            git = false,
            profile = false,
          },
        },
      }
    end
  })

  use({
    "epwalsh/obsidian.nvim",
    config = function ()
      require("obsidian").setup({
        dir = "~/Documents/notes/",
        completion = {
          nvim_cmp = true, -- if using nvim-cmp, otherwise set to false
        },
        note_id_func = function(title)
          -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
          local suffix = ""
          if title ~= nil then
            -- If title is given, transform it into valid file name.
            suffix = title:gsub(" ", "_"):gsub("[^A-Za-z0-9-_]", ""):lower()
          else
            -- If title is nil, just add 4 random uppercase letters to the suffix.
            for _ = 1, 4 do
              suffix = suffix .. string.char(math.random(65, 90))
            end
          end
          return tostring(os.time()) .. "-" .. suffix
        end,
        note_frontmatter_func = function(note)
          local out = { id = note.id, aliases = note.aliases, tags = note.tags }
          -- `note.metadata` contains any manually added fields in the frontmatter.
          -- So here we just make sure those fields are kept in the frontmatter.
          if note.metadata ~= nil and util.table_length(note.metadata) > 0 then
            for k, v in pairs(note.metadata) do
              out[k] = v
            end
          end
          return out
        end,
      })
    end
  })
  -- Snakemake files
  use({ "snakemake/snakemake", opt = true, ft = { "snakemake" } })
  use({ "snakemake/snakefmt", opt = true, ft = { "snakemake" } })

  -- Nextflow DSL2 syntax files
  use({ "Mxrcon/nextflow-vim", opt = true, ft = { "nextflow" } })

  --    -- Interface for cht.sh
  --    --
  --    use({ "RishabhRD/popfix" })
  --    use({ "RishabhRD/nvim-cheat.sh" })
  --    -- use {'dbeniamine/cheat.sh-vim'}
  --

  --    -- TODO.TXT
  use({
    "arnarg/todotxt.nvim",
    requires = { "MunifTanjim/nui.nvim" },
    config = function()
      require("todotxt-nvim").setup{
        todo_file = "~/Dropbox/Apps/Simpletask/todo.txt",
        sidebar = {
          width = 50,
          position = "right"
        },
        capture = {
          prompt = "> ",
          -- Percentage is percentage of width of the whole editor
          -- Integer is number of columns
          width = "75%",
          position = "50%",
          -- Styled after https://swiftodoapp.com/todotxt-syntax/priority/
          -- With this, if you include any of the below keywords it will
          -- automatically use the associated priority and remove that
          -- keyword from the final task.
          alternative_priority = {
            A = "now",
            B = "next",
            C = "today",
            D = "this week",
            E = "next week",
          },
        },
        -- Highlights used in both capture prompt and tasks sidebar
        -- Each highlight type can be a table with 'fg', 'bg' and 'style'
        -- options or a string referencing an existing highlight group.
        -- highlights = {
        --   project = "Identifier",
        -- }
        highlights = {
          project = {
            fg = "magenta",
            bg = "NONE",
            style = "NONE",
          },
          context = {
            fg = "cyan",
            bg = "NONE",
            style = "NONE",
          },
          date = {
            fg = "NONE",
            bg = "NONE",
            style = "underline",
          },
          done_task = {
            fg = "gray",
            bg = "NONE",
            style = "NONE",
          },
          priorities = {
            A = {
              fg = "green",
              bg = "NONE",
              style = "bold",
            },
            B = {
              fg = "magenta",
              bg = "NONE",
              style = "bold",
            },
            C = {
              fg = "yellow",
              bg = "NONE",
              style = "bold",
            },
            D = {
              fg = "cyan",
              bg = "NONE",
              style = "bold",
            },
          },
        },
        -- Keymap used in sidebar split
        keymap = {
          quit = "q",
          toggle_metadata = "m",
          delete_task = "dd",
          complete_task = "cc",
          edit_task = "ee",
        },
      }
    end
  })
end
