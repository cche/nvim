return {

  {
    'quarto-dev/quarto-nvim',
    dev = false,
    dependencies = {
      {
        'jmbuhr/otter.nvim',
        dev = false,
        dependencies = {
          { 'neovim/nvim-lspconfig' },
        },
        opts = {
            lsp = {
              hover = {
                border = "rounded",
              }
            }
          }
      },

    },
    opts = {
      lspFeatures = {
        languages = { 'r', 'python', 'julia', 'bash', 'lua', 'html' },
      },
    },
    ft = "quarto",
    keys = {
      { "<leader>qa", ":QuartoActivate<cr>", desc = "quarto activate" },
      { "<leader>qp", ":lua require'quarto'.quartoPreview()<cr>", desc = "quarto preview" },
      { "<leader>qq", ":lua require'quarto'.quartoClosePreview()<cr>", desc = "quarto close" },
      { "<leader>qh", ":QuartoHelp ", desc = "quarto help" },
      { "<leader>qe", ":lua require'otter'.export()<cr>", desc = "quarto export" },
      { "<leader>qE", ":lua require'otter'.export(true)<cr>", desc = "quarto export overwrite" },
      { "<leader>qrr", ":QuartoSendAbove<cr>", desc = "quarto run to cursor" },
      { "<leader>qra", ":QuartoSendAll<cr>", desc = "quarto run all" },
      { "<leader><cr>", ":SlimeSend<cr>", desc = "send code chunk" },
      { "<c-cr>", ":SlimeSend<cr>", desc = "send code chunk" },
      { "<c-cr>", "<esc>:SlimeSend<cr>i", mode = "i", desc = "send code chunk" },
      { "<c-cr>", "<Plug>SlimeRegionSend<cr>", mode = "v", desc = "send code chunk" },
      { "<cr>", "<Plug>SlimeRegionSend<cr>", mode = "v", desc = "send code chunk" },
      { "<leader>ctr", ":split term://R<cr>", desc = "terminal: R" },
      { "<leader>cti", ":split term://ipython<cr>", desc = "terminal: ipython" },
      { "<leader>ctp", ":split term://python<cr>", desc = "terminal: python" },
      { "<leader>ctj", ":split term://julia<cr>", desc = "terminal: julia" },
    },
  },

  -- completion
  -- {
  --   'hrsh7th/nvim-cmp',
  --   branch = 'main',
  --   dependencies = {
  --     { 'hrsh7th/cmp-nvim-lsp' },
  --     { 'hrsh7th/cmp-nvim-lsp-signature-help' },
  --     { 'hrsh7th/cmp-buffer' },
  --     { 'hrsh7th/cmp-path' },
  --     { 'hrsh7th/cmp-calc' },
  --     { 'hrsh7th/cmp-emoji' },
  --     { 'saadparwaiz1/cmp_luasnip' },
  --     { 'f3fora/cmp-spell' },
  --     { 'ray-x/cmp-treesitter' },
  --     { 'kdheepak/cmp-latex-symbols' },
  --     { 'jmbuhr/cmp-pandoc-references' },
  --     {
  --       'L3MON4D3/LuaSnip',
  --       version = nil,
  --       branch = 'master'
  --     },
  --     { 'rafamadriz/friendly-snippets' },
  --     { 'onsails/lspkind-nvim' },
  --
  --     -- optional
  --     -- more things to try:
  --     -- {
  --     --   "zbirenbaum/copilot.lua",
  --     --   config = function()
  --     --     require("copilot").setup({
  --     --       suggestion = {
  --     --         enabled = true,
  --     --         auto_trigger = true,
  --     --         debounce = 75,
  --     --         keymap = {
  --     --           accept = "<c-a>",
  --     --           accept_word = false,
  --     --           accept_line = false,
  --     --           next = "<M-]>",
  --     --           prev = "<M-[>",
  --     --           dismiss = "<C-]>",
  --     --         },
  --     --       },
  --     --       panel = { enabled = false },
  --     --     })
  --     --   end
  --     -- },
  --
  --   },
  --   config = function()
  --     local cmp = require 'cmp'
  --     local luasnip = require 'luasnip'
  --     local lspkind = require "lspkind"
  --     lspkind.init()
  --
  --     local has_words_before = function()
  --       local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  --       return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
  --     end
  --
  --     cmp.setup({
  --       snippet = {
  --         expand = function(args)
  --           luasnip.lsp_expand(args.body)
  --         end,
  --       },
  --       mapping = {
  --         ['<C-f>'] = cmp.mapping.scroll_docs(-4),
  --         ['<C-d>'] = cmp.mapping.scroll_docs(4),
  --         ['<C-n>'] = cmp.mapping(function(fallback)
  --           if luasnip.expand_or_jumpable() then
  --             luasnip.expand_or_jump()
  --             fallback()
  --           end
  --         end, { "i", "s" }),
  --         ['<C-p>'] = cmp.mapping(function(fallback)
  --           if luasnip.jumpable(-1) then
  --             luasnip.jump(-1)
  --           else
  --             fallback()
  --           end
  --         end, { "i", "s" }),
  --         ['<C-e>'] = cmp.mapping.abort(),
  --         ['<CR>'] = cmp.mapping.confirm({
  --           select = true,
  --         }),
  --         ["<Tab>"] = cmp.mapping(function(fallback)
  --           if cmp.visible() then
  --             cmp.select_next_item()
  --           elseif has_words_before() then
  --             cmp.complete()
  --           else
  --             fallback()
  --           end
  --         end, { "i", "s" }),
  --         ["<S-Tab>"] = cmp.mapping(function(fallback)
  --           if cmp.visible() then
  --             cmp.select_prev_item()
  --           else
  --             fallback()
  --           end
  --         end, { "i", "s" }),
  --       },
  --       autocomplete = false,
  --       formatting = {
  --         -- format = lspkind.cmp_format {
  --         --   with_text = true,
  --         --   menu = {
  --         --     otter = "[🦦]",
  --         --     luasnip = "[snip]",
  --         --     nvim_lsp = "[LSP]",
  --         --     buffer = "[buf]",
  --         --     path = "[path]",
  --         --     spell = "[spell]",
  --         --     pandoc_references = "[ref]",
  --         --     tags = "[tag]",
  --         --     treesitter = "[TS]",
  --         --     calc = "[calc]",
  --         --     latex_symbols = "[tex]",
  --         --     emoji = "[emoji]",
  --         --   },
  --         -- },
  --       },
  --       sources = {
  --         { name = 'otter' }, -- for code chunks in quarto
  --         { name = 'path' },
  --         { name = 'nvim_lsp' },
  --         { name = 'nvim_lsp_signature_help' },
  --         { name = 'luasnip',                keyword_length = 3, max_item_count = 3 },
  --         { name = 'pandoc_references' },
  --         { name = 'buffer',                 keyword_length = 5, max_item_count = 3 },
  --         { name = 'spell' },
  --         { name = 'treesitter',             keyword_length = 5, max_item_count = 3 },
  --         { name = 'calc' },
  --         { name = 'latex_symbols' },
  --         { name = 'emoji' },
  --       },
  --       view = {
  --         entries = "native",
  --       },
  --       window = {
  --         documentation = {
  --           border = "rounded",
  --         },
  --       },
  --     })
  --
  --     -- for friendly snippets
  --     require("luasnip.loaders.from_vscode").lazy_load()
  --     -- for custom snippets
  --     require("luasnip.loaders.from_vscode").lazy_load({ paths = { vim.fn.stdpath("config") .. "/snips" } })
  --     -- link quarto and rmarkdown to markdown snippets
  --     luasnip.filetype_extend("quarto", { "markdown" })
  --     luasnip.filetype_extend("rmarkdown", { "markdown" })
  --   end
  -- },


  -- send code from python/r/qmd documets to a terminal or REPL
  -- like ipython, R, bash
  {
    'jpalardy/vim-slime',
    init = function()
      vim.b['quarto_is_' .. 'python' .. '_chunk'] = false
      Quarto_is_in_python_chunk = function()
        require 'otter.tools.functions'.is_otter_language_context('python')
      end

      vim.cmd [[
      let g:slime_dispatch_ipython_pause = 100
      function SlimeOverride_EscapeText_quarto(text)
      call v:lua.Quarto_is_in_python_chunk()
      if exists('g:slime_python_ipython') && len(split(a:text,"\n")) > 1 && b:quarto_is_python_chunk
      return ["%cpaste -q\n", g:slime_dispatch_ipython_pause, a:text, "--", "\n"]
      else
      return a:text
      end
      endfunction
      ]]

      local function mark_terminal()
        vim.g.slime_last_channel = vim.b.terminal_job_id
        vim.print(vim.g.slime_last_channel)
      end

      local function set_terminal()
        vim.b.slime_config = { jobid = vim.g.slime_last_channel }
      end

      vim.b.slime_cell_delimiter = "```"

      -- slime, neovvim terminal
      vim.g.slime_target = "neovim"
      vim.g.slime_python_ipython = 1

      -- -- slime, tmux
      -- vim.g.slime_target = 'tmux'
      -- vim.g.slime_bracketed_paste = 1
      -- vim.g.slime_default_config = { socket_name = "default", target_pane = ".2" }

      local function toggle_slime_tmux_nvim()
        if vim.g.slime_target == 'tmux' then
          pcall(function()
            vim.b.slime_config = nil
            vim.g.slime_default_config = nil
          end
          )
          -- slime, neovvim terminal
          vim.g.slime_target = "neovim"
          vim.g.slime_bracketed_paste = 0
          vim.g.slime_python_ipython = 1
        elseif vim.g.slime_target == 'neovim' then
          pcall(function()
            vim.b.slime_config = nil
            vim.g.slime_default_config = nil
          end
          )
          -- -- slime, tmux
          vim.g.slime_target = 'tmux'
          vim.g.slime_bracketed_paste = 1
          vim.g.slime_default_config = { socket_name = "default", target_pane = ".2" }
        end
      end

      require 'which-key'.register({
        ['<leader>cm'] = { mark_terminal, 'mark terminal' },
        ['<leader>cs'] = { set_terminal, 'set terminal' },
        ['<leader>ct'] = { toggle_slime_tmux_nvim, 'toggle tmux/nvim terminal' },
      })
    end
  },

  -- paste an image to markdown from the clipboard
  -- :PasteImg,
  { 'ekickx/clipboard-image.nvim' },

  -- preview equations
  {'jbyuki/nabla.nvim',
    keys = {
      { '<leader>ee', ':lua require"nabla".toggle_virt()<cr>', 'toggle equations' },
      { '<leader>eh', ':lua require"nabla".popup()<cr>', 'hover equation' },
    },
  },


}
