vim.o.relativenumber = true
vim.o.clipboard = "unnamedplus"

vim.o.scrolloff = 3
vim.o.linebreak = true
vim.o.showbreak = "↪"
vim.wo.wrap = true
vim.o.splitbelow = true
vim.o.splitright = true

vim.o.undodir = vim.fn.expand("~/.config/nvim/tmp/undo//")
-- Make the undo directory automatically if it doesn't already exist.
if vim.fn.isdirectory(vim.o.undodir) == 0 then
    vim.fn.mkdir(vim.o.undodir, "p")
end

vim.o.backup = false
vim.o.writebackup = false
vim.o.autowrite = true
vim.o.backupdir = vim.fn.expand("~/.config/nvim/tmp/backup//")

-- Make the backup directory automatically if it doesn't already exist.
if vim.fn.isdirectory(vim.o.backupdir) == 0 then
    vim.fn.mkdir(vim.o.backupdir, "p")
end

vim.o.directory = vim.fn.expand("~/.config/nvim/tmp/swap//")
vim.o.noswapfile = true

-- Make the swap directory automatically if it doesn't already exist.
if vim.fn.isdirectory(vim.o.directory) == 0 then
    vim.fn.mkdir(vim.o.directory, "p")
end

--
-- Define keymaps
--

vim.keymap.set('n', '<leader>sr', require('telescope.builtin').resume, { desc = '[S]earch [R]esume' })
vim.api.nvim_set_keymap("n", "<Leader>f", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "gf", function()
    if require("obsidian").util.cursor_on_markdown_link() then
        return "<cmd>ObsidianFollowLink<CR>"
    else
        return "gf"
    end
end, { noremap = false, expr = true })

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>k", "<cmd>cnext<CR>zz", { desc = 'Quickfix next'})
vim.keymap.set("n", "<leader>j", "<cmd>cprev<CR>zz", { desc = 'Quickfix prev'})
-- vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
-- vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- better window movement
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", { silent = true })
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", { silent = true })
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", { silent = true })
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", { silent = true })

-- better indenting
vim.api.nvim_set_keymap("v", "<", "<gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", ">", ">gv", { noremap = true, silent = true })

-- Alternative to esc
vim.api.nvim_set_keymap("i", "jk", "<ESC>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "kj", "<ESC>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "jj", "<ESC>", { noremap = true, silent = true })

-- Tab switch buffer
vim.api.nvim_set_keymap("n", "<TAB>", ":bnext<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<S-TAB>", ":bprevious<CR>", { noremap = true, silent = true })

-- Move selected line / block of text in visual mode
vim.api.nvim_set_keymap("x", "K", ":move '<-2<CR>gv=gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("x", "J", ":move '>+1<CR>gv=gv", { noremap = true, silent = true })

-- Better nav for omnicomplete
vim.cmd('inoremap <expr> <c-j> ("\\<C-n>")')
vim.cmd('inoremap <expr> <c-k> ("\\<C-p>")')

-- Spell shortcuts
vim.keymap.set("n", "<leader>ss", "1z=", { desc = '[S]pell [S]elect first'})
vim.keymap.set("n", "<leader>sv", "z=", { desc = '[S]pell [V]iew selection'})
vim.keymap.set("n", "<leader>sl", "[s1z=`]", { desc = '[S]pell fix [L]ast'})

-- Todotxt plugin
vim.keymap.set("n", "<leader>td", ":ToDoTxtTasksToggle<CR>", { desc = 'Toggle [T]o[D]o'})
vim.keymap.set("n", "<leader>tn", ":ToDoTxtCapture<CR>", { desc = '[T]odo [N]ew'})

-- Set snakemake filetype
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

