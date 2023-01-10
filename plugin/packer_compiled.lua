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
    config = { "\27LJ\2\nä\14\0\0\b\0=\0I6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0005\4\5\0004\5\0\0=\5\6\4=\4\a\3=\3\b\0025\3\t\0=\3\n\0025\3\v\0004\4\0\0=\4\f\3=\3\r\0024\3\0\0=\3\14\0025\3\15\0004\4\0\0=\4\16\3=\3\17\0025\3\18\0005\4\19\0=\4\20\3=\3\21\0025\3\22\0004\4\0\0=\4\23\0034\4\0\0=\4\24\3=\3\25\0025\3\26\0=\3\27\0025\3\29\0005\4\28\0=\4\30\0035\4\31\0005\5 \0005\6\"\0005\a!\0=\a#\0065\a$\0=\a%\6=\6\24\5=\5&\4=\4'\3=\3(\0025\3*\0005\4)\0=\4+\0035\4,\0005\5-\0=\5.\0045\5/\0005\0060\0=\6\27\0055\0061\0=\0062\5=\0053\4=\4\20\0035\0044\0=\0045\3=\0036\0025\0037\0=\0038\0025\0039\0005\4:\0=\4;\3=\3<\2B\0\2\1K\0\1\0\blog\ntypes\1\0\5\ball\1\fprofile\1\15copy_paste\1\bgit\1\vconfig\1\1\0\2\rtruncate\1\venable\1\ntrash\1\0\2\bcmd\ntrash\20require_confirm\2\rrenderer\18special_files\1\4\0\0\14README.md\rMakefile\rMAKEFILE\vglyphs\vfolder\1\0\b\17arrow_closed\bÔë†\fdefault\bÓóø\15arrow_open\bÔëº\15empty_open\bÔÑï\fsymlink\bÔíÇ\topen\bÓóæ\nempty\bÔÑî\17symlink_open\bÓóæ\1\0\a\14untracked\b‚òÖ\fignored\b‚óå\frenamed\b‚ûú\runmerged\bÓúß\vstaged\b‚úì\fdeleted\bÔëò\runstaged\bÔëÑ\1\0\2\fsymlink\5\fdefault\5\tshow\1\0\4\vfolder\2\bgit\2\tfile\2\17folder_arrow\2\1\0\2\fpadding\6 \18symlink_arrow\t >> \19indent_markers\1\0\5\16group_empty\2\17add_trailing\2\25root_folder_modifier\a:~\27highlight_opened_files\ticon\18highlight_git\2\1\0\1\venable\2\factions\14open_file\18window_picker\fbuftype\1\4\0\0\vnofile\rterminal\thelp\rfiletype\1\0\0\1\a\0\0\vnotify\vpacker\aqf\tdiff\rfugitive\18fugitiveblame\1\0\2\nchars)ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890\venable\2\1\0\2\17quit_on_open\2\18resize_window\1\15change_dir\1\0\0\1\0\2\venable\2\vglobal\1\bgit\1\0\3\vignore\2\ftimeout\3ê\3\venable\2\ffilters\fexclude\vcustom\1\0\1\rdotfiles\1\16diagnostics\nicons\1\0\4\thint\bÔÅ™\tinfo\bÔÅö\fwarning\bÔÅ±\nerror\bÔÅó\1\0\2\venable\1\17show_on_dirs\1\16system_open\targs\1\0\0\23ignore_ft_on_setup\24update_focused_file\16ignore_list\1\0\2\15update_cwd\1\venable\1\23hijack_directories\1\0\2\venable\2\14auto_open\2\tview\rmappings\tlist\1\0\1\16custom_only\1\1\0\6\19relativenumber\1\15signcolumn\byes\nwidth\3\30 preserve_window_proportions\1\tside\tleft\vnumber\1\1\0\f\28create_in_closed_folder\1\20respect_buf_cwd\2\15update_cwd\1\fsort_by\tname\16open_on_tab\1\18open_on_setup\1\27ignore_buffer_on_setup\1'hijack_unnamed_buffer_when_opening\1\17hijack_netrw\2\18hijack_cursor\1\18disable_netrw\1\25auto_reload_on_write\2\nsetup\14nvim-tree\frequire\0" },
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
    config = { "\27LJ\2\n˘\1\0\1\r\0\14\0*'\1\0\0\n\0\0\0X\2\15Ä\18\4\0\0009\2\1\0'\5\2\0'\6\3\0B\2\4\2\18\4\2\0009\2\1\2'\5\4\0'\6\0\0B\2\4\2\18\4\2\0009\2\5\2B\2\2\2\18\1\2\0X\2\15Ä)\2\1\0)\3\4\0)\4\1\0M\2\vÄ\18\6\1\0006\a\6\0009\a\a\a6\t\b\0009\t\t\t)\vA\0)\fZ\0B\t\3\0A\a\0\2&\1\a\6O\2ı\1276\2\n\0006\4\v\0009\4\f\4B\4\1\0A\2\0\2'\3\r\0\18\4\1\0&\2\4\2L\2\2\0\6-\ttime\aos\rtostring\vrandom\tmath\tchar\vstring\nlower\19[^A-Za-z0-9-_]\6_\6 \tgsub\5ü\1\0\1\t\0\b\0\0255\1\1\0009\2\0\0=\2\0\0019\2\2\0=\2\2\0019\2\3\0=\2\3\0019\2\4\0\n\2\0\0X\2\14Ä6\2\5\0009\2\6\0029\4\4\0B\2\2\2)\3\0\0\1\3\2\0X\2\aÄ6\2\a\0009\4\4\0B\2\2\4H\5\1Ä<\6\5\1F\5\3\3R\5˝\127L\1\2\0\npairs\17table_length\tutil\rmetadata\ttags\faliases\1\0\0\aid©\1\1\0\4\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0023\3\6\0=\3\a\0023\3\b\0=\3\t\2B\0\2\1K\0\1\0\26note_frontmatter_func\0\17note_id_func\0\15completion\1\0\1\rnvim_cmp\2\1\0\1\bdir\23~/Documents/notes/\nsetup\robsidian\frequire\0" },
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
    config = { "\27LJ\2\nÇ\6\0\0\6\0 \0#6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0005\4\a\0=\4\b\3=\3\t\0025\3\v\0005\4\n\0=\4\f\0035\4\r\0=\4\14\0035\4\15\0=\4\16\0035\4\17\0=\4\18\0035\4\20\0005\5\19\0=\5\21\0045\5\22\0=\5\23\0045\5\24\0=\5\25\0045\5\26\0=\5\27\4=\4\28\3=\3\29\0025\3\30\0=\3\31\2B\0\2\1K\0\1\0\vkeymap\1\0\5\tquit\6q\20toggle_metadata\6m\14edit_task\aee\18complete_task\acc\16delete_task\add\15highlights\15priorities\6D\1\0\3\abg\tNONE\nstyle\tbold\afg\tcyan\6C\1\0\3\abg\tNONE\nstyle\tbold\afg\vyellow\6B\1\0\3\abg\tNONE\nstyle\tbold\afg\fmagenta\6A\1\0\0\1\0\3\abg\tNONE\nstyle\tbold\afg\ngreen\14done_task\1\0\3\abg\tNONE\nstyle\tNONE\afg\tgray\tdate\1\0\3\abg\tNONE\nstyle\14underline\afg\tNONE\fcontext\1\0\3\abg\tNONE\nstyle\tNONE\afg\tcyan\fproject\1\0\0\1\0\3\abg\tNONE\nstyle\tNONE\afg\fmagenta\fcapture\25alternative_priority\1\0\5\6E\14next week\6D\14this week\6C\ntoday\6B\tnext\6A\bnow\1\0\3\vprompt\a> \rposition\b50%\nwidth\b75%\fsidebar\1\0\2\rposition\nright\nwidth\0032\1\0\1\14todo_file'~/Dropbox/Apps/Simpletask/todo.txt\nsetup\17todotxt-nvim\frequire\0" },
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
  }
}

