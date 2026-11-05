return {
  {
    "quarto-dev/quarto-nvim",
    ft = { "quarto", "rmd" },
    dev = false,
    opts = {},
    -- Override quartoPreview to reuse the `tabnew` buffer instead of orphaning
    -- it (upstream creates a second buffer, leaving an empty [No Name] behind).
    config = function()
      local api = vim.api
      local quarto = require("quarto")
      local util = require("quarto.util")
      local tools = require("quarto.tools")

      quarto.quartoPreview = function(opts)
        opts = opts or {}
        local args = opts.args or ""

        local buffer_path = api.nvim_buf_get_name(0)
        local root_dir = util.root_pattern("_quarto.yml")(buffer_path)
        local cmd
        local mode

        local render_on_save = true
        local lines
        if root_dir then
          lines = vim.fn.readfile(root_dir .. "/_quarto.yml")
        else
          lines = api.nvim_buf_get_lines(0, 0, 500, false)
        end

        for _, line in ipairs(lines) do
          if line:find("render%-on%-save: false") then
            render_on_save = false
            break
          end
        end

        if not render_on_save and not args:find("%-%-no%-watch%-inputs") then
          args = args .. " --no-watch-inputs"
        end

        if root_dir then
          mode = "project"
          cmd = "quarto preview " .. vim.fn.shellescape(root_dir) .. " " .. args
        else
          mode = "file"
          cmd = "quarto preview " .. vim.fn.shellescape(buffer_path) .. " " .. args
        end

        local quarto_extensions = { ".qmd", ".Rmd", ".ipynb", ".md", ".py", ".R", ".jl" }
        local file_extension = buffer_path:match("^.+(%..+)$")
        if mode == "file" and not file_extension then
          vim.notify("Not in a file. exiting.")
          return
        end
        if mode == "file" and not tools.contains(quarto_extensions, file_extension) then
          vim.notify("Not a quarto file, ends in " .. file_extension .. " exiting.")
          return
        end

        local current_tabpage = api.nvim_get_current_tabpage()

        vim.cmd("tabnew")
        vim.fn.termopen(cmd, {
          on_exit = function(_, exit_code, _)
            if exit_code ~= 0 then
              vim.notify("Quarto preview exited with code " .. exit_code, vim.log.levels.ERROR)
            end
          end,
        })

        local quartoOutputBuf = api.nvim_get_current_buf()

        api.nvim_set_current_tabpage(current_tabpage)
        api.nvim_buf_set_var(0, "quartoOutputBuf", quartoOutputBuf)

        if QuartoConfig.closePreviewOnExit then
          api.nvim_create_autocmd({ "QuitPre", "WinClosed" }, {
            buffer = api.nvim_get_current_buf(),
            group = api.nvim_create_augroup("quartoPreview", {}),
            callback = function()
              if api.nvim_buf_is_loaded(quartoOutputBuf) then
                api.nvim_buf_delete(quartoOutputBuf, { force = true })
              end
            end,
          })
        end
      end
    end,
    dependencies = {
      {
        "jmbuhr/otter.nvim",
        opts = {
          -- buffers = {
          --   write_to_disk = true,
          -- },
        },
      },
      "nvim-treesitter/nvim-treesitter",
    },
    keys = {
      { "<leader>qa", ":QuartoActivate<cr>", desc = "quarto activate" },
      { "<leader>qp", ":lua require'quarto'.quartoPreview()<cr>", desc = "quarto preview" },
      { "<leader>qq", ":lua require'quarto'.quartoClosePreview()<cr>", desc = "quarto close" },
      { "<leader>qh", ":QuartoHelp ", desc = "quarto help" },
      { "<leader>qe", ":lua require'otter'.export()<cr>", desc = "quarto export" },
      { "<leader>qE", ":lua require'otter'.export(true)<cr>", desc = "quarto export overwrite" },
      { "<leader>qrr", ":QuartoSendAbove<cr>", desc = "quarto run to cursor" },
      { "<leader>qra", ":QuartoSendAll<cr>", desc = "quarto run all" },
      -- { '<leader>cp', '<esc>i```{python}<cr>```<esc>O', desc = 'New python chunk' },
      -- { '<leader>cr', '<esc>i```{r}<cr>```<esc>O', desc = 'New R chunk' },
      { "<leader>ctr", ":split term://R<cr>", desc = "terminal: R" },
      { "<leader>ctp", ":split term://ipython<cr>", desc = "terminal: ipython" },
      -- { "<leader>ctj", ":split term://julia<cr>", desc = "terminal: julia" },
    },
  },

  { -- directly open ipynb files as quarto docuements
    -- and convert back behind the scenes
    "GCBallesteros/jupytext.nvim",
    opts = {
      custom_language_formatting = {
        python = {
          extension = "qmd",
          style = "quarto",
          force_ft = "quarto",
        },
        r = {
          extension = "qmd",
          style = "quarto",
          force_ft = "quarto",
        },
      },
    },
  },

  -- send code from python/r/qmd documets to a terminal or REPL
  -- like ipython, R, bash
  {
    "jpalardy/vim-slime",
    dev = false,
    ft = { "quarto", "python", "r", "qmd", "rmd" },
    keys = {
      { "<leader><cr>", ":SlimeSend<cr>", ft = { "quarto", "rmd", "python", "r" }, desc = "send code chunk" },
      { "<c-cr>", ":SlimeSend<cr>", ft = { "quarto", "rmd", "python", "r" }, desc = "send code chunk" },
      { "<c-cr>", "<esc>:SlimeSend<cr>i", mode = "i", ft = { "quarto", "rmd", "python", "r" }, desc = "send code chunk" },
      { "<c-cr>", "<Plug>SlimeRegionSend", mode = "v", ft = { "quarto", "rmd", "python", "r" }, remap = true, desc = "send code chunk" },
      { "<cr>", "<Plug>SlimeRegionSend", mode = "v", ft = { "quarto", "rmd", "python", "r" }, remap = true, desc = "send code chunk" },
    },
    init = function()
      vim.b["quarto_is_python_chunk"] = false
      Quarto_is_in_python_chunk = function()
        require("otter.tools.functions").is_otter_language_context("python")
      end

      vim.cmd([[
      let g:slime_dispatch_ipython_pause = 100
      function SlimeOverride_EscapeText_quarto(text)
      call v:lua.Quarto_is_in_python_chunk()
      if exists('g:slime_python_ipython') && len(split(a:text,"\n")) > 1 && b:quarto_is_python_chunk && !(exists('b:quarto_is_r_mode') && b:quarto_is_r_mode)
      return ["%cpaste -q\n", g:slime_dispatch_ipython_pause, a:text, "--", "\n"]
      else
      if exists('b:quarto_is_r_mode') && b:quarto_is_r_mode && b:quarto_is_python_chunk
      return [a:text, "\n"]
      else
      return [a:text]
      end
      end
      endfunction
      ]])

      vim.g.slime_target = "neovim"
      vim.g.slime_no_mappings = true
      vim.g.slime_python_ipython = 1
    end,
    config = function()
      vim.g.slime_cell_delimiter = "```"
      vim.keymap.set({ "n", "i", "v" }, "<s-cr>", "<Plug>SlimeSendCell", { desc = "send code cell" })
      vim.g.slime_input_pid = false
      vim.g.slime_suggest_default = true
      vim.g.slime_menu_config = false
      vim.g.slime_neovim_ignore_unlisted = true

      local function mark_terminal()
        local job_id = vim.b.terminal_job_id
        vim.print("job_id: " .. job_id)
      end

      local function set_terminal()
        vim.fn.call("slime#config", {})
      end
      vim.keymap.set("n", "<leader>cm", mark_terminal, { desc = "[m]ark terminal" })
      vim.keymap.set("n", "<leader>cs", set_terminal, { desc = "[s]et terminal" })
    end,
  },

  { -- paste an image from the clipboard or drag-and-drop
    "HakonHarnes/img-clip.nvim",
    ft = { "markdown", "quarto", "latex" },
    opts = {
      default = {
        dir_path = "img",
      },
      filetypes = {
        markdown = {
          url_encode_path = true,
          template = "![$CURSOR]($FILE_PATH)",
          drag_and_drop = {
            download_images = false,
          },
        },
        quarto = {
          url_encode_path = true,
          template = "![$CURSOR]($FILE_PATH)",
          drag_and_drop = {
            download_images = false,
          },
        },
      },
    },
    config = function(_, opts)
      require("img-clip").setup(opts)
      vim.keymap.set("n", "<leader>ii", ":PasteImage<cr>", { desc = "insert [i]mage from clipboard" })
    end,
  },

  { -- preview equations
    "jbyuki/nabla.nvim",
    keys = {
      { "<leader>qm", ':lua require"nabla".toggle_virt()<cr>', desc = "toggle [m]ath equations" },
    },
  },

  {
    "benlubas/molten-nvim",
    enabled = false,
    build = ":UpdateRemotePlugins",
    init = function()
      vim.g.molten_image_provider = "image.nvim"
      vim.g.molten_output_win_max_height = 20
      vim.g.molten_auto_open_output = false
    end,
    keys = {
      { "<leader>mi", ":MoltenInit<cr>", desc = "[m]olten [i]nit" },
      {
        "<leader>mv",
        ":<C-u>MoltenEvaluateVisual<cr>",
        mode = "v",
        desc = "molten eval visual",
      },
      { "<leader>mr", ":MoltenReevaluateCell<cr>", desc = "molten re-eval cell" },
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et
