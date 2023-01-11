-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/cristian/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/cristian/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/cristian/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/cristian/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/cristian/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    loaded = true,
    path = "/home/cristian/.local/share/nvim/site/pack/packer/start/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  LuaSnip = {
    loaded = true,
    path = "/home/cristian/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/cristian/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/home/cristian/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["fidget.nvim"] = {
    loaded = true,
    path = "/home/cristian/.local/share/nvim/site/pack/packer/start/fidget.nvim",
    url = "https://github.com/j-hui/fidget.nvim"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "/home/cristian/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["howdoi.nvim"] = {
    loaded = true,
    path = "/home/cristian/.local/share/nvim/site/pack/packer/start/howdoi.nvim",
    url = "https://github.com/zane-/howdoi.nvim"
  },
  ["indent-blankline.nvim"] = {
    loaded = true,
    path = "/home/cristian/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["lualine.nvim"] = {
    loaded = true,
    path = "/home/cristian/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/home/cristian/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "/home/cristian/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["neodev.nvim"] = {
    loaded = true,
    path = "/home/cristian/.local/share/nvim/site/pack/packer/start/neodev.nvim",
    url = "https://github.com/folke/neodev.nvim"
  },
  ["nextflow-vim"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/cristian/.local/share/nvim/site/pack/packer/opt/nextflow-vim",
    url = "https://github.com/Mxrcon/nextflow-vim"
  },
  ["nui.nvim"] = {
    loaded = true,
    path = "/home/cristian/.local/share/nvim/site/pack/packer/start/nui.nvim",
    url = "https://github.com/MunifTanjim/nui.nvim"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/home/cristian/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/cristian/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    loaded = true,
    path = "/home/cristian/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/nvim-tree/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/cristian/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-textobjects"] = {
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/cristian/.local/share/nvim/site/pack/packer/opt/nvim-treesitter-textobjects",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/cristian/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/nvim-tree/nvim-web-devicons"
  },
  ["obsidian.nvim"] = {
    config = { "\27LJ\2\nù\1\0\1\r\0\14\0*'\1\0\0\n\0\0\0X\2\15€\18\4\0\0009\2\1\0'\5\2\0'\6\3\0B\2\4\2\18\4\2\0009\2\1\2'\5\4\0'\6\0\0B\2\4\2\18\4\2\0009\2\5\2B\2\2\2\18\1\2\0X\2\15€)\2\1\0)\3\4\0)\4\1\0M\2\v€\18\6\1\0006\a\6\0009\a\a\a6\t\b\0009\t\t\t)\vA\0)\fZ\0B\t\3\0A\a\0\2&\1\a\6O\2õ\1276\2\n\0006\4\v\0009\4\f\4B\4\1\0A\2\0\2'\3\r\0\18\4\1\0&\2\4\2L\2\2\0\6-\ttime\aos\rtostring\vrandom\tmath\tchar\vstring\nlower\19[^A-Za-z0-9-_]\6_\6 \tgsub\5Ÿ\1\0\1\t\0\b\0\0255\1\1\0009\2\0\0=\2\0\0019\2\2\0=\2\2\0019\2\3\0=\2\3\0019\2\4\0\n\2\0\0X\2\14€6\2\5\0009\2\6\0029\4\4\0B\2\2\2)\3\0\0\1\3\2\0X\2\a€6\2\a\0009\4\4\0B\2\2\4H\5\1€<\6\5\1F\5\3\3R\5ý\127L\1\2\0\npairs\17table_length\tutil\rmetadata\ttags\faliases\1\0\0\aid©\1\1\0\4\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0023\3\6\0=\3\a\0023\3\b\0=\3\t\2B\0\2\1K\0\1\0\26note_frontmatter_func\0\17note_id_func\0\15completion\1\0\1\rnvim_cmp\2\1\0\1\bdir\23~/Documents/notes/\nsetup\robsidian\frequire\0" },
    loaded = true,
    path = "/home/cristian/.local/share/nvim/site/pack/packer/start/obsidian.nvim",
    url = "https://github.com/epwalsh/obsidian.nvim"
  },
  ["onedark.nvim"] = {
    loaded = true,
    path = "/home/cristian/.local/share/nvim/site/pack/packer/start/onedark.nvim",
    url = "https://github.com/navarasu/onedark.nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/cristian/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/cristian/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  snakefmt = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/cristian/.local/share/nvim/site/pack/packer/opt/snakefmt",
    url = "https://github.com/snakemake/snakefmt"
  },
  snakemake = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/cristian/.local/share/nvim/site/pack/packer/opt/snakemake",
    url = "https://github.com/snakemake/snakemake"
  },
  ["telescope-fzf-native.nvim"] = {
    cond = { true },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/home/cristian/.local/share/nvim/site/pack/packer/opt/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/cristian/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["todotxt.nvim"] = {
    config = { "\27LJ\2\n‚\6\0\0\6\0 \0#6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0005\4\a\0=\4\b\3=\3\t\0025\3\v\0005\4\n\0=\4\f\0035\4\r\0=\4\14\0035\4\15\0=\4\16\0035\4\17\0=\4\18\0035\4\20\0005\5\19\0=\5\21\0045\5\22\0=\5\23\0045\5\24\0=\5\25\0045\5\26\0=\5\27\4=\4\28\3=\3\29\0025\3\30\0=\3\31\2B\0\2\1K\0\1\0\vkeymap\1\0\5\14edit_task\aee\20toggle_metadata\6m\tquit\6q\18complete_task\acc\16delete_task\add\15highlights\15priorities\6D\1\0\3\afg\tcyan\nstyle\tbold\abg\tNONE\6C\1\0\3\afg\vyellow\nstyle\tbold\abg\tNONE\6B\1\0\3\afg\fmagenta\nstyle\tbold\abg\tNONE\6A\1\0\0\1\0\3\afg\ngreen\nstyle\tbold\abg\tNONE\14done_task\1\0\3\afg\tgray\nstyle\tNONE\abg\tNONE\tdate\1\0\3\afg\tNONE\nstyle\14underline\abg\tNONE\fcontext\1\0\3\afg\tcyan\nstyle\tNONE\abg\tNONE\fproject\1\0\0\1\0\3\afg\fmagenta\nstyle\tNONE\abg\tNONE\fcapture\25alternative_priority\1\0\5\6C\ntoday\6B\tnext\6A\bnow\6E\14next week\6D\14this week\1\0\3\nwidth\b75%\rposition\b50%\vprompt\a> \fsidebar\1\0\2\rposition\nright\nwidth\0032\1\0\1\14todo_file'~/Dropbox/Apps/Simpletask/todo.txt\nsetup\17todotxt-nvim\frequire\0" },
    loaded = true,
    path = "/home/cristian/.local/share/nvim/site/pack/packer/start/todotxt.nvim",
    url = "https://github.com/arnarg/todotxt.nvim"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/cristian/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-rhubarb"] = {
    loaded = true,
    path = "/home/cristian/.local/share/nvim/site/pack/packer/start/vim-rhubarb",
    url = "https://github.com/tpope/vim-rhubarb"
  },
  ["vim-sleuth"] = {
    loaded = true,
    path = "/home/cristian/.local/share/nvim/site/pack/packer/start/vim-sleuth",
    url = "https://github.com/tpope/vim-sleuth"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\2\n;\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14which-key\frequire\0" },
    loaded = true,
    path = "/home/cristian/.local/share/nvim/site/pack/packer/start/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  },
  ["zen-mode.nvim"] = {
    loaded = true,
    path = "/home/cristian/.local/share/nvim/site/pack/packer/start/zen-mode.nvim",
    url = "https://github.com/folke/zen-mode.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
try_loadstring("\27LJ\2\n;\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14which-key\frequire\0", "config", "which-key.nvim")
time([[Config for which-key.nvim]], false)
-- Config for: obsidian.nvim
time([[Config for obsidian.nvim]], true)
try_loadstring("\27LJ\2\nù\1\0\1\r\0\14\0*'\1\0\0\n\0\0\0X\2\15€\18\4\0\0009\2\1\0'\5\2\0'\6\3\0B\2\4\2\18\4\2\0009\2\1\2'\5\4\0'\6\0\0B\2\4\2\18\4\2\0009\2\5\2B\2\2\2\18\1\2\0X\2\15€)\2\1\0)\3\4\0)\4\1\0M\2\v€\18\6\1\0006\a\6\0009\a\a\a6\t\b\0009\t\t\t)\vA\0)\fZ\0B\t\3\0A\a\0\2&\1\a\6O\2õ\1276\2\n\0006\4\v\0009\4\f\4B\4\1\0A\2\0\2'\3\r\0\18\4\1\0&\2\4\2L\2\2\0\6-\ttime\aos\rtostring\vrandom\tmath\tchar\vstring\nlower\19[^A-Za-z0-9-_]\6_\6 \tgsub\5Ÿ\1\0\1\t\0\b\0\0255\1\1\0009\2\0\0=\2\0\0019\2\2\0=\2\2\0019\2\3\0=\2\3\0019\2\4\0\n\2\0\0X\2\14€6\2\5\0009\2\6\0029\4\4\0B\2\2\2)\3\0\0\1\3\2\0X\2\a€6\2\a\0009\4\4\0B\2\2\4H\5\1€<\6\5\1F\5\3\3R\5ý\127L\1\2\0\npairs\17table_length\tutil\rmetadata\ttags\faliases\1\0\0\aid©\1\1\0\4\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0023\3\6\0=\3\a\0023\3\b\0=\3\t\2B\0\2\1K\0\1\0\26note_frontmatter_func\0\17note_id_func\0\15completion\1\0\1\rnvim_cmp\2\1\0\1\bdir\23~/Documents/notes/\nsetup\robsidian\frequire\0", "config", "obsidian.nvim")
time([[Config for obsidian.nvim]], false)
-- Config for: todotxt.nvim
time([[Config for todotxt.nvim]], true)
try_loadstring("\27LJ\2\n‚\6\0\0\6\0 \0#6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0005\4\a\0=\4\b\3=\3\t\0025\3\v\0005\4\n\0=\4\f\0035\4\r\0=\4\14\0035\4\15\0=\4\16\0035\4\17\0=\4\18\0035\4\20\0005\5\19\0=\5\21\0045\5\22\0=\5\23\0045\5\24\0=\5\25\0045\5\26\0=\5\27\4=\4\28\3=\3\29\0025\3\30\0=\3\31\2B\0\2\1K\0\1\0\vkeymap\1\0\5\14edit_task\aee\20toggle_metadata\6m\tquit\6q\18complete_task\acc\16delete_task\add\15highlights\15priorities\6D\1\0\3\afg\tcyan\nstyle\tbold\abg\tNONE\6C\1\0\3\afg\vyellow\nstyle\tbold\abg\tNONE\6B\1\0\3\afg\fmagenta\nstyle\tbold\abg\tNONE\6A\1\0\0\1\0\3\afg\ngreen\nstyle\tbold\abg\tNONE\14done_task\1\0\3\afg\tgray\nstyle\tNONE\abg\tNONE\tdate\1\0\3\afg\tNONE\nstyle\14underline\abg\tNONE\fcontext\1\0\3\afg\tcyan\nstyle\tNONE\abg\tNONE\fproject\1\0\0\1\0\3\afg\fmagenta\nstyle\tNONE\abg\tNONE\fcapture\25alternative_priority\1\0\5\6C\ntoday\6B\tnext\6A\bnow\6E\14next week\6D\14this week\1\0\3\nwidth\b75%\rposition\b50%\vprompt\a> \fsidebar\1\0\2\rposition\nright\nwidth\0032\1\0\1\14todo_file'~/Dropbox/Apps/Simpletask/todo.txt\nsetup\17todotxt-nvim\frequire\0", "config", "todotxt.nvim")
time([[Config for todotxt.nvim]], false)
-- Conditional loads
time([[Conditional loading of telescope-fzf-native.nvim]], true)
  require("packer.load")({"telescope-fzf-native.nvim"}, {}, _G.packer_plugins)
time([[Conditional loading of telescope-fzf-native.nvim]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd nvim-treesitter ]]
vim.cmd [[ packadd nvim-treesitter-textobjects ]]
time([[Sequenced loading]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType snakemake ++once lua require("packer.load")({'snakemake', 'snakefmt'}, { ft = "snakemake" }, _G.packer_plugins)]]
vim.cmd [[au FileType nextflow ++once lua require("packer.load")({'nextflow-vim'}, { ft = "nextflow" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /home/cristian/.local/share/nvim/site/pack/packer/opt/nextflow-vim/ftdetect/nextflow.vim]], true)
vim.cmd [[source /home/cristian/.local/share/nvim/site/pack/packer/opt/nextflow-vim/ftdetect/nextflow.vim]]
time([[Sourcing ftdetect script at: /home/cristian/.local/share/nvim/site/pack/packer/opt/nextflow-vim/ftdetect/nextflow.vim]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
