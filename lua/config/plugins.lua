-- Automatically source and re-compile packer whenever you save this init.lua
local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
  command = 'source <afile> | silent! LspStop | silent! LspStart | PackerSync',
  group = packer_group,
  pattern = vim.fn.expand '$MYVIMRC',
})

return require('packer').startup(function(use)
  -- Package manager
  use 'wbthomason/packer.nvim'

  use { -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    requires = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      'j-hui/fidget.nvim',

      -- Additional lua configuration, makes nvim stuff amazing
      'folke/neodev.nvim',
    },
  }

  use { -- Autocompletion
    'hrsh7th/nvim-cmp',
    requires = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
  }

  use { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    run = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
  }

  use { -- Additional text objects via treesitter
    'nvim-treesitter/nvim-treesitter-textobjects',
    after = 'nvim-treesitter',
  }

  -- Git related plugins
  use 'tpope/vim-fugitive'
  use 'tpope/vim-rhubarb'
  use 'lewis6991/gitsigns.nvim'

  use 'navarasu/onedark.nvim' -- Theme inspired by Atom
  use 'nvim-lualine/lualine.nvim' -- Fancier statusline
  use 'lukas-reineke/indent-blankline.nvim' -- Add indentation guides even on blank lines
  use 'numToStr/Comment.nvim' -- "gc" to comment visual regions/lines
  use 'tpope/vim-sleuth' -- Detect tabstop and shiftwidth automatically

  -- Fuzzy Finder (files, lsp, etc)
  use { 'nvim-telescope/telescope.nvim', branch = '0.1.x', requires = { 'nvim-lua/plenary.nvim' } }

  -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }

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
    tag = "nightly" -- optional, updated every week. (see issue #1193)
  })

  use({
    "epwalsh/obsidian.nvim",
    config = function ()
      require("obsidian").setup({
        dir = "~/Documents/notes/",
        completion = {
          nvim_cmp = true,
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
          if note.metadata ~= nil and require("obsidian").util.table_length(note.metadata) > 0 then
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

  use("folke/zen-mode.nvim")
end)
