local cmd = vim.cmd
local fn = vim.fn
local g = vim.g

local function map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

cmd("syntax on")
cmd("filetype plugin on")

require("plugins")

g["mapleader"] = " "
-- g["maplocalleader"] = "\\"

vim.o.ignorecase = true -- Ignore the case, unless...
vim.o.smartcase = true -- ...there's caps in it.

--  displaying text --

vim.o.scrolloff = 3
vim.o.linebreak = true
vim.o.breakindent = true
vim.o.showbreak = "↪"
vim.o.lazyredraw = true
vim.o.list = true
vim.wo.wrap = true
vim.o.fileencoding = "utf-8"
vim.o.pumheight = 10
vim.o.conceallevel = 0
vim.wo.number = true
vim.wo.relativenumber = true
vim.o.cmdheight = 2

--
-- syntax, highlighting and spelling ---
--

if fn.has("termguicolors") == 1 then
    vim.o.termguicolors = true
end
vim.go.t_Co = "256"

vim.o.synmaxcol = 800
vim.o.hlsearch = true
vim.o.cursorline = true
-- vim.o.guifont="Sauce Code Pro Nerd Font:h17"
vim.o.clipboard = "unnamedplus"
-- opt("o", "background", "dark")
-- vim.cmd('colorscheme codedark')
vim.cmd("colorscheme onedark")
cmd([[hi! Comment gui=italic]])

-- TODO Set spellfiles and shortcut to put words in them

-- Highlight VCS conflict markers
fn.matchadd("ErrorMsg", "^\\(<\\|=\\|>\\)\\{7\\}\\([^=].\\+\\)\\?$")

vim.o.hidden = true
vim.o.splitbelow = true
vim.o.splitright = true

vim.o.title = true

if fn.has("mouse") == 1 then
    vim.o.mouse = "a"
end

vim.o.showcmd = true
vim.o.showmode = true

-- -- Avoid showing message extra message when using completion
-- -- Ensure autocmd works for Filetype
-- vim.o.shortmess = string.gsub(vim.o.shortmess, "F", "") .. "c"

-- Undo, backup and swap files ---
cmd("set undofile")
-- The extra slash on the end saves files under the name of their full path
-- with the / character replaced with a %.
vim.o.undodir = fn.expand("~/.config/nvim/tmp/undo//")
-- Make the undo directory automatically if it doesn't already exist.
if fn.isdirectory(vim.o.undodir) == 0 then
    fn.mkdir(vim.o.undodir, "p")
end

-- -- Set completeopt to have a better completion experience
-- vim.o.completeopt = "menuone,noinsert,noselect"

vim.o.backup = false
vim.o.writebackup = false
vim.o.autowrite = true
vim.o.backupdir = fn.expand("~/.config/nvim/tmp/backup//")

-- Make the backup directory automatically if it doesn't already exist.
if fn.isdirectory(vim.o.backupdir) == 0 then
    fn.mkdir(vim.o.backupdir, "p")
end

vim.o.directory = fn.expand("~/.config/nvim/tmp/swap//")
cmd("set noswapfile")

-- Make the swap directory automatically if it doesn't already exist.
if fn.isdirectory(vim.o.directory) == 0 then
    fn.mkdir(vim.o.directory, "p")
end

-- tabs and indenting --

vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.expandtab = true
vim.bo.smartindent = true

vim.o.timeoutlen = 500

-- Do not show q: window
map("n", "q:", ":q")
map("n", "<c-l>", ":nohlsearch<cr><c-l>")

vim.wo.signcolumn = "yes"

--
-- Autogroups

local markdown = vim.api.nvim_create_augroup("markdown", { clear = true })
vim.api.nvim_create_autocmd("Filetype", {
    pattern = "markdown",
    command = "setlocal wrap",
    group = markdown,
})
vim.api.nvim_create_autocmd("Filetype", {
    pattern = "markdown",
    command = "setlocal spell spelllang=en,fr,es",
    group = markdown,
})

local snakemake = vim.api.nvim_create_augroup("snakemake", { clear = true })
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
    pattern = "Snakefile,*.smk",
    command = "set filetype=snakemake",
    group = snakemake,
})
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    pattern = "Snakefile,*.smk",
    command = ":Snakefmt",
    group = snakemake,
})

DATA_PATH = vim.fn.stdpath("data")
CACHE_PATH = vim.fn.stdpath("cache") -- TODO not used

------
require("keymappings")
require("nvimtree")
require("nvim_comment").setup()
require("lua-line")
-- require("plugconf.nvim-cmp")
require("barbar")
-- require("plugconf.telescope")
require("git-signs")
require("treesitter")
-- require("plugconf.floaterm")
-- require("plugconf.watson")
-- require("dbg")
-- 
-- require("plugconf.which-key")
-- 
-- -- LSP
-- require("lsp")
-- 
-- vim.cmd("source ~/.config/nvim/vimscript/startify.vim")
-- vim.cmd("source ~/.config/nvim/vimscript/todo-txt.vim")
-- vim.cmd("source ~/.config/nvim/vimscript/pytest.vim")
-- vim.cmd("source ~/.config/nvim/vimscript/magma-nvim.vim")
-- vim.cmd("source ~/.config/nvim/vimscript/pyflyby.vim")
-- -- vim.cmd('source ~/.config/nvim/vimscript/jupytext.vim')
