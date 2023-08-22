-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- center up/down when scrolling and searching
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Navigate quickfix
vim.keymap.set("n", "<leader>j", "<cmd>cnext<CR>zz", { desc = 'Quickfix next'})
vim.keymap.set("n", "<leader>k", "<cmd>cprev<CR>zz", { desc = 'Quickfix prev'})
vim.keymap.set("n", "<A-j>", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<A-k>", "<cmd>lprev<CR>zz")

-- better window movement
vim.keymap.set("n", "<C-h>", "<C-w>h", { silent = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { silent = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { silent = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { silent = true })

-- better indenting
vim.keymap.set("v", "<", "<gv", { noremap = true, silent = true })
vim.keymap.set("v", ">", ">gv", { noremap = true, silent = true })

-- Alternative to esc
vim.keymap.set("i", "jk", "<ESC>", { noremap = true, silent = true })
vim.keymap.set("i", "kj", "<ESC>", { noremap = true, silent = true })
vim.keymap.set("i", "jj", "<ESC>", { noremap = true, silent = true })

-- Move selected line / block of text in visual mode
vim.keymap.set("x", "K", ":move '<-2<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set("x", "J", ":move '>+1<CR>gv=gv", { noremap = true, silent = true })

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

-- Tab switch buffer
vim.keymap.set("n", "<TAB>", ":bnext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<S-TAB>", ":bprevious<CR>", { noremap = true, silent = true })

