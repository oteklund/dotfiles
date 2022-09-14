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
local package_path_str = "/home/oteklund/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/oteklund/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/oteklund/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/oteklund/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/oteklund/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
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
    path = "/home/oteklund/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["aerial.nvim"] = {
    config = { "\27LJ\2\n4\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\vaerial\frequire\0" },
    loaded = true,
    path = "/home/oteklund/.local/share/nvim/site/pack/packer/start/aerial.nvim",
    url = "https://github.com/stevearc/aerial.nvim"
  },
  ["alpha-nvim"] = {
    config = { "\27LJ\2\n�\t\0\0\t\0!\1:6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\0019\2\4\0025\3\6\0=\3\5\0025\2\b\0=\2\a\0019\2\3\0019\2\t\0024\3\a\0009\4\n\1'\6\v\0'\a\f\0'\b\r\0B\4\4\2>\4\1\0039\4\n\1'\6\14\0'\a\15\0'\b\16\0B\4\4\2>\4\2\0039\4\n\1'\6\17\0'\a\18\0'\b\19\0B\4\4\2>\4\3\0039\4\n\1'\6\20\0'\a\21\0'\b\22\0B\4\4\2>\4\4\0039\4\n\1'\6\23\0'\a\24\0'\b\25\0B\4\4\2>\4\5\0039\4\n\1'\6\26\0'\a\27\0'\b\28\0B\4\4\0?\4\0\0=\3\5\0025\2\30\0=\2\29\0019\2\31\0009\4 \1B\2\2\1K\0\1\0\vconfig\nsetup\1\0\2\ttype\fpadding\bval\3\25\fpadding <cmd>Telescope oldfiles<cr>\27  list recent files\afh!<cmd>Telescope live_grep<cr>\24  look for words\afw\f:qa<CR>\19  quit NVIM\6q\"<cmd>Telescope find_files<cr>\24  look for files\afF!<cmd>Telescope git_files<cr>\28  look for git files\aff :ene <BAR> startinsert <CR>\18  new file\6e\vbutton\fbuttons\1\0\2\ahl\20DashboardHeader\rposition\vcenter\topts\1\16\0\0&        _                        &        \\`*-.                    &         )  _`-.  ?              &        .  : `. .                &        : _   '  \\               &        ; *` _.   `*-._          &        `-.-'          `-.       &          ;       `       `.     &          :.       .        \\    &          . \\  .   :   .-'   .   &          '  `+.;  ;  '      :   &          :  '  |    ;       ;-. &          ; '   : :`-:     _.`* ;& [bug] .*' /  .*' ; .*`- +'  `*' &       `*-*   `*-*  `*-*'        \bval\vheader\fsection\27alpha.themes.dashboard\nalpha\frequire\r����\4\0" },
    loaded = true,
    path = "/home/oteklund/.local/share/nvim/site/pack/packer/start/alpha-nvim",
    url = "https://github.com/goolord/alpha-nvim"
  },
  catppuccin = {
    config = { "\27LJ\2\n�\4\0\0\6\0\29\0+6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\4\0'\2\5\0B\0\2\0029\0\6\0005\2\a\0005\3\b\0005\4\n\0005\5\t\0=\5\v\0045\5\f\0=\5\r\0045\5\14\0=\5\15\0045\5\16\0=\5\17\4=\4\18\0035\4\20\0005\5\19\0=\5\v\0045\5\21\0=\5\r\0045\5\22\0=\5\15\0045\5\23\0=\5\17\4=\4\24\3=\3\25\2B\0\2\0016\0\4\0'\2\26\0B\0\2\0029\0\6\0004\2\0\0B\0\2\0016\0\0\0009\0\27\0'\2\28\0B\0\2\1K\0\1\0\27colorscheme catppuccin\bcmd*catppuccin.groups.integrations.feline\15native_lsp\15underlines\1\2\0\0\14underline\1\2\0\0\14underline\1\2\0\0\14underline\1\0\0\1\2\0\0\14underline\17virtual_text\16information\1\2\0\0\vitalic\rwarnings\1\2\0\0\vitalic\nhints\1\2\0\0\vitalic\verrors\1\0\0\1\2\0\0\vitalic\1\0\1\fenabled\2\1\0\4\15ts_rainbow\2\15treesitter\2\14telescope\2\rmarkdown\2\nsetup\15catppuccin\frequire\nmocha\23catppuccin_flavour\6g\bvim\0" },
    loaded = true,
    path = "/home/oteklund/.local/share/nvim/site/pack/packer/start/catppuccin",
    url = "https://github.com/catppuccin/nvim"
  },
  ["cinnamon.nvim"] = {
    config = { "\27LJ\2\n�\1\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\6\20default_keymaps\2\18default_delay\3\4\18always_scroll\2\17scroll_limit\3����\15\15max_length\3�\1\18extra_keymaps\2\nsetup\rcinnamon\frequire\0" },
    loaded = true,
    path = "/home/oteklund/.local/share/nvim/site/pack/packer/start/cinnamon.nvim",
    url = "https://github.com/declancm/cinnamon.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/oteklund/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/oteklund/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/oteklund/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["cmp-rg"] = {
    loaded = true,
    path = "/home/oteklund/.local/share/nvim/site/pack/packer/start/cmp-rg",
    url = "https://github.com/lukas-reineke/cmp-rg"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/home/oteklund/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["dressing.nvim"] = {
    config = { "\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rdressing\frequire\0" },
    loaded = true,
    path = "/home/oteklund/.local/share/nvim/site/pack/packer/start/dressing.nvim",
    url = "https://github.com/stevearc/dressing.nvim"
  },
  ["feline.nvim"] = {
    config = { "\27LJ\2\n�\1\0\0\a\0\v\0\0176\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\0005\4\5\0009\5\4\1B\5\1\2=\5\6\0045\5\a\0005\6\b\0=\6\t\5=\5\n\4B\2\2\1K\0\1\0\rprovider\topts\1\0\1\23file_modified_icon\b\1\0\1\tname\14file_info\15components\1\0\0\bget\nsetup*catppuccin.groups.integrations.feline\vfeline\frequire\0" },
    loaded = true,
    path = "/home/oteklund/.local/share/nvim/site/pack/packer/start/feline.nvim",
    url = "https://github.com/feline-nvim/feline.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\nW\0\4\n\1\4\0\14\14\0\3\0X\4\1�4\3\0\0-\4\0\0=\4\0\0036\4\1\0009\4\2\0049\4\3\4\18\6\0\0\18\a\1\0\18\b\2\0\18\t\3\0B\4\5\1K\0\1\0\0�\bset\vkeymap\bvim\vbuffer#\0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\0\0\14next_hunk<\1\0\3\1\4\0\a6\0\0\0009\0\1\0003\2\2\0B\0\2\1'\0\3\0002\0\0�L\0\2\0\1�\r<ignore>\0\rschedule\bvim#\0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\0\0\14prev_hunk<\1\0\3\1\4\0\a6\0\0\0009\0\1\0003\2\2\0B\0\2\1'\0\3\0002\0\0�L\0\2\0\1�\r<ignore>\0\rschedule\bvim(\0\0\3\1\2\0\5-\0\0\0009\0\0\0'\2\1\0B\0\2\1K\0\1\0\1�\6~\rdiffthis�\2\1\1\t\0\21\0+6\1\0\0009\1\1\0019\1\2\0013\2\3\0\18\3\2\0'\5\4\0'\6\5\0003\a\6\0005\b\a\0B\3\5\1\18\3\2\0'\5\4\0'\6\b\0003\a\t\0005\b\n\0B\3\5\1\18\3\2\0005\5\v\0'\6\f\0'\a\r\0B\3\4\1\18\3\2\0'\5\4\0'\6\b\0009\a\14\1B\3\4\1\18\3\2\0'\5\4\0'\6\15\0009\a\16\1B\3\4\1\18\3\2\0'\5\4\0'\6\17\0009\a\18\1B\3\4\1\18\3\2\0'\5\4\0'\6\19\0003\a\20\0B\3\4\0012\0\0�K\0\1\0\0\15<leader>hD\rdiffthis\15<leader>hd\30toggle_current_line_blame\15<leader>hb\17preview_hunk\29:Gitsigns reset_hunk<CR>\15<leader>hr\1\3\0\0\6n\6v\1\0\1\texpr\2\0\15<leader>hp\1\0\1\texpr\2\0\15<leader>hn\6n\0\rgitsigns\vloaded\fpackaged\1\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0003\3\4\0=\3\5\2B\0\2\1K\0\1\0\14on_attach\0\1\0\1\23current_line_blame\2\nsetup\rgitsigns\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/oteklund/.local/share/nvim/site/pack/packer/opt/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["mason.nvim"] = {
    config = { "\27LJ\2\n3\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\nmason\frequire\0" },
    loaded = true,
    path = "/home/oteklund/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["null-ls.nvim"] = {
    config = { "\27LJ\2\n;\0\0\2\0\4\0\0066\0\0\0009\0\1\0009\0\2\0009\0\3\0B\0\1\1K\0\1\0\20formatting_sync\bbuf\blsp\bvim�\1\1\2\a\1\r\0\0259\2\0\0'\4\1\0B\2\2\2\15\0\2\0X\3\19�6\2\2\0009\2\3\0029\2\4\0025\4\5\0-\5\0\0=\5\6\4=\1\a\4B\2\2\0016\2\2\0009\2\3\0029\2\b\2'\4\t\0005\5\n\0-\6\0\0=\6\6\5=\1\a\0053\6\v\0=\6\f\5B\2\3\1K\0\1\0\1�\rcallback\0\1\0\0\16BufWritePre\24nvim_create_autocmd\vbuffer\ngroup\1\0\0\24nvim_clear_autocmds\bapi\bvim\28textDocument/formatting\20supports_method�\4\1\0\n\0\28\0?6\0\0\0'\2\1\0B\0\2\0026\1\2\0009\1\3\0019\1\4\1'\3\5\0004\4\0\0B\1\3\0029\2\6\0005\4\24\0004\5\v\0009\6\a\0009\6\b\0069\6\t\6>\6\1\0059\6\a\0009\6\n\0069\6\v\6>\6\2\0059\6\a\0009\6\f\0069\6\t\6>\6\3\0059\6\a\0009\6\f\0069\6\r\6>\6\4\0059\6\a\0009\6\f\0069\6\14\6>\6\5\0059\6\a\0009\6\f\0069\6\15\0069\6\16\0065\b\18\0005\t\17\0=\t\19\bB\6\2\2>\6\6\0059\6\a\0009\6\20\0069\6\t\6>\6\a\0059\6\a\0009\6\20\0069\6\21\6>\6\b\0059\6\a\0009\6\20\0069\6\22\6>\6\t\0059\6\a\0009\6\20\0069\6\23\6>\6\n\5=\5\25\0043\5\26\0=\5\27\4B\2\2\0012\0\0�K\0\1\0\14on_attach\0\fsources\1\0\0\vstylua\frustfmt\14prettierd\15formatting\15extra_args\1\0\0\1\3\0\0\14--dialect\rpostgres\twith\rsqlfluff\ryamllint\17markdownlint\16diagnostics\fluasnip\15completion\reslint_d\17code_actions\rbuiltins\nsetup\18LspFormatting\24nvim_create_augroup\bapi\bvim\fnull-ls\frequire\0" },
    loaded = true,
    path = "/home/oteklund/.local/share/nvim/site/pack/packer/start/null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\n-\0\1\4\1\2\0\5-\1\0\0009\1\0\0019\3\1\0B\1\2\1K\0\1\0\1�\tbody\15lsp_expand�\1\0\1\3\2\4\0\21-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4�-\1\0\0009\1\1\1B\1\1\1X\1\v�-\1\1\0009\1\2\1B\1\1\2\15\0\1\0X\2\4�-\1\1\0009\1\3\1B\1\1\1X\1\2�\18\1\0\0B\1\1\1K\0\1\0\0�\1�\19expand_or_jump\23expand_or_jumpable\21select_next_item\fvisible�\1\0\1\4\2\4\0\23-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4�-\1\0\0009\1\1\1B\1\1\1X\1\r�-\1\1\0009\1\2\1)\3��B\1\2\2\15\0\1\0X\2\5�-\1\1\0009\1\3\1)\3��B\1\2\1X\1\2�\18\1\0\0B\1\1\1K\0\1\0\0�\1�\tjump\rjumpable\21select_prev_item\fvisible�\5\1\0\f\0+\0d6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\0005\4\a\0005\5\5\0003\6\4\0=\6\6\5=\5\b\0044\5\4\0005\6\t\0>\6\1\0055\6\n\0>\6\2\0055\6\v\0>\6\3\5=\5\f\0044\5\3\0005\6\r\0>\6\1\5>\5\1\0049\5\14\0009\5\15\0059\5\16\0055\a\18\0009\b\14\0009\b\17\b)\n��B\b\2\2=\b\19\a9\b\14\0009\b\17\b)\n\4\0B\b\2\2=\b\20\a9\b\14\0009\b\21\bB\b\1\2=\b\22\a9\b\14\0009\b\23\bB\b\1\2=\b\24\a9\b\14\0009\b\25\b5\n\26\0B\b\2\2=\b\27\a9\b\14\0003\n\28\0005\v\29\0B\b\3\2=\b\30\a9\b\14\0003\n\31\0005\v \0B\b\3\2=\b!\aB\5\2\2=\5\14\4B\2\2\0019\2\3\0009\2\"\2'\4#\0005\5$\0009\6\14\0009\6\15\0069\6\"\6B\6\1\2=\6\14\0054\6\3\0005\a%\0>\a\1\6=\6\f\5B\2\3\0019\2\3\0009\2\"\2'\4&\0005\5'\0009\6\14\0009\6\15\0069\6\"\6B\6\1\2=\6\14\0059\6(\0009\6\f\0064\b\3\0005\t)\0>\t\1\b4\t\3\0005\n*\0>\n\1\tB\6\3\2=\6\f\5B\2\3\0012\0\0�K\0\1\0\1\0\1\tname\fcmdline\1\0\1\tname\tpath\vconfig\1\0\0\6:\1\0\1\tname\vbuffer\1\0\0\6/\fcmdline\f<S-Tab>\1\3\0\0\6i\6s\0\n<Tab>\1\3\0\0\6i\6s\0\t<CR>\1\0\1\vselect\2\fconfirm\n<C-e>\nabort\14<C-Space>\rcomplete\n<C-f>\n<C-b>\1\0\0\16scroll_docs\vinsert\vpreset\fmapping\1\0\1\tname\vbuffer\fsources\1\0\1\tname\arg\1\0\1\tname\rnvim_lsp\1\0\1\tname\fluasnip\fsnippet\1\0\0\vexpand\1\0\0\0\nsetup\fluasnip\bcmp\frequire\0" },
    loaded = true,
    path = "/home/oteklund/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0" },
    loaded = true,
    path = "/home/oteklund/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua",
    url = "https://github.com/norcalli/nvim-colorizer.lua"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/oteklund/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n�\1\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\3B\1\2\1K\0\1\0\14highlight\1\0\1\venable\2\frainbow\1\0\0\1\0\1\venable\2\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/home/oteklund/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    config = { "\27LJ\2\nO\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\fdefault\2\nsetup\22nvim-web-devicons\frequire\0" },
    loaded = true,
    path = "/home/oteklund/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/oteklund/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/oteklund/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["prettier.nvim"] = {
    config = { "\27LJ\2\n�\1\0\0\5\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\4\0005\4\3\0=\4\5\3B\1\2\1K\0\1\0\14filetypes\1\0\0\1\r\0\0\bcss\fgraphql\thtml\15javascript\20javascriptreact\tjson\tless\rmarkdown\tscss\15typescript\20typescriptreact\tyaml\nsetup\rprettier\frequire\0" },
    loaded = true,
    path = "/home/oteklund/.local/share/nvim/site/pack/packer/start/prettier.nvim",
    url = "https://github.com/MunifTanjim/prettier.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/home/oteklund/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\n�\3\0\0\t\0!\0+6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\0005\4\21\0005\5\17\0005\6\r\0005\a\5\0009\b\4\1=\b\6\a9\b\a\1=\b\b\a9\b\t\1=\b\n\a9\b\v\1=\b\f\a=\a\14\0065\a\15\0009\b\4\1=\b\6\a9\b\a\1=\b\b\a=\a\16\6=\6\18\0055\6\19\0=\6\20\5=\5\22\0045\5\24\0005\6\23\0=\6\25\0055\6\26\0=\6\27\0055\6\28\0=\6\29\5=\5\30\4B\2\2\0019\2\31\0'\4 \0B\2\2\1K\0\1\0\bfzf\19load_extension\fpickers\fbuffers\1\0\1\ntheme\bivy\14git_files\1\0\1\ntheme\bivy\15find_files\1\0\0\1\0\2\ntheme\bivy\vhidden\2\rdefaults\1\0\0\17path_display\1\2\1\0\rtruncate\rtruncate\3\3\rmappings\1\0\0\6n\1\0\0\6i\1\0\0\t<up>\23cycle_history_prev\v<down>\23cycle_history_next\n<c-k>\28move_selection_previous\n<c-j>\1\0\0\24move_selection_next\nsetup\22telescope.actions\14telescope\frequire\0" },
    loaded = true,
    path = "/home/oteklund/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/home/oteklund/.local/share/nvim/site/pack/packer/start/vim-commentary",
    url = "https://github.com/tpope/vim-commentary"
  },
  ["vim-fugitive"] = {
    config = { "\27LJ\2\nq\0\0\6\0\a\0\t6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\1K\0\1\0\1\0\1\tdesc\18open fugitive\15<cmd>G<cr>\15<leader>gg\6n\20nvim_set_keymap\bapi\bvim\0" },
    loaded = true,
    path = "/home/oteklund/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/home/oteklund/.local/share/nvim/site/pack/packer/start/vim-repeat",
    url = "https://github.com/tpope/vim-repeat"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/oteklund/.local/share/nvim/site/pack/packer/start/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nvim-colorizer.lua
time([[Config for nvim-colorizer.lua]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0", "config", "nvim-colorizer.lua")
time([[Config for nvim-colorizer.lua]], false)
-- Config for: catppuccin
time([[Config for catppuccin]], true)
try_loadstring("\27LJ\2\n�\4\0\0\6\0\29\0+6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\4\0'\2\5\0B\0\2\0029\0\6\0005\2\a\0005\3\b\0005\4\n\0005\5\t\0=\5\v\0045\5\f\0=\5\r\0045\5\14\0=\5\15\0045\5\16\0=\5\17\4=\4\18\0035\4\20\0005\5\19\0=\5\v\0045\5\21\0=\5\r\0045\5\22\0=\5\15\0045\5\23\0=\5\17\4=\4\24\3=\3\25\2B\0\2\0016\0\4\0'\2\26\0B\0\2\0029\0\6\0004\2\0\0B\0\2\0016\0\0\0009\0\27\0'\2\28\0B\0\2\1K\0\1\0\27colorscheme catppuccin\bcmd*catppuccin.groups.integrations.feline\15native_lsp\15underlines\1\2\0\0\14underline\1\2\0\0\14underline\1\2\0\0\14underline\1\0\0\1\2\0\0\14underline\17virtual_text\16information\1\2\0\0\vitalic\rwarnings\1\2\0\0\vitalic\nhints\1\2\0\0\vitalic\verrors\1\0\0\1\2\0\0\vitalic\1\0\1\fenabled\2\1\0\4\15ts_rainbow\2\15treesitter\2\14telescope\2\rmarkdown\2\nsetup\15catppuccin\frequire\nmocha\23catppuccin_flavour\6g\bvim\0", "config", "catppuccin")
time([[Config for catppuccin]], false)
-- Config for: prettier.nvim
time([[Config for prettier.nvim]], true)
try_loadstring("\27LJ\2\n�\1\0\0\5\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\4\0005\4\3\0=\4\5\3B\1\2\1K\0\1\0\14filetypes\1\0\0\1\r\0\0\bcss\fgraphql\thtml\15javascript\20javascriptreact\tjson\tless\rmarkdown\tscss\15typescript\20typescriptreact\tyaml\nsetup\rprettier\frequire\0", "config", "prettier.nvim")
time([[Config for prettier.nvim]], false)
-- Config for: cinnamon.nvim
time([[Config for cinnamon.nvim]], true)
try_loadstring("\27LJ\2\n�\1\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\6\20default_keymaps\2\18default_delay\3\4\18always_scroll\2\17scroll_limit\3����\15\15max_length\3�\1\18extra_keymaps\2\nsetup\rcinnamon\frequire\0", "config", "cinnamon.nvim")
time([[Config for cinnamon.nvim]], false)
-- Config for: nvim-web-devicons
time([[Config for nvim-web-devicons]], true)
try_loadstring("\27LJ\2\nO\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\fdefault\2\nsetup\22nvim-web-devicons\frequire\0", "config", "nvim-web-devicons")
time([[Config for nvim-web-devicons]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n�\1\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\3B\1\2\1K\0\1\0\14highlight\1\0\1\venable\2\frainbow\1\0\0\1\0\1\venable\2\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: aerial.nvim
time([[Config for aerial.nvim]], true)
try_loadstring("\27LJ\2\n4\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\vaerial\frequire\0", "config", "aerial.nvim")
time([[Config for aerial.nvim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\n�\3\0\0\t\0!\0+6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\0005\4\21\0005\5\17\0005\6\r\0005\a\5\0009\b\4\1=\b\6\a9\b\a\1=\b\b\a9\b\t\1=\b\n\a9\b\v\1=\b\f\a=\a\14\0065\a\15\0009\b\4\1=\b\6\a9\b\a\1=\b\b\a=\a\16\6=\6\18\0055\6\19\0=\6\20\5=\5\22\0045\5\24\0005\6\23\0=\6\25\0055\6\26\0=\6\27\0055\6\28\0=\6\29\5=\5\30\4B\2\2\0019\2\31\0'\4 \0B\2\2\1K\0\1\0\bfzf\19load_extension\fpickers\fbuffers\1\0\1\ntheme\bivy\14git_files\1\0\1\ntheme\bivy\15find_files\1\0\0\1\0\2\ntheme\bivy\vhidden\2\rdefaults\1\0\0\17path_display\1\2\1\0\rtruncate\rtruncate\3\3\rmappings\1\0\0\6n\1\0\0\6i\1\0\0\t<up>\23cycle_history_prev\v<down>\23cycle_history_next\n<c-k>\28move_selection_previous\n<c-j>\1\0\0\24move_selection_next\nsetup\22telescope.actions\14telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: mason.nvim
time([[Config for mason.nvim]], true)
try_loadstring("\27LJ\2\n3\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\nmason\frequire\0", "config", "mason.nvim")
time([[Config for mason.nvim]], false)
-- Config for: alpha-nvim
time([[Config for alpha-nvim]], true)
try_loadstring("\27LJ\2\n�\t\0\0\t\0!\1:6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\0019\2\4\0025\3\6\0=\3\5\0025\2\b\0=\2\a\0019\2\3\0019\2\t\0024\3\a\0009\4\n\1'\6\v\0'\a\f\0'\b\r\0B\4\4\2>\4\1\0039\4\n\1'\6\14\0'\a\15\0'\b\16\0B\4\4\2>\4\2\0039\4\n\1'\6\17\0'\a\18\0'\b\19\0B\4\4\2>\4\3\0039\4\n\1'\6\20\0'\a\21\0'\b\22\0B\4\4\2>\4\4\0039\4\n\1'\6\23\0'\a\24\0'\b\25\0B\4\4\2>\4\5\0039\4\n\1'\6\26\0'\a\27\0'\b\28\0B\4\4\0?\4\0\0=\3\5\0025\2\30\0=\2\29\0019\2\31\0009\4 \1B\2\2\1K\0\1\0\vconfig\nsetup\1\0\2\ttype\fpadding\bval\3\25\fpadding <cmd>Telescope oldfiles<cr>\27  list recent files\afh!<cmd>Telescope live_grep<cr>\24  look for words\afw\f:qa<CR>\19  quit NVIM\6q\"<cmd>Telescope find_files<cr>\24  look for files\afF!<cmd>Telescope git_files<cr>\28  look for git files\aff :ene <BAR> startinsert <CR>\18  new file\6e\vbutton\fbuttons\1\0\2\ahl\20DashboardHeader\rposition\vcenter\topts\1\16\0\0&        _                        &        \\`*-.                    &         )  _`-.  ?              &        .  : `. .                &        : _   '  \\               &        ; *` _.   `*-._          &        `-.-'          `-.       &          ;       `       `.     &          :.       .        \\    &          . \\  .   :   .-'   .   &          '  `+.;  ;  '      :   &          :  '  |    ;       ;-. &          ; '   : :`-:     _.`* ;& [bug] .*' /  .*' ; .*`- +'  `*' &       `*-*   `*-*  `*-*'        \bval\vheader\fsection\27alpha.themes.dashboard\nalpha\frequire\r����\4\0", "config", "alpha-nvim")
time([[Config for alpha-nvim]], false)
-- Config for: null-ls.nvim
time([[Config for null-ls.nvim]], true)
try_loadstring("\27LJ\2\n;\0\0\2\0\4\0\0066\0\0\0009\0\1\0009\0\2\0009\0\3\0B\0\1\1K\0\1\0\20formatting_sync\bbuf\blsp\bvim�\1\1\2\a\1\r\0\0259\2\0\0'\4\1\0B\2\2\2\15\0\2\0X\3\19�6\2\2\0009\2\3\0029\2\4\0025\4\5\0-\5\0\0=\5\6\4=\1\a\4B\2\2\0016\2\2\0009\2\3\0029\2\b\2'\4\t\0005\5\n\0-\6\0\0=\6\6\5=\1\a\0053\6\v\0=\6\f\5B\2\3\1K\0\1\0\1�\rcallback\0\1\0\0\16BufWritePre\24nvim_create_autocmd\vbuffer\ngroup\1\0\0\24nvim_clear_autocmds\bapi\bvim\28textDocument/formatting\20supports_method�\4\1\0\n\0\28\0?6\0\0\0'\2\1\0B\0\2\0026\1\2\0009\1\3\0019\1\4\1'\3\5\0004\4\0\0B\1\3\0029\2\6\0005\4\24\0004\5\v\0009\6\a\0009\6\b\0069\6\t\6>\6\1\0059\6\a\0009\6\n\0069\6\v\6>\6\2\0059\6\a\0009\6\f\0069\6\t\6>\6\3\0059\6\a\0009\6\f\0069\6\r\6>\6\4\0059\6\a\0009\6\f\0069\6\14\6>\6\5\0059\6\a\0009\6\f\0069\6\15\0069\6\16\0065\b\18\0005\t\17\0=\t\19\bB\6\2\2>\6\6\0059\6\a\0009\6\20\0069\6\t\6>\6\a\0059\6\a\0009\6\20\0069\6\21\6>\6\b\0059\6\a\0009\6\20\0069\6\22\6>\6\t\0059\6\a\0009\6\20\0069\6\23\6>\6\n\5=\5\25\0043\5\26\0=\5\27\4B\2\2\0012\0\0�K\0\1\0\14on_attach\0\fsources\1\0\0\vstylua\frustfmt\14prettierd\15formatting\15extra_args\1\0\0\1\3\0\0\14--dialect\rpostgres\twith\rsqlfluff\ryamllint\17markdownlint\16diagnostics\fluasnip\15completion\reslint_d\17code_actions\rbuiltins\nsetup\18LspFormatting\24nvim_create_augroup\bapi\bvim\fnull-ls\frequire\0", "config", "null-ls.nvim")
time([[Config for null-ls.nvim]], false)
-- Config for: dressing.nvim
time([[Config for dressing.nvim]], true)
try_loadstring("\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rdressing\frequire\0", "config", "dressing.nvim")
time([[Config for dressing.nvim]], false)
-- Config for: vim-fugitive
time([[Config for vim-fugitive]], true)
try_loadstring("\27LJ\2\nq\0\0\6\0\a\0\t6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\1K\0\1\0\1\0\1\tdesc\18open fugitive\15<cmd>G<cr>\15<leader>gg\6n\20nvim_set_keymap\bapi\bvim\0", "config", "vim-fugitive")
time([[Config for vim-fugitive]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\n-\0\1\4\1\2\0\5-\1\0\0009\1\0\0019\3\1\0B\1\2\1K\0\1\0\1�\tbody\15lsp_expand�\1\0\1\3\2\4\0\21-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4�-\1\0\0009\1\1\1B\1\1\1X\1\v�-\1\1\0009\1\2\1B\1\1\2\15\0\1\0X\2\4�-\1\1\0009\1\3\1B\1\1\1X\1\2�\18\1\0\0B\1\1\1K\0\1\0\0�\1�\19expand_or_jump\23expand_or_jumpable\21select_next_item\fvisible�\1\0\1\4\2\4\0\23-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4�-\1\0\0009\1\1\1B\1\1\1X\1\r�-\1\1\0009\1\2\1)\3��B\1\2\2\15\0\1\0X\2\5�-\1\1\0009\1\3\1)\3��B\1\2\1X\1\2�\18\1\0\0B\1\1\1K\0\1\0\0�\1�\tjump\rjumpable\21select_prev_item\fvisible�\5\1\0\f\0+\0d6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\0005\4\a\0005\5\5\0003\6\4\0=\6\6\5=\5\b\0044\5\4\0005\6\t\0>\6\1\0055\6\n\0>\6\2\0055\6\v\0>\6\3\5=\5\f\0044\5\3\0005\6\r\0>\6\1\5>\5\1\0049\5\14\0009\5\15\0059\5\16\0055\a\18\0009\b\14\0009\b\17\b)\n��B\b\2\2=\b\19\a9\b\14\0009\b\17\b)\n\4\0B\b\2\2=\b\20\a9\b\14\0009\b\21\bB\b\1\2=\b\22\a9\b\14\0009\b\23\bB\b\1\2=\b\24\a9\b\14\0009\b\25\b5\n\26\0B\b\2\2=\b\27\a9\b\14\0003\n\28\0005\v\29\0B\b\3\2=\b\30\a9\b\14\0003\n\31\0005\v \0B\b\3\2=\b!\aB\5\2\2=\5\14\4B\2\2\0019\2\3\0009\2\"\2'\4#\0005\5$\0009\6\14\0009\6\15\0069\6\"\6B\6\1\2=\6\14\0054\6\3\0005\a%\0>\a\1\6=\6\f\5B\2\3\0019\2\3\0009\2\"\2'\4&\0005\5'\0009\6\14\0009\6\15\0069\6\"\6B\6\1\2=\6\14\0059\6(\0009\6\f\0064\b\3\0005\t)\0>\t\1\b4\t\3\0005\n*\0>\n\1\tB\6\3\2=\6\f\5B\2\3\0012\0\0�K\0\1\0\1\0\1\tname\fcmdline\1\0\1\tname\tpath\vconfig\1\0\0\6:\1\0\1\tname\vbuffer\1\0\0\6/\fcmdline\f<S-Tab>\1\3\0\0\6i\6s\0\n<Tab>\1\3\0\0\6i\6s\0\t<CR>\1\0\1\vselect\2\fconfirm\n<C-e>\nabort\14<C-Space>\rcomplete\n<C-f>\n<C-b>\1\0\0\16scroll_docs\vinsert\vpreset\fmapping\1\0\1\tname\vbuffer\fsources\1\0\1\tname\arg\1\0\1\tname\rnvim_lsp\1\0\1\tname\fluasnip\fsnippet\1\0\0\vexpand\1\0\0\0\nsetup\fluasnip\bcmp\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: feline.nvim
time([[Config for feline.nvim]], true)
try_loadstring("\27LJ\2\n�\1\0\0\a\0\v\0\0176\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\0005\4\5\0009\5\4\1B\5\1\2=\5\6\0045\5\a\0005\6\b\0=\6\t\5=\5\n\4B\2\2\1K\0\1\0\rprovider\topts\1\0\1\23file_modified_icon\b\1\0\1\tname\14file_info\15components\1\0\0\bget\nsetup*catppuccin.groups.integrations.feline\vfeline\frequire\0", "config", "feline.nvim")
time([[Config for feline.nvim]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au BufEnter * ++once lua require("packer.load")({'gitsigns.nvim'}, { event = "BufEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
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