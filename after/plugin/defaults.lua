-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true
vim.o.relativenumber = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Enable break indent and wrap
vim.o.linebreak = true
vim.o.showbreak = "↪"
vim.wo.wrap = true
vim.o.breakindent = true

-- Do not fold
vim.o.foldenable = false

-- Save undo history
vim.o.undofile = true
vim.o.undodir = vim.fn.expand("~/.config/nvim/tmp/undo//")
-- Make the undo directory automatically if it doesn't already exist.
if vim.fn.isdirectory(vim.o.undodir) == 0 then
    vim.fn.mkdir(vim.o.undodir, "p")
end

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 250

-- show sign column
vim.wo.signcolumn = 'yes'

-- Set colorscheme
vim.o.termguicolors = true
vim.cmd [[colorscheme onedark]]

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- Use system clipboard
vim.o.clipboard = "unnamedplus"

-- Keep cursor from top and bottom of screen
vim.o.scrolloff = 5

-- open windows below or to the right
vim.o.splitbelow = true
vim.o.splitright = true

-- Backup in central location
vim.o.backup = false
vim.o.writebackup = false
vim.o.autowrite = true
vim.o.backupdir = vim.fn.expand("~/.config/nvim/tmp/backup//")

-- Make the backup directory automatically if it doesn't already exist.
if vim.fn.isdirectory(vim.o.backupdir) == 0 then
    vim.fn.mkdir(vim.o.backupdir, "p")
end

-- Store swap files in config dir.
vim.o.directory = vim.fn.expand("~/.config/nvim/tmp/swap//")
vim.o.noswapfile = true

-- Make the swap directory automatically if it doesn't already exist.
if vim.fn.isdirectory(vim.o.directory) == 0 then
    vim.fn.mkdir(vim.o.directory, "p")
end

vim.g.markdown_fenced_languages = { 'html', 'python', 'bash=sh', 'R=r' }

-- slime, general
vim.b.slime_cell_delimiter = "#%%"
vim.g.slime_target = "neovim"
-- vim.g.slime_python_ipython = 1
