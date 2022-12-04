local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
    execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
    execute("packadd packer.nvim")
end
-- Auto compile when there are changes in plugins.lua
-- vim.cmd("autocmd BufWritePost plugins.lua PackerSync")
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	pattern = "plugins.lua",
    command = "source % | PackerSync",
})

return require("packer").startup(function(use)
    -- Packer can manage itself as an optional plugin
    use("wbthomason/packer.nvim")

--    -- LSP
--    use({ "neovim/nvim-lspconfig" })
--    -- use {"williamboman/nvim-lsp-installer"}
--    use({ "williamboman/mason.nvim" })
--    use("williamboman/mason-lspconfig.nvim")
--    use("onsails/lspkind-nvim")
--
--    -- Complement python LSP
--    use("jose-elias-alvarez/null-ls.nvim")
--
   -- Telescope
   use({
       "nvim-telescope/telescope.nvim",
       requires = { { "nvim-lua/plenary.nvim" } },
   })
   use({ "nvim-telescope/telescope-fzy-native.nvim" })
   use("cljoly/telescope-repo.nvim")
   use("zane-/howdoi.nvim")

--    -- Debugging
--    use({ "mfussenegger/nvim-dap" })
--    use({ "nvim-telescope/telescope-dap.nvim" })
--    use({ "mfussenegger/nvim-dap-python" })
--    use({ "theHamsta/nvim-dap-virtual-text" })
--    use({ "rcarriga/nvim-dap-ui" })
--    use({ "Pocco81/DAPInstall.nvim" })
--    use({ "jbyuki/one-small-step-for-vimkind" })
--
--    use("alfredodeza/pytest.vim")
--
--    -- Autocomplete
--    use("hrsh7th/nvim-cmp")
--    use("hrsh7th/cmp-buffer")
--    use("hrsh7th/cmp-path")
--    use("hrsh7th/cmp-nvim-lua")
--    use("hrsh7th/cmp-nvim-lsp")
--    use("hrsh7th/cmp-vsnip")
--    use("hrsh7th/vim-vsnip")
--    use("rafamadriz/friendly-snippets")
--
    -- Treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    }
    -- use({ "windwp/nvim-ts-autotag", opt = true, ft = { "html", "vue", "tsx" } })
--
    -- Explorer
    use {
      'nvim-tree/nvim-tree.lua',
      requires = {
        'nvim-tree/nvim-web-devicons', -- optional, for file icons
      },
      tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }

    -- GIT
    use("lewis6991/gitsigns.nvim")
    use("tpope/vim-fugitive")
    use("tpope/vim-rhubarb")
    use("junegunn/gv.vim")
--
--    -- Interface
--    use({ "folke/which-key.nvim" })
--    use("mhinz/vim-startify")
    use({ "terrortylor/nvim-comment" })
--    use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", ft = { "markdown" } })
--    use("voldikss/vim-floaterm")
--
--    -- Snakemake files
--    use({ "snakemake/snakemake", opt = true, ft = { "snakemake" } })
--    use({ "snakemake/snakefmt", opt = true, ft = { "snakemake" } })
--
--    -- Nextflow DSL2 syntax files
--    use({ "Mxrcon/nextflow-vim", opt = true, ft = { "nextflow" } })
--
--    -- Interface for cht.sh
--    --
--    use({ "RishabhRD/popfix" })
--    use({ "RishabhRD/nvim-cheat.sh" })
--    -- use {'dbeniamine/cheat.sh-vim'}
--
--    -- TODO.TXT
--    use({ "freitass/todo.txt-vim", opt = true, ft = { "todo" } })
--    use({ "ccchapman/watson.nvim" })
--
--    -- Jupyter integration
--    -- use {'goerz/jupytext.vim', opt = true, ft = {'ipynb'}}
--    use({ "dccsillag/magma-nvim", run = ":UpdateRemotePlugins" })

    -- Color
    use({ "joshdick/onedark.vim" })
    use({ "tomasiser/vim-code-dark" })

    -- Icons
    use({ "kyazdani42/nvim-web-devicons" })

    -- Status Line and Bufferline
    use({
        "nvim-lualine/lualine.nvim",
        requires = { "kyazdani42/nvim-web-devicons", opt = true },
    })
    use({ "romgrk/barbar.nvim" })
end)
