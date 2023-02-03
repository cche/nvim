-- [[ Basic Keymaps ]]
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

vim.keymap.set('n', '<leader>sr', require('telescope.builtin').resume, { desc = '[S]earch [R]esume' })
vim.keymap.set("n", "<Leader>f", ":NvimTreeToggle<CR>", { noremap = true, silent = true, desc = 'Toggle NvimTree' })

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

-- Tab switch buffer
vim.keymap.set("n", "<TAB>", ":bnext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<S-TAB>", ":bprevious<CR>", { noremap = true, silent = true })

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

-- telescope
-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer]' })

vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, {desc = 'Goto next diagnostic'})
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, {desc = 'Goto previous diagnostic'})
vim.keymap.set('n', '<leader>dd', vim.diagnostic.open_float, {desc = 'Show diagnostic'})
vim.keymap.set('n', '<leader>dq', vim.diagnostic.setloclist, {desc = 'Send diagnostic to loclist'})

-- terminal keymaps
--
function _G.set_terminal_keymaps()
  local opts = { buffer = 0 }
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

vim.keymap.set('n', '<leader>cc', "<cmd>SlimeConfig<cr>", {desc = 'Slime config'})
vim.keymap.set('n', '<leader>cn', "<cmd>split term://$SHELL<cr>", {desc = 'New terminal'})
vim.keymap.set('n', '<leader>cr', "<cmd>split term://R<cr>", {desc = 'New R terminal'})
vim.keymap.set('n', '<leader>cp', "<cmd>split term://python<cr>", {desc = 'New Python terminal'})
vim.keymap.set('n', '<leader>ci', "<cmd>split term://ipython<cr>", {desc = 'New Ipython terminal'})
vim.keymap.set('n', '<leader>cj', "<cmd>split term://julia<cr>", {desc = 'New Julia terminal'})
vim.keymap.set('n', '<leader>cb', "<cmd>echo b:terminal_job_id<cr>", {desc = 'Show terminal id'})
-- Slime keymaps
vim.keymap.set('n', '<leader><cr>', '<Plug>SlimeSendCell', {desc = 'Send Cell to terminal'})
vim.keymap.set('x', '<s-cr>', '<Plug>SlimeRegionSend', {desc = 'Send Cell to terminal'})

-- Quarto keymaps
vim.keymap.set('n', '<leader>qp', require'quarto'.quartoPreview, {desc = 'Preview'})
vim.keymap.set('n', '<leader>qq', require'quarto'.quartoClosePreview, {desc = 'Close'})
-- vim.keymap.set('n', '<leader>qe', require'otter'.export, {desc = 'Export'})
-- vim.keymap.set('n', '<leader>qE', require'otter'.export(true), {desc = 'Export overwright'})
