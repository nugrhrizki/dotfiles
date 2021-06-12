" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

packadd packer.nvim

try

lua << END
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

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time("Luarocks path setup", true)
local package_path_str = "/home/wright/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/wright/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/wright/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/wright/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/wright/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time("Luarocks path setup", false)
time("try_loadstring definition", true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time("try_loadstring definition", false)
time("Defining packer_plugins", true)
_G.packer_plugins = {
  ["FixCursorHold.nvim"] = {
    config = { "\27LJ\2\n7\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1d\0=\1\2\0K\0\1\0\26cursorhold_updatetime\6g\bvim\0" },
    loaded = true,
    path = "/home/wright/.local/share/nvim/site/pack/packer/start/FixCursorHold.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/home/wright/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  ["goyo.vim"] = {
    loaded = true,
    path = "/home/wright/.local/share/nvim/site/pack/packer/start/goyo.vim"
  },
  ["lsp-status.nvim"] = {
    loaded = true,
    path = "/home/wright/.local/share/nvim/site/pack/packer/start/lsp-status.nvim"
  },
  ["nvim-bufferline.lua"] = {
    config = { "\27LJ\2\n8\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\15bufferline\frequire\0" },
    loaded = true,
    path = "/home/wright/.local/share/nvim/site/pack/packer/start/nvim-bufferline.lua"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0" },
    loaded = true,
    path = "/home/wright/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua"
  },
  ["nvim-compe"] = {
    config = { "\27LJ\2\nû\2\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\vsource\1\0\4\vbuffer\2\rnvim_lua\2\tcalc\2\tpath\2\1\0\f\18documentation\2\19max_menu_width\3d\19max_kind_width\3d\19max_abbr_width\3d\21incomplete_delay\3ê\3\19source_timeout\3¨\2\18throttle_time\3P\14preselect\venable\15min_length\3\1\17autocomplete\2\fenabled\2\ndebug\1\nsetup\ncompe\frequire\0" },
    loaded = true,
    path = "/home/wright/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\n˙\1\0\0\2\0\t\0\0256\0\0\0009\0\1\0)\1#\0=\1\2\0006\0\0\0009\0\1\0005\1\4\0=\1\3\0006\0\0\0009\0\1\0)\1\1\0=\1\5\0006\0\0\0009\0\1\0)\1\1\0=\1\6\0006\0\0\0009\0\1\0)\1\1\0=\1\a\0006\0\0\0009\0\1\0)\1\1\0=\1\b\0K\0\1\0\21nvim_tree_git_hl\21nvim_tree_follow\25nvim_tree_auto_close\24nvim_tree_gitignore\1\4\0\0\t.git\17node_modules\v.cache\21nvim_tree_ignore\20nvim_tree_width\6g\bvim\0" },
    loaded = true,
    path = "/home/wright/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/wright/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/wright/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/wright/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/wright/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  seoul256 = {
    config = { "\27LJ\2\n1\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\18colo seoul256\bcmd\bvim\0" },
    loaded = true,
    path = "/home/wright/.local/share/nvim/site/pack/packer/start/seoul256"
  },
  tagbar = {
    loaded = true,
    path = "/home/wright/.local/share/nvim/site/pack/packer/start/tagbar"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/wright/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["vim-floaterm"] = {
    config = { "\27LJ\2\n¿\1\0\0\2\0\a\1\0216\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\1\0*\1\0\0=\1\3\0006\0\0\0009\0\1\0*\1\0\0=\1\4\0006\0\0\0009\0\1\0)\1\0\0=\1\5\0006\0\0\0009\0\1\0)\1\1\0=\1\6\0K\0\1\0\23floaterm_autoclose\19floaterm_title\20floaterm_height\19floaterm_width\24floaterm_autoinsert\6g\bvimµÊÃô\19ô≥¶ˇ\3\0" },
    loaded = true,
    path = "/home/wright/.local/share/nvim/site/pack/packer/start/vim-floaterm"
  },
  ["vim-matchup"] = {
    config = { "\27LJ\2\nN\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\0\1\vmethod\npopup!matchup_matchparen_offscreen\6g\bvim\0" },
    loaded = true,
    path = "/home/wright/.local/share/nvim/site/pack/packer/start/vim-matchup"
  },
  ["vim-polyglot"] = {
    loaded = true,
    path = "/home/wright/.local/share/nvim/site/pack/packer/start/vim-polyglot"
  }
}

time("Defining packer_plugins", false)
-- Config for: nvim-bufferline.lua
time("Config for nvim-bufferline.lua", true)
try_loadstring("\27LJ\2\n8\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\15bufferline\frequire\0", "config", "nvim-bufferline.lua")
time("Config for nvim-bufferline.lua", false)
-- Config for: FixCursorHold.nvim
time("Config for FixCursorHold.nvim", true)
try_loadstring("\27LJ\2\n7\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1d\0=\1\2\0K\0\1\0\26cursorhold_updatetime\6g\bvim\0", "config", "FixCursorHold.nvim")
time("Config for FixCursorHold.nvim", false)
-- Config for: nvim-compe
time("Config for nvim-compe", true)
try_loadstring("\27LJ\2\nû\2\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\vsource\1\0\4\vbuffer\2\rnvim_lua\2\tcalc\2\tpath\2\1\0\f\18documentation\2\19max_menu_width\3d\19max_kind_width\3d\19max_abbr_width\3d\21incomplete_delay\3ê\3\19source_timeout\3¨\2\18throttle_time\3P\14preselect\venable\15min_length\3\1\17autocomplete\2\fenabled\2\ndebug\1\nsetup\ncompe\frequire\0", "config", "nvim-compe")
time("Config for nvim-compe", false)
-- Config for: vim-floaterm
time("Config for vim-floaterm", true)
try_loadstring("\27LJ\2\n¿\1\0\0\2\0\a\1\0216\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\1\0*\1\0\0=\1\3\0006\0\0\0009\0\1\0*\1\0\0=\1\4\0006\0\0\0009\0\1\0)\1\0\0=\1\5\0006\0\0\0009\0\1\0)\1\1\0=\1\6\0K\0\1\0\23floaterm_autoclose\19floaterm_title\20floaterm_height\19floaterm_width\24floaterm_autoinsert\6g\bvimµÊÃô\19ô≥¶ˇ\3\0", "config", "vim-floaterm")
time("Config for vim-floaterm", false)
-- Config for: seoul256
time("Config for seoul256", true)
try_loadstring("\27LJ\2\n1\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\18colo seoul256\bcmd\bvim\0", "config", "seoul256")
time("Config for seoul256", false)
-- Config for: nvim-tree.lua
time("Config for nvim-tree.lua", true)
try_loadstring("\27LJ\2\n˙\1\0\0\2\0\t\0\0256\0\0\0009\0\1\0)\1#\0=\1\2\0006\0\0\0009\0\1\0005\1\4\0=\1\3\0006\0\0\0009\0\1\0)\1\1\0=\1\5\0006\0\0\0009\0\1\0)\1\1\0=\1\6\0006\0\0\0009\0\1\0)\1\1\0=\1\a\0006\0\0\0009\0\1\0)\1\1\0=\1\b\0K\0\1\0\21nvim_tree_git_hl\21nvim_tree_follow\25nvim_tree_auto_close\24nvim_tree_gitignore\1\4\0\0\t.git\17node_modules\v.cache\21nvim_tree_ignore\20nvim_tree_width\6g\bvim\0", "config", "nvim-tree.lua")
time("Config for nvim-tree.lua", false)
-- Config for: gitsigns.nvim
time("Config for gitsigns.nvim", true)
try_loadstring("\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time("Config for gitsigns.nvim", false)
-- Config for: nvim-colorizer.lua
time("Config for nvim-colorizer.lua", true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0", "config", "nvim-colorizer.lua")
time("Config for nvim-colorizer.lua", false)
-- Config for: vim-matchup
time("Config for vim-matchup", true)
try_loadstring("\27LJ\2\nN\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\0\1\vmethod\npopup!matchup_matchparen_offscreen\6g\bvim\0", "config", "vim-matchup")
time("Config for vim-matchup", false)
if should_profile then save_profiles() end

END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