time([[Defining packer_plugins]], false)
-- Config for: obsidian.nvim
time([[Config for obsidian.nvim]], true)
try_loadstring("\27LJ\2\n˘\1\0\1\r\0\14\0*'\1\0\0\n\0\0\0X\2\15Ä\18\4\0\0009\2\1\0'\5\2\0'\6\3\0B\2\4\2\18\4\2\0009\2\1\2'\5\4\0'\6\0\0B\2\4\2\18\4\2\0009\2\5\2B\2\2\2\18\1\2\0X\2\15Ä)\2\1\0)\3\4\0)\4\1\0M\2\vÄ\18\6\1\0006\a\6\0009\a\a\a6\t\b\0009\t\t\t)\vA\0)\fZ\0B\t\3\0A\a\0\2&\1\a\6O\2ı\1276\2\n\0006\4\v\0009\4\f\4B\4\1\0A\2\0\2'\3\r\0\18\4\1\0&\2\4\2L\2\2\0\6-\ttime\aos\rtostring\vrandom\tmath\tchar\vstring\nlower\19[^A-Za-z0-9-_]\6_\6 \tgsub\5ü\1\0\1\t\0\b\0\0255\1\1\0009\2\0\0=\2\0\0019\2\2\0=\2\2\0019\2\3\0=\2\3\0019\2\4\0\n\2\0\0X\2\14Ä6\2\5\0009\2\6\0029\4\4\0B\2\2\2)\3\0\0\1\3\2\0X\2\aÄ6\2\a\0009\4\4\0B\2\2\4H\5\1Ä<\6\5\1F\5\3\3R\5˝\127L\1\2\0\npairs\17table_length\tutil\rmetadata\ttags\faliases\1\0\0\aid©\1\1\0\4\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0023\3\6\0=\3\a\0023\3\b\0=\3\t\2B\0\2\1K\0\1\0\26note_frontmatter_func\0\17note_id_func\0\15completion\1\0\1\rnvim_cmp\2\1\0\1\bdir\23~/Documents/notes/\nsetup\robsidian\frequire\0", "config", "obsidian.nvim")
time([[Config for obsidian.nvim]], false)
-- Config for: todotxt.nvim
time([[Config for todotxt.nvim]], true)
try_loadstring("\27LJ\2\nÇ\6\0\0\6\0 \0#6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0005\4\a\0=\4\b\3=\3\t\0025\3\v\0005\4\n\0=\4\f\0035\4\r\0=\4\14\0035\4\15\0=\4\16\0035\4\17\0=\4\18\0035\4\20\0005\5\19\0=\5\21\0045\5\22\0=\5\23\0045\5\24\0=\5\25\0045\5\26\0=\5\27\4=\4\28\3=\3\29\0025\3\30\0=\3\31\2B\0\2\1K\0\1\0\vkeymap\1\0\5\tquit\6q\20toggle_metadata\6m\14edit_task\aee\18complete_task\acc\16delete_task\add\15highlights\15priorities\6D\1\0\3\abg\tNONE\nstyle\tbold\afg\tcyan\6C\1\0\3\abg\tNONE\nstyle\tbold\afg\vyellow\6B\1\0\3\abg\tNONE\nstyle\tbold\afg\fmagenta\6A\1\0\0\1\0\3\abg\tNONE\nstyle\tbold\afg\ngreen\14done_task\1\0\3\abg\tNONE\nstyle\tNONE\afg\tgray\tdate\1\0\3\abg\tNONE\nstyle\14underline\afg\tNONE\fcontext\1\0\3\abg\tNONE\nstyle\tNONE\afg\tcyan\fproject\1\0\0\1\0\3\abg\tNONE\nstyle\tNONE\afg\fmagenta\fcapture\25alternative_priority\1\0\5\6E\14next week\6D\14this week\6C\ntoday\6B\tnext\6A\bnow\1\0\3\vprompt\a> \rposition\b50%\nwidth\b75%\fsidebar\1\0\2\rposition\nright\nwidth\0032\1\0\1\14todo_file'~/Dropbox/Apps/Simpletask/todo.txt\nsetup\17todotxt-nvim\frequire\0", "config", "todotxt.nvim")
time([[Config for todotxt.nvim]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\nä\14\0\0\b\0=\0I6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0005\4\5\0004\5\0\0=\5\6\4=\4\a\3=\3\b\0025\3\t\0=\3\n\0025\3\v\0004\4\0\0=\4\f\3=\3\r\0024\3\0\0=\3\14\0025\3\15\0004\4\0\0=\4\16\3=\3\17\0025\3\18\0005\4\19\0=\4\20\3=\3\21\0025\3\22\0004\4\0\0=\4\23\0034\4\0\0=\4\24\3=\3\25\0025\3\26\0=\3\27\0025\3\29\0005\4\28\0=\4\30\0035\4\31\0005\5 \0005\6\"\0005\a!\0=\a#\0065\a$\0=\a%\6=\6\24\5=\5&\4=\4'\3=\3(\0025\3*\0005\4)\0=\4+\0035\4,\0005\5-\0=\5.\0045\5/\0005\0060\0=\6\27\0055\0061\0=\0062\5=\0053\4=\4\20\0035\0044\0=\0045\3=\0036\0025\0037\0=\0038\0025\0039\0005\4:\0=\4;\3=\3<\2B\0\2\1K\0\1\0\blog\ntypes\1\0\5\ball\1\fprofile\1\15copy_paste\1\bgit\1\vconfig\1\1\0\2\rtruncate\1\venable\1\ntrash\1\0\2\bcmd\ntrash\20require_confirm\2\rrenderer\18special_files\1\4\0\0\14README.md\rMakefile\rMAKEFILE\vglyphs\vfolder\1\0\b\17arrow_closed\bÔë†\fdefault\bÓóø\15arrow_open\bÔëº\15empty_open\bÔÑï\fsymlink\bÔíÇ\topen\bÓóæ\nempty\bÔÑî\17symlink_open\bÓóæ\1\0\a\14untracked\b‚òÖ\fignored\b‚óå\frenamed\b‚ûú\runmerged\bÓúß\vstaged\b‚úì\fdeleted\bÔëò\runstaged\bÔëÑ\1\0\2\fsymlink\5\fdefault\5\tshow\1\0\4\vfolder\2\bgit\2\tfile\2\17folder_arrow\2\1\0\2\fpadding\6 \18symlink_arrow\t >> \19indent_markers\1\0\5\16group_empty\2\17add_trailing\2\25root_folder_modifier\a:~\27highlight_opened_files\ticon\18highlight_git\2\1\0\1\venable\2\factions\14open_file\18window_picker\fbuftype\1\4\0\0\vnofile\rterminal\thelp\rfiletype\1\0\0\1\a\0\0\vnotify\vpacker\aqf\tdiff\rfugitive\18fugitiveblame\1\0\2\nchars)ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890\venable\2\1\0\2\17quit_on_open\2\18resize_window\1\15change_dir\1\0\0\1\0\2\venable\2\vglobal\1\bgit\1\0\3\vignore\2\ftimeout\3ê\3\venable\2\ffilters\fexclude\vcustom\1\0\1\rdotfiles\1\16diagnostics\nicons\1\0\4\thint\bÔÅ™\tinfo\bÔÅö\fwarning\bÔÅ±\nerror\bÔÅó\1\0\2\venable\1\17show_on_dirs\1\16system_open\targs\1\0\0\23ignore_ft_on_setup\24update_focused_file\16ignore_list\1\0\2\15update_cwd\1\venable\1\23hijack_directories\1\0\2\venable\2\14auto_open\2\tview\rmappings\tlist\1\0\1\16custom_only\1\1\0\6\19relativenumber\1\15signcolumn\byes\nwidth\3\30 preserve_window_proportions\1\tside\tleft\vnumber\1\1\0\f\28create_in_closed_folder\1\20respect_buf_cwd\2\15update_cwd\1\fsort_by\tname\16open_on_tab\1\18open_on_setup\1\27ignore_buffer_on_setup\1'hijack_unnamed_buffer_when_opening\1\17hijack_netrw\2\18hijack_cursor\1\18disable_netrw\1\25auto_reload_on_write\2\nsetup\14nvim-tree\frequire\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
try_loadstring("\27LJ\2\n;\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14which-key\frequire\0", "config", "which-key.nvim")
time([[Config for which-key.nvim]], false)
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
vim.cmd [[au FileType nextflow ++once lua require("packer.load")({'nextflow-vim'}, { ft = "nextflow" }, _G.packer_plugins)]]
vim.cmd [[au FileType snakemake ++once lua require("packer.load")({'snakefmt', 'snakemake'}, { ft = "snakemake" }, _G.packer_plugins)]]
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
