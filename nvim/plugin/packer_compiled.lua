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
local package_path_str = "/home/LiamUSR/.cache/nvim/packer_hererocks/2.1.1741730670/share/lua/5.1/?.lua;/home/LiamUSR/.cache/nvim/packer_hererocks/2.1.1741730670/share/lua/5.1/?/init.lua;/home/LiamUSR/.cache/nvim/packer_hererocks/2.1.1741730670/lib/luarocks/rocks-5.1/?.lua;/home/LiamUSR/.cache/nvim/packer_hererocks/2.1.1741730670/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/LiamUSR/.cache/nvim/packer_hererocks/2.1.1741730670/lib/lua/5.1/?.so"
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
  LuaSnip = {
    loaded = true,
    path = "/home/LiamUSR/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/LiamUSR/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/home/LiamUSR/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/LiamUSR/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/LiamUSR/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/home/LiamUSR/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  jsregexp_windows_prebuilt = {
    loaded = true,
    path = "/home/LiamUSR/.local/share/nvim/site/pack/packer/start/jsregexp_windows_prebuilt",
    url = "https://github.com/rgarber11/jsregexp_windows_prebuilt"
  },
  ["lualine.nvim"] = {
    loaded = true,
    path = "/home/LiamUSR/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["neoscroll.nvim"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14neoscroll\frequire\0" },
    loaded = true,
    path = "/home/LiamUSR/.local/share/nvim/site/pack/packer/start/neoscroll.nvim",
    url = "https://github.com/karb94/neoscroll.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\n@\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0" },
    loaded = true,
    path = "/home/LiamUSR/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\n-\0\1\4\1\2\0\5-\1\0\0009\1\0\0019\3\1\0B\1\2\1K\0\1\0\1À\tbody\15lsp_expandÙ\5\1\0\v\0%\0R6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\0005\4\a\0005\5\5\0003\6\4\0=\6\6\5=\5\b\0049\5\t\0009\5\n\0059\5\v\0055\a\r\0009\b\t\0009\b\f\bB\b\1\2=\b\14\a9\b\t\0009\b\15\bB\b\1\2=\b\16\a9\b\t\0009\b\17\b5\n\18\0B\b\2\2=\b\19\a9\b\t\0009\b\20\b)\nüÿB\b\2\2=\b\21\a9\b\t\0009\b\20\b)\n\4\0B\b\2\2=\b\22\aB\5\2\2=\5\t\0049\5\23\0009\5\24\0054\a\3\0005\b\25\0>\b\1\a5\b\26\0>\b\2\a4\b\3\0005\t\27\0>\t\1\b5\t\28\0>\t\2\bB\5\3\2=\5\24\4B\2\2\0019\2\3\0009\2\29\2'\4\30\0005\5 \0004\6\3\0005\a\31\0>\a\1\6=\6\24\5B\2\3\0019\2\3\0009\2\29\2'\4!\0005\5$\0009\6\23\0009\6\24\0064\b\3\0005\t\"\0>\t\1\b4\t\3\0005\n#\0>\n\1\tB\6\3\2=\6\24\5B\2\3\0012\0\0€K\0\1\0\1\0\1\fsources\0\1\0\1\tname\fcmdline\1\0\1\tname\tpath\6:\1\0\1\fsources\0\1\0\1\tname\vbuffer\6/\fcmdline\1\0\1\tname\tpath\1\0\1\tname\vbuffer\1\0\1\tname\fluasnip\1\0\1\tname\rnvim_lsp\fsources\vconfig\n<C-f>\n<C-d>\16scroll_docs\n<Tab>\1\0\1\vselect\2\fconfirm\n<C-h>\21select_prev_item\n<C-n>\1\0\5\n<C-d>\0\n<C-f>\0\n<C-h>\0\n<C-n>\0\n<Tab>\0\21select_next_item\vinsert\vpreset\fmapping\fsnippet\1\0\3\fmapping\0\fsources\0\fsnippet\0\vexpand\1\0\1\vexpand\0\0\nsetup\fluasnip\bcmp\frequire\0" },
    loaded = true,
    path = "/home/LiamUSR/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\2\n¦\2\0\0\4\0\t\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0024\3\0\0=\3\b\2B\0\2\1K\0\1\0\rbuftypes\25user_default_options\1\0\f\vcss_fn\2\16virtualtext\bâ– \bRGB\2\bcss\2\vhsl_fn\1\vrgb_fn\2\rAARRGGBB\2\rRRGGBBAA\2\nnames\1\vRRGGBB\2\tmode\15background\18always_update\1\14filetypes\1\0\3\rbuftypes\0\25user_default_options\0\14filetypes\0\1\2\0\0\6*\nsetup\14colorizer\frequire\0" },
    loaded = true,
    path = "/home/LiamUSR/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua",
    url = "https://github.com/NvChad/nvim-colorizer.lua"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/LiamUSR/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/nvim-tree/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/LiamUSR/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["todo-comments.nvim"] = {
    loaded = true,
    path = "/home/LiamUSR/.local/share/nvim/site/pack/packer/start/todo-comments.nvim",
    url = "https://github.com/folke/todo-comments.nvim"
  },
  ["tokyonight.nvim"] = {
    config = { "\27LJ\2\n:\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\27colorscheme tokyonight\bcmd\bvim\0" },
    loaded = true,
    path = "/home/LiamUSR/.local/share/nvim/site/pack/packer/start/tokyonight.nvim",
    url = "https://github.com/folke/tokyonight.nvim"
  },
  ["vim-table-mode"] = {
    loaded = true,
    path = "/home/LiamUSR/.local/share/nvim/site/pack/packer/start/vim-table-mode",
    url = "https://github.com/dhruvasagar/vim-table-mode"
  },
  ["vim-visual-multi"] = {
    loaded = true,
    path = "/home/LiamUSR/.local/share/nvim/site/pack/packer/start/vim-visual-multi",
    url = "https://github.com/mg979/vim-visual-multi"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: tokyonight.nvim
time([[Config for tokyonight.nvim]], true)
try_loadstring("\27LJ\2\n:\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\27colorscheme tokyonight\bcmd\bvim\0", "config", "tokyonight.nvim")
time([[Config for tokyonight.nvim]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\n-\0\1\4\1\2\0\5-\1\0\0009\1\0\0019\3\1\0B\1\2\1K\0\1\0\1À\tbody\15lsp_expandÙ\5\1\0\v\0%\0R6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\0005\4\a\0005\5\5\0003\6\4\0=\6\6\5=\5\b\0049\5\t\0009\5\n\0059\5\v\0055\a\r\0009\b\t\0009\b\f\bB\b\1\2=\b\14\a9\b\t\0009\b\15\bB\b\1\2=\b\16\a9\b\t\0009\b\17\b5\n\18\0B\b\2\2=\b\19\a9\b\t\0009\b\20\b)\nüÿB\b\2\2=\b\21\a9\b\t\0009\b\20\b)\n\4\0B\b\2\2=\b\22\aB\5\2\2=\5\t\0049\5\23\0009\5\24\0054\a\3\0005\b\25\0>\b\1\a5\b\26\0>\b\2\a4\b\3\0005\t\27\0>\t\1\b5\t\28\0>\t\2\bB\5\3\2=\5\24\4B\2\2\0019\2\3\0009\2\29\2'\4\30\0005\5 \0004\6\3\0005\a\31\0>\a\1\6=\6\24\5B\2\3\0019\2\3\0009\2\29\2'\4!\0005\5$\0009\6\23\0009\6\24\0064\b\3\0005\t\"\0>\t\1\b4\t\3\0005\n#\0>\n\1\tB\6\3\2=\6\24\5B\2\3\0012\0\0€K\0\1\0\1\0\1\fsources\0\1\0\1\tname\fcmdline\1\0\1\tname\tpath\6:\1\0\1\fsources\0\1\0\1\tname\vbuffer\6/\fcmdline\1\0\1\tname\tpath\1\0\1\tname\vbuffer\1\0\1\tname\fluasnip\1\0\1\tname\rnvim_lsp\fsources\vconfig\n<C-f>\n<C-d>\16scroll_docs\n<Tab>\1\0\1\vselect\2\fconfirm\n<C-h>\21select_prev_item\n<C-n>\1\0\5\n<C-d>\0\n<C-f>\0\n<C-h>\0\n<C-n>\0\n<Tab>\0\21select_next_item\vinsert\vpreset\fmapping\fsnippet\1\0\3\fmapping\0\fsources\0\fsnippet\0\vexpand\1\0\1\vexpand\0\0\nsetup\fluasnip\bcmp\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: neoscroll.nvim
time([[Config for neoscroll.nvim]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14neoscroll\frequire\0", "config", "neoscroll.nvim")
time([[Config for neoscroll.nvim]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\n@\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: nvim-colorizer.lua
time([[Config for nvim-colorizer.lua]], true)
try_loadstring("\27LJ\2\n¦\2\0\0\4\0\t\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0024\3\0\0=\3\b\2B\0\2\1K\0\1\0\rbuftypes\25user_default_options\1\0\f\vcss_fn\2\16virtualtext\bâ– \bRGB\2\bcss\2\vhsl_fn\1\vrgb_fn\2\rAARRGGBB\2\rRRGGBBAA\2\nnames\1\vRRGGBB\2\tmode\15background\18always_update\1\14filetypes\1\0\3\rbuftypes\0\25user_default_options\0\14filetypes\0\1\2\0\0\6*\nsetup\14colorizer\frequire\0", "config", "nvim-colorizer.lua")
time([[Config for nvim-colorizer.lua]], false)

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
