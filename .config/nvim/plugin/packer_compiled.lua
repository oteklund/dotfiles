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
    config = { "\27LJ\2\nM\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\14lazy_load luasnip.loaders.from_vscode\frequire\0" },
    loaded = true,
    path = "/home/oteklund/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["alpha-nvim"] = {
    config = { "\27LJ\2\nŒ\t\0\0\t\0!\1:6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\0019\2\4\0025\3\6\0=\3\5\0025\2\b\0=\2\a\0019\2\3\0019\2\t\0024\3\a\0009\4\n\1'\6\v\0'\a\f\0'\b\r\0B\4\4\2>\4\1\0039\4\n\1'\6\14\0'\a\15\0'\b\16\0B\4\4\2>\4\2\0039\4\n\1'\6\17\0'\a\18\0'\b\19\0B\4\4\2>\4\3\0039\4\n\1'\6\20\0'\a\21\0'\b\22\0B\4\4\2>\4\4\0039\4\n\1'\6\23\0'\a\24\0'\b\25\0B\4\4\2>\4\5\0039\4\n\1'\6\26\0'\a\27\0'\b\28\0B\4\4\0?\4\0\0=\3\5\0025\2\30\0=\2\29\0019\2\31\0009\4 \1B\2\2\1K\0\1\0\vconfig\nsetup\1\0\2\bval\3\25\ttype\fpadding\fpadding <cmd>Telescope oldfiles<cr>\27ÔÜ∞  list recent files\afh!<cmd>Telescope live_grep<cr>\24ÔáÇ  look for words\afw\f:qa<CR>\19Ôôô  quit NVIM\6q=<cmd>Telescope find_files hidden=true no_ignore=true<cr>\30Ô°à  look for *all* files\afF\"<cmd>Telescope find_files<cr>\24Ôû°  look for files\aff :ene <BAR> startinsert <CR>\18ÔÖõ  new file\6e\vbutton\fbuttons\1\0\2\rposition\vcenter\ahl\20DashboardHeader\topts\1\16\0\0&        _                        &        \\`*-.                    &         )  _`-.  ?              &        .  : `. .                &        : _   '  \\               &        ; *` _.   `*-._          &        `-.-'          `-.       &          ;       `       `.     &          :.       .        \\    &          . \\  .   :   .-'   .   &          '  `+.;  ;  '      :   &          :  '  |    ;       ;-. &          ; '   : :`-:     _.`* ;& [bug] .*' /  .*' ; .*`- +'  `*' &       `*-*   `*-*  `*-*'        \bval\vheader\fsection\27alpha.themes.dashboard\nalpha\frequire\rÄÄ¿ô\4\0" },
    loaded = true,
    path = "/home/oteklund/.local/share/nvim/site/pack/packer/start/alpha-nvim",
    url = "https://github.com/goolord/alpha-nvim"
  },
  catppuccin = {
    config = { "\27LJ\2\nú\5\0\0\a\0\"\0*6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0005\4\a\0005\5\t\0005\6\b\0=\6\n\0055\6\v\0=\6\f\0055\6\r\0=\6\14\0055\6\15\0=\6\16\5=\5\17\0045\5\19\0005\6\18\0=\6\n\0055\6\20\0=\6\f\0055\6\21\0=\6\14\0055\6\22\0=\6\16\5=\5\23\4=\4\24\3=\3\25\0025\3\26\0=\3\27\0025\3\28\0=\3\29\2B\0\2\0016\0\30\0009\0\31\0009\0 \0'\2!\0B\0\2\1K\0\1\0\27colorscheme catppuccin\17nvim_command\bapi\bvim\nnavic\1\0\2\14custom_bg\tNONE\fenabled\1\17dim_inactive\1\0\3\15percentage\4ö≥ÊÃ\tô≥¶˛\3\fenabled\2\nshade\tdark\17integrations\15native_lsp\15underlines\1\2\0\0\14underline\1\2\0\0\14underline\1\2\0\0\14underline\1\0\0\1\2\0\0\14underline\17virtual_text\16information\1\2\0\0\vitalic\rwarnings\1\2\0\0\vitalic\nhints\1\2\0\0\vitalic\verrors\1\0\0\1\2\0\0\vitalic\1\0\1\fenabled\2\1\0\6\14gitgutter\2\15ts_rainbow\2\rmarkdown\2\14telescope\2\15treesitter\2\23treesitter_context\2\15background\1\0\2\tdark\nmocha\nlight\nlatte\1\0\1\fflavour\nmocha\nsetup\15catppuccin\frequire\0" },
    loaded = true,
    path = "/home/oteklund/.local/share/nvim/site/pack/packer/start/catppuccin",
    url = "https://github.com/catppuccin/nvim"
  },
  ["cinnamon.nvim"] = {
    config = { "\27LJ\2\nπ\1\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\b\17scroll_limit\3ˇˇˇˇ\15\15max_length\3Î\1\21extended_keymaps\2\18extra_keymaps\2\20default_keymaps\2\rcentered\2\18default_delay\3\3\18always_scroll\2\nsetup\rcinnamon\frequire\0" },
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
  ["copilot.vim"] = {
    loaded = true,
    path = "/home/oteklund/.local/share/nvim/site/pack/packer/start/copilot.vim",
    url = "https://github.com/github/copilot.vim"
  },
  ["dressing.nvim"] = {
    config = { "\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rdressing\frequire\0" },
    loaded = true,
    path = "/home/oteklund/.local/share/nvim/site/pack/packer/start/dressing.nvim",
    url = "https://github.com/stevearc/dressing.nvim"
  },
  ["feline.nvim"] = {
    config = { "\27LJ\2\n÷\1\0\0\a\0\f\0\0206\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\0015\4\5\0005\5\4\0=\5\6\0045\5\a\0=\5\b\4B\2\2\0019\2\3\0005\4\n\0009\5\t\1B\5\1\2=\5\v\4B\2\2\1K\0\1\0\15components\1\0\0\bget\vassets\1\0\1\14mode_icon\bÔÜ∞\tsett\1\0\0\1\0\1\18show_modified\2\nsetup*catppuccin.groups.integrations.feline\vfeline\frequire\0" },
    loaded = true,
    path = "/home/oteklund/.local/share/nvim/site/pack/packer/start/feline.nvim",
    url = "https://github.com/feline-nvim/feline.nvim"
  },
  ["fidget.nvim"] = {
    config = { "\27LJ\2\n4\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\vfidget\frequire\0" },
    loaded = true,
    path = "/home/oteklund/.local/share/nvim/site/pack/packer/start/fidget.nvim",
    url = "https://github.com/j-hui/fidget.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\nW\0\4\n\1\4\0\14\14\0\3\0X\4\1Ä4\3\0\0-\4\0\0=\4\0\0036\4\1\0009\4\2\0049\4\3\4\18\6\0\0\18\a\1\0\18\b\2\0\18\t\3\0B\4\5\1K\0\1\0\0¿\bset\vkeymap\bvim\vbuffer#\0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\0\0\14next_hunk<\1\0\3\1\4\0\a6\0\0\0009\0\1\0003\2\2\0B\0\2\1'\0\3\0002\0\0ÄL\0\2\0\1¿\r<ignore>\0\rschedule\bvim#\0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\0\0\14prev_hunk<\1\0\3\1\4\0\a6\0\0\0009\0\1\0003\2\2\0B\0\2\1'\0\3\0002\0\0ÄL\0\2\0\1¿\r<ignore>\0\rschedule\bvim(\0\0\3\1\2\0\5-\0\0\0009\0\0\0'\2\1\0B\0\2\1K\0\1\0\1¿\6~\rdiffthisÅ\3\1\1\t\0\22\0+6\1\0\0009\1\1\0019\1\2\0013\2\3\0\18\3\2\0'\5\4\0'\6\5\0003\a\6\0005\b\a\0B\3\5\1\18\3\2\0'\5\4\0'\6\b\0003\a\t\0005\b\n\0B\3\5\1\18\3\2\0005\5\v\0'\6\f\0'\a\r\0B\3\4\1\18\3\2\0'\5\4\0'\6\14\0009\a\15\1B\3\4\1\18\3\2\0'\5\4\0'\6\16\0009\a\17\1B\3\4\1\18\3\2\0'\5\4\0'\6\18\0009\a\19\1B\3\4\1\18\3\2\0'\5\4\0'\6\20\0003\a\21\0B\3\4\0012\0\0ÄK\0\1\0\0\15<leader>hD\rdiffthis\15<leader>hd\30toggle_current_line_blame\15<leader>hb\17preview_hunk\15<leader>hh\29:Gitsigns reset_hunk<CR>\15<leader>hr\1\3\0\0\6n\6v\1\0\1\texpr\2\0\15<leader>hp\1\0\1\texpr\2\0\15<leader>hn\6n\0\rgitsigns\vloaded\fpackaged\1\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0003\3\4\0=\3\5\2B\0\2\1K\0\1\0\14on_attach\0\1\0\1\23current_line_blame\2\nsetup\rgitsigns\frequire\0" },
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
    config = { "\27LJ\2\n2\0\0\2\0\4\0\0066\0\0\0009\0\1\0009\0\2\0009\0\3\0B\0\1\1K\0\1\0\vformat\bbuf\blsp\bvimÓ\1\1\2\a\1\r\0\0259\2\0\0'\4\1\0B\2\2\2\15\0\2\0X\3\19Ä6\2\2\0009\2\3\0029\2\4\0025\4\5\0-\5\0\0=\5\6\4=\1\a\4B\2\2\0016\2\2\0009\2\3\0029\2\b\2'\4\t\0005\5\n\0-\6\0\0=\6\6\5=\1\a\0053\6\v\0=\6\f\5B\2\3\1K\0\1\0\1¿\rcallback\0\1\0\0\16BufWritePre\24nvim_create_autocmd\vbuffer\ngroup\1\0\0\24nvim_clear_autocmds\bapi\bvim\28textDocument/formatting\20supports_methodæ\3\1\0\n\0\26\00036\0\0\0'\2\1\0B\0\2\0026\1\2\0009\1\3\0019\1\4\1'\3\5\0004\4\0\0B\1\3\0029\2\6\0005\4\22\0004\5\b\0009\6\a\0009\6\b\0069\6\t\6>\6\1\0059\6\a\0009\6\b\0069\6\n\6>\6\2\0059\6\a\0009\6\b\0069\6\v\0069\6\f\0065\b\14\0005\t\r\0=\t\15\bB\6\2\2>\6\3\0059\6\a\0009\6\16\0069\6\17\6>\6\4\0059\6\a\0009\6\16\0069\6\18\6>\6\5\0059\6\a\0009\6\16\0069\6\19\6>\6\6\0059\6\a\0009\6\20\0069\6\21\6>\6\a\5=\5\23\0043\5\24\0=\5\25\4B\2\2\0012\0\0ÄK\0\1\0\14on_attach\0\fsources\1\0\0\fluasnip\15completion\vstylua\frustfmt\14prettierd\15formatting\15extra_args\1\0\0\1\3\0\0\14--dialect\rpostgres\twith\rsqlfluff\ryamllint\17markdownlint\16diagnostics\rbuiltins\nsetup\18LspFormatting\24nvim_create_augroup\bapi\bvim\fnull-ls\frequire\0" },
    loaded = true,
    path = "/home/oteklund/.local/share/nvim/site/pack/packer/start/null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\n–\1\0\0\b\0\b\2!6\0\0\0006\2\1\0009\2\2\0029\2\3\2)\4\0\0B\2\2\0A\0\0\3\b\1\0\0X\2\20Ä6\2\1\0009\2\2\0029\2\4\2)\4\0\0\23\5\1\0\18\6\0\0+\a\2\0B\2\5\2:\2\1\2\18\4\2\0009\2\5\2\18\5\1\0\18\6\1\0B\2\4\2\18\4\2\0009\2\6\2'\5\a\0B\2\3\2\n\2\0\0X\2\2Ä+\2\1\0X\3\1Ä+\2\2\0L\2\2\0\a%s\nmatch\bsub\23nvim_buf_get_lines\24nvim_win_get_cursor\bapi\bvim\vunpack\0\2C\0\1\4\0\4\0\a6\1\0\0'\3\1\0B\1\2\0029\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\15lsp_expand\fluasnip\frequire≈\1\0\1\3\3\5\0\29-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4Ä-\1\0\0009\1\1\1B\1\1\1X\1\19Ä-\1\1\0009\1\2\1B\1\1\2\15\0\1\0X\2\4Ä-\1\1\0009\1\3\1B\1\1\1X\1\nÄ-\1\2\0B\1\1\2\15\0\1\0X\2\4Ä-\1\0\0009\1\4\1B\1\1\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\0¿\1¿\2¿\rcomplete\19expand_or_jump\23expand_or_jumpable\21select_next_item\fvisibleé\1\0\1\4\2\4\0\23-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4Ä-\1\0\0009\1\1\1B\1\1\1X\1\rÄ-\1\1\0009\1\2\1)\3ˇˇB\1\2\2\15\0\1\0X\2\5Ä-\1\1\0009\1\3\1)\3ˇˇB\1\2\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\0¿\1¿\tjump\rjumpable\21select_prev_item\fvisibleÙ\b\1\0\f\0C\0ï\0016\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0023\2\3\0009\3\4\0005\5\v\0005\6\b\0009\a\5\0009\a\6\a9\a\a\aB\a\1\2=\a\t\0069\a\5\0009\a\6\a9\a\a\aB\a\1\2=\a\n\6=\6\6\0055\6\r\0003\a\f\0=\a\14\6=\6\15\0055\6\19\0009\a\16\0003\t\17\0005\n\18\0B\a\3\2=\a\20\0069\a\16\0003\t\21\0005\n\22\0B\a\3\2=\a\23\0069\a\16\0009\t\16\0009\t\24\tB\t\1\0025\n\25\0B\a\3\2=\a\26\0069\a\16\0009\t\16\0009\t\27\tB\t\1\0025\n\28\0B\a\3\2=\a\29\0069\a\16\0009\t\16\0009\t\30\t)\v¸ˇB\t\2\0025\n\31\0B\a\3\2=\a \0069\a\16\0009\t\16\0009\t\30\t)\v\4\0B\t\2\0025\n!\0B\a\3\2=\a\"\0069\a\16\0009\t\16\0009\t#\tB\t\1\0025\n$\0B\a\3\2=\a%\0069\a\5\0009\a&\a=\a'\0069\a\16\0005\t)\0009\n\16\0009\n(\nB\n\1\2=\n*\t9\n\16\0009\n+\nB\n\1\2=\n,\tB\a\2\2=\a-\0069\a\16\0009\a.\a5\t/\0B\a\2\2=\a0\6=\6\16\0059\6\5\0009\0061\0064\b\5\0005\t2\0>\t\1\b5\t3\0>\t\2\b5\t4\0>\t\3\b5\t5\0>\t\4\bB\6\2\2=\0061\5B\3\2\0019\3\4\0009\0036\3'\0057\0005\6:\0009\a\5\0009\a1\a4\t\3\0005\n8\0>\n\1\t4\n\3\0005\v9\0>\v\1\nB\a\3\2=\a1\6B\3\3\0019\3\4\0009\3;\3'\5<\0005\6>\0004\a\3\0005\b=\0>\b\1\a=\a1\6B\3\3\0019\3\4\0009\3;\3'\5?\0005\6B\0009\a\5\0009\a1\a4\t\3\0005\n@\0>\n\1\t4\n\3\0005\vA\0>\v\1\nB\a\3\2=\a1\6B\3\3\0012\0\0ÄK\0\1\0\1\0\0\1\0\1\tname\fcmdline\1\0\1\tname\tpath\6:\1\0\0\1\0\1\tname\vbuffer\6/\fcmdline\1\0\0\1\0\1\tname\vbuffer\1\0\1\tname\fcmp_git\14gitcommit\rfiletype\1\0\2\tname\vbuffer\19keyword_length\3\5\1\0\1\tname\tpath\1\0\1\tname\fluasnip\1\0\1\tname\rnvim_lsp\fsources\t<CR>\1\0\1\vselect\2\fconfirm\n<C-e>\6c\nclose\6i\1\0\0\nabort\n<C-y>\fdisable\14<C-Space>\1\3\0\0\6i\6c\rcomplete\n<C-f>\1\3\0\0\6i\6c\n<C-b>\1\3\0\0\6i\6c\16scroll_docs\n<C-p>\1\3\0\0\6i\6c\21select_prev_item\n<C-n>\1\3\0\0\6i\6c\21select_next_item\f<S-Tab>\1\3\0\0\6i\6s\0\n<Tab>\1\0\0\1\3\0\0\6i\6s\0\fmapping\fsnippet\vexpand\1\0\0\0\1\0\0\18documentation\15completion\1\0\0\rbordered\vwindow\vconfig\nsetup\0\fluasnip\bcmp\frequire\0" },
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
    config = { "\27LJ\2\nÔ\1\0\0\6\0\14\0\0196\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\1'\3\5\0=\3\4\0029\2\6\0005\4\b\0005\5\a\0=\5\t\0045\5\n\0=\5\v\0045\5\f\0=\5\r\4B\2\2\1K\0\1\0\vindent\1\0\1\venable\2\14highlight\1\0\1\venable\2\frainbow\1\0\0\1\0\1\venable\2\nsetup\thttp\trest\27filetype_to_parsername\28nvim-treesitter.parsers\28nvim-treesitter.configs\frequire\0" },
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
    config = { "\27LJ\2\n∑\1\0\0\5\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\4\0005\4\3\0=\4\5\3B\1\2\1K\0\1\0\14filetypes\1\0\0\1\r\0\0\bcss\fgraphql\thtml\15javascript\20javascriptreact\tjson\tless\rmarkdown\tscss\15typescript\20typescriptreact\tyaml\nsetup\rprettier\frequire\0" },
    loaded = true,
    path = "/home/oteklund/.local/share/nvim/site/pack/packer/start/prettier.nvim",
    url = "https://github.com/MunifTanjim/prettier.nvim"
  },
  ["rest.nvim"] = {
    config = { "\27LJ\2\n>\0\1\5\0\4\0\0066\1\0\0009\1\1\0019\1\2\0015\3\3\0\18\4\0\0D\1\3\0\1\5\0\0\ttidy\a-i\a-q\6-\vsystem\afn\bvimé\3\1\0\6\0\15\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0005\4\a\0003\5\b\0=\5\t\4=\4\n\3=\3\v\0024\3\0\0=\3\f\0025\3\r\0=\3\14\2B\0\2\1K\0\1\0\14filetypes\1\3\0\0\thttp\trest\29custom_dynamic_variables\vresult\15formatters\thtml\0\1\0\1\tjson\ajq\1\0\3\19show_http_info\2\rshow_url\2\17show_headers\2\14highlight\1\0\2\ftimeout\3ñ\1\fenabled\2\1\0\a\15encode_url\2\17yank_dry_run\2\26skip_ssl_verification\1\26result_split_in_place\1\28result_split_horizontal\1\renv_file\t.env\20jump_to_request\1\nsetup\14rest-nvim\frequire\0" },
    loaded = true,
    path = "/home/oteklund/.local/share/nvim/site/pack/packer/start/rest.nvim",
    url = "https://github.com/NTBBloodbath/rest.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/home/oteklund/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope-symbols.nvim"] = {
    loaded = true,
    path = "/home/oteklund/.local/share/nvim/site/pack/packer/start/telescope-symbols.nvim",
    url = "https://github.com/nvim-telescope/telescope-symbols.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\n˚\3\0\0\t\0!\0+6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\0005\4\21\0005\5\17\0005\6\r\0005\a\5\0009\b\4\1=\b\6\a9\b\a\1=\b\b\a9\b\t\1=\b\n\a9\b\v\1=\b\f\a=\a\14\0065\a\15\0009\b\4\1=\b\6\a9\b\a\1=\b\b\a=\a\16\6=\6\18\0055\6\19\0=\6\20\5=\5\22\0045\5\24\0005\6\23\0=\6\25\0055\6\26\0=\6\27\0055\6\28\0=\6\29\5=\5\30\4B\2\2\0019\2\31\0'\4 \0B\2\2\1K\0\1\0\bfzf\19load_extension\fpickers\fbuffers\1\0\1\ntheme\bivy\14git_files\1\0\1\ntheme\bivy\15find_files\1\0\0\1\0\2\ntheme\bivy\vhidden\2\rdefaults\1\0\0\17path_display\1\2\1\0\rtruncate\rtruncate\3\3\rmappings\1\0\0\6n\1\0\0\6i\1\0\0\t<up>\23cycle_history_prev\v<down>\23cycle_history_next\n<c-k>\28move_selection_previous\n<c-j>\1\0\0\24move_selection_next\nsetup\22telescope.actions\14telescope\frequire\0" },
    loaded = true,
    path = "/home/oteklund/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["vim-abolish"] = {
    loaded = true,
    path = "/home/oteklund/.local/share/nvim/site/pack/packer/start/vim-abolish",
    url = "https://github.com/tpope/vim-abolish"
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
  ["vim-obsession"] = {
    loaded = true,
    path = "/home/oteklund/.local/share/nvim/site/pack/packer/start/vim-obsession",
    url = "https://github.com/tpope/vim-obsession"
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
-- Config for: rest.nvim
time([[Config for rest.nvim]], true)
try_loadstring("\27LJ\2\n>\0\1\5\0\4\0\0066\1\0\0009\1\1\0019\1\2\0015\3\3\0\18\4\0\0D\1\3\0\1\5\0\0\ttidy\a-i\a-q\6-\vsystem\afn\bvimé\3\1\0\6\0\15\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0005\4\a\0003\5\b\0=\5\t\4=\4\n\3=\3\v\0024\3\0\0=\3\f\0025\3\r\0=\3\14\2B\0\2\1K\0\1\0\14filetypes\1\3\0\0\thttp\trest\29custom_dynamic_variables\vresult\15formatters\thtml\0\1\0\1\tjson\ajq\1\0\3\19show_http_info\2\rshow_url\2\17show_headers\2\14highlight\1\0\2\ftimeout\3ñ\1\fenabled\2\1\0\a\15encode_url\2\17yank_dry_run\2\26skip_ssl_verification\1\26result_split_in_place\1\28result_split_horizontal\1\renv_file\t.env\20jump_to_request\1\nsetup\14rest-nvim\frequire\0", "config", "rest.nvim")
time([[Config for rest.nvim]], false)
-- Config for: LuaSnip
time([[Config for LuaSnip]], true)
try_loadstring("\27LJ\2\nM\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\14lazy_load luasnip.loaders.from_vscode\frequire\0", "config", "LuaSnip")
time([[Config for LuaSnip]], false)
-- Config for: alpha-nvim
time([[Config for alpha-nvim]], true)
try_loadstring("\27LJ\2\nŒ\t\0\0\t\0!\1:6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\0019\2\4\0025\3\6\0=\3\5\0025\2\b\0=\2\a\0019\2\3\0019\2\t\0024\3\a\0009\4\n\1'\6\v\0'\a\f\0'\b\r\0B\4\4\2>\4\1\0039\4\n\1'\6\14\0'\a\15\0'\b\16\0B\4\4\2>\4\2\0039\4\n\1'\6\17\0'\a\18\0'\b\19\0B\4\4\2>\4\3\0039\4\n\1'\6\20\0'\a\21\0'\b\22\0B\4\4\2>\4\4\0039\4\n\1'\6\23\0'\a\24\0'\b\25\0B\4\4\2>\4\5\0039\4\n\1'\6\26\0'\a\27\0'\b\28\0B\4\4\0?\4\0\0=\3\5\0025\2\30\0=\2\29\0019\2\31\0009\4 \1B\2\2\1K\0\1\0\vconfig\nsetup\1\0\2\bval\3\25\ttype\fpadding\fpadding <cmd>Telescope oldfiles<cr>\27ÔÜ∞  list recent files\afh!<cmd>Telescope live_grep<cr>\24ÔáÇ  look for words\afw\f:qa<CR>\19Ôôô  quit NVIM\6q=<cmd>Telescope find_files hidden=true no_ignore=true<cr>\30Ô°à  look for *all* files\afF\"<cmd>Telescope find_files<cr>\24Ôû°  look for files\aff :ene <BAR> startinsert <CR>\18ÔÖõ  new file\6e\vbutton\fbuttons\1\0\2\rposition\vcenter\ahl\20DashboardHeader\topts\1\16\0\0&        _                        &        \\`*-.                    &         )  _`-.  ?              &        .  : `. .                &        : _   '  \\               &        ; *` _.   `*-._          &        `-.-'          `-.       &          ;       `       `.     &          :.       .        \\    &          . \\  .   :   .-'   .   &          '  `+.;  ;  '      :   &          :  '  |    ;       ;-. &          ; '   : :`-:     _.`* ;& [bug] .*' /  .*' ; .*`- +'  `*' &       `*-*   `*-*  `*-*'        \bval\vheader\fsection\27alpha.themes.dashboard\nalpha\frequire\rÄÄ¿ô\4\0", "config", "alpha-nvim")
time([[Config for alpha-nvim]], false)
-- Config for: mason.nvim
time([[Config for mason.nvim]], true)
try_loadstring("\27LJ\2\n3\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\nmason\frequire\0", "config", "mason.nvim")
time([[Config for mason.nvim]], false)
-- Config for: null-ls.nvim
time([[Config for null-ls.nvim]], true)
try_loadstring("\27LJ\2\n2\0\0\2\0\4\0\0066\0\0\0009\0\1\0009\0\2\0009\0\3\0B\0\1\1K\0\1\0\vformat\bbuf\blsp\bvimÓ\1\1\2\a\1\r\0\0259\2\0\0'\4\1\0B\2\2\2\15\0\2\0X\3\19Ä6\2\2\0009\2\3\0029\2\4\0025\4\5\0-\5\0\0=\5\6\4=\1\a\4B\2\2\0016\2\2\0009\2\3\0029\2\b\2'\4\t\0005\5\n\0-\6\0\0=\6\6\5=\1\a\0053\6\v\0=\6\f\5B\2\3\1K\0\1\0\1¿\rcallback\0\1\0\0\16BufWritePre\24nvim_create_autocmd\vbuffer\ngroup\1\0\0\24nvim_clear_autocmds\bapi\bvim\28textDocument/formatting\20supports_methodæ\3\1\0\n\0\26\00036\0\0\0'\2\1\0B\0\2\0026\1\2\0009\1\3\0019\1\4\1'\3\5\0004\4\0\0B\1\3\0029\2\6\0005\4\22\0004\5\b\0009\6\a\0009\6\b\0069\6\t\6>\6\1\0059\6\a\0009\6\b\0069\6\n\6>\6\2\0059\6\a\0009\6\b\0069\6\v\0069\6\f\0065\b\14\0005\t\r\0=\t\15\bB\6\2\2>\6\3\0059\6\a\0009\6\16\0069\6\17\6>\6\4\0059\6\a\0009\6\16\0069\6\18\6>\6\5\0059\6\a\0009\6\16\0069\6\19\6>\6\6\0059\6\a\0009\6\20\0069\6\21\6>\6\a\5=\5\23\0043\5\24\0=\5\25\4B\2\2\0012\0\0ÄK\0\1\0\14on_attach\0\fsources\1\0\0\fluasnip\15completion\vstylua\frustfmt\14prettierd\15formatting\15extra_args\1\0\0\1\3\0\0\14--dialect\rpostgres\twith\rsqlfluff\ryamllint\17markdownlint\16diagnostics\rbuiltins\nsetup\18LspFormatting\24nvim_create_augroup\bapi\bvim\fnull-ls\frequire\0", "config", "null-ls.nvim")
time([[Config for null-ls.nvim]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\n–\1\0\0\b\0\b\2!6\0\0\0006\2\1\0009\2\2\0029\2\3\2)\4\0\0B\2\2\0A\0\0\3\b\1\0\0X\2\20Ä6\2\1\0009\2\2\0029\2\4\2)\4\0\0\23\5\1\0\18\6\0\0+\a\2\0B\2\5\2:\2\1\2\18\4\2\0009\2\5\2\18\5\1\0\18\6\1\0B\2\4\2\18\4\2\0009\2\6\2'\5\a\0B\2\3\2\n\2\0\0X\2\2Ä+\2\1\0X\3\1Ä+\2\2\0L\2\2\0\a%s\nmatch\bsub\23nvim_buf_get_lines\24nvim_win_get_cursor\bapi\bvim\vunpack\0\2C\0\1\4\0\4\0\a6\1\0\0'\3\1\0B\1\2\0029\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\15lsp_expand\fluasnip\frequire≈\1\0\1\3\3\5\0\29-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4Ä-\1\0\0009\1\1\1B\1\1\1X\1\19Ä-\1\1\0009\1\2\1B\1\1\2\15\0\1\0X\2\4Ä-\1\1\0009\1\3\1B\1\1\1X\1\nÄ-\1\2\0B\1\1\2\15\0\1\0X\2\4Ä-\1\0\0009\1\4\1B\1\1\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\0¿\1¿\2¿\rcomplete\19expand_or_jump\23expand_or_jumpable\21select_next_item\fvisibleé\1\0\1\4\2\4\0\23-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4Ä-\1\0\0009\1\1\1B\1\1\1X\1\rÄ-\1\1\0009\1\2\1)\3ˇˇB\1\2\2\15\0\1\0X\2\5Ä-\1\1\0009\1\3\1)\3ˇˇB\1\2\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\0¿\1¿\tjump\rjumpable\21select_prev_item\fvisibleÙ\b\1\0\f\0C\0ï\0016\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0023\2\3\0009\3\4\0005\5\v\0005\6\b\0009\a\5\0009\a\6\a9\a\a\aB\a\1\2=\a\t\0069\a\5\0009\a\6\a9\a\a\aB\a\1\2=\a\n\6=\6\6\0055\6\r\0003\a\f\0=\a\14\6=\6\15\0055\6\19\0009\a\16\0003\t\17\0005\n\18\0B\a\3\2=\a\20\0069\a\16\0003\t\21\0005\n\22\0B\a\3\2=\a\23\0069\a\16\0009\t\16\0009\t\24\tB\t\1\0025\n\25\0B\a\3\2=\a\26\0069\a\16\0009\t\16\0009\t\27\tB\t\1\0025\n\28\0B\a\3\2=\a\29\0069\a\16\0009\t\16\0009\t\30\t)\v¸ˇB\t\2\0025\n\31\0B\a\3\2=\a \0069\a\16\0009\t\16\0009\t\30\t)\v\4\0B\t\2\0025\n!\0B\a\3\2=\a\"\0069\a\16\0009\t\16\0009\t#\tB\t\1\0025\n$\0B\a\3\2=\a%\0069\a\5\0009\a&\a=\a'\0069\a\16\0005\t)\0009\n\16\0009\n(\nB\n\1\2=\n*\t9\n\16\0009\n+\nB\n\1\2=\n,\tB\a\2\2=\a-\0069\a\16\0009\a.\a5\t/\0B\a\2\2=\a0\6=\6\16\0059\6\5\0009\0061\0064\b\5\0005\t2\0>\t\1\b5\t3\0>\t\2\b5\t4\0>\t\3\b5\t5\0>\t\4\bB\6\2\2=\0061\5B\3\2\0019\3\4\0009\0036\3'\0057\0005\6:\0009\a\5\0009\a1\a4\t\3\0005\n8\0>\n\1\t4\n\3\0005\v9\0>\v\1\nB\a\3\2=\a1\6B\3\3\0019\3\4\0009\3;\3'\5<\0005\6>\0004\a\3\0005\b=\0>\b\1\a=\a1\6B\3\3\0019\3\4\0009\3;\3'\5?\0005\6B\0009\a\5\0009\a1\a4\t\3\0005\n@\0>\n\1\t4\n\3\0005\vA\0>\v\1\nB\a\3\2=\a1\6B\3\3\0012\0\0ÄK\0\1\0\1\0\0\1\0\1\tname\fcmdline\1\0\1\tname\tpath\6:\1\0\0\1\0\1\tname\vbuffer\6/\fcmdline\1\0\0\1\0\1\tname\vbuffer\1\0\1\tname\fcmp_git\14gitcommit\rfiletype\1\0\2\tname\vbuffer\19keyword_length\3\5\1\0\1\tname\tpath\1\0\1\tname\fluasnip\1\0\1\tname\rnvim_lsp\fsources\t<CR>\1\0\1\vselect\2\fconfirm\n<C-e>\6c\nclose\6i\1\0\0\nabort\n<C-y>\fdisable\14<C-Space>\1\3\0\0\6i\6c\rcomplete\n<C-f>\1\3\0\0\6i\6c\n<C-b>\1\3\0\0\6i\6c\16scroll_docs\n<C-p>\1\3\0\0\6i\6c\21select_prev_item\n<C-n>\1\3\0\0\6i\6c\21select_next_item\f<S-Tab>\1\3\0\0\6i\6s\0\n<Tab>\1\0\0\1\3\0\0\6i\6s\0\fmapping\fsnippet\vexpand\1\0\0\0\1\0\0\18documentation\15completion\1\0\0\rbordered\vwindow\vconfig\nsetup\0\fluasnip\bcmp\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: nvim-colorizer.lua
time([[Config for nvim-colorizer.lua]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0", "config", "nvim-colorizer.lua")
time([[Config for nvim-colorizer.lua]], false)
-- Config for: vim-fugitive
time([[Config for vim-fugitive]], true)
try_loadstring("\27LJ\2\nq\0\0\6\0\a\0\t6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\1K\0\1\0\1\0\1\tdesc\18open fugitive\15<cmd>G<cr>\15<leader>gg\6n\20nvim_set_keymap\bapi\bvim\0", "config", "vim-fugitive")
time([[Config for vim-fugitive]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\nÔ\1\0\0\6\0\14\0\0196\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\1'\3\5\0=\3\4\0029\2\6\0005\4\b\0005\5\a\0=\5\t\0045\5\n\0=\5\v\0045\5\f\0=\5\r\4B\2\2\1K\0\1\0\vindent\1\0\1\venable\2\14highlight\1\0\1\venable\2\frainbow\1\0\0\1\0\1\venable\2\nsetup\thttp\trest\27filetype_to_parsername\28nvim-treesitter.parsers\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: nvim-web-devicons
time([[Config for nvim-web-devicons]], true)
try_loadstring("\27LJ\2\nO\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\fdefault\2\nsetup\22nvim-web-devicons\frequire\0", "config", "nvim-web-devicons")
time([[Config for nvim-web-devicons]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\n˚\3\0\0\t\0!\0+6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\0005\4\21\0005\5\17\0005\6\r\0005\a\5\0009\b\4\1=\b\6\a9\b\a\1=\b\b\a9\b\t\1=\b\n\a9\b\v\1=\b\f\a=\a\14\0065\a\15\0009\b\4\1=\b\6\a9\b\a\1=\b\b\a=\a\16\6=\6\18\0055\6\19\0=\6\20\5=\5\22\0045\5\24\0005\6\23\0=\6\25\0055\6\26\0=\6\27\0055\6\28\0=\6\29\5=\5\30\4B\2\2\0019\2\31\0'\4 \0B\2\2\1K\0\1\0\bfzf\19load_extension\fpickers\fbuffers\1\0\1\ntheme\bivy\14git_files\1\0\1\ntheme\bivy\15find_files\1\0\0\1\0\2\ntheme\bivy\vhidden\2\rdefaults\1\0\0\17path_display\1\2\1\0\rtruncate\rtruncate\3\3\rmappings\1\0\0\6n\1\0\0\6i\1\0\0\t<up>\23cycle_history_prev\v<down>\23cycle_history_next\n<c-k>\28move_selection_previous\n<c-j>\1\0\0\24move_selection_next\nsetup\22telescope.actions\14telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: catppuccin
time([[Config for catppuccin]], true)
try_loadstring("\27LJ\2\nú\5\0\0\a\0\"\0*6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0005\4\a\0005\5\t\0005\6\b\0=\6\n\0055\6\v\0=\6\f\0055\6\r\0=\6\14\0055\6\15\0=\6\16\5=\5\17\0045\5\19\0005\6\18\0=\6\n\0055\6\20\0=\6\f\0055\6\21\0=\6\14\0055\6\22\0=\6\16\5=\5\23\4=\4\24\3=\3\25\0025\3\26\0=\3\27\0025\3\28\0=\3\29\2B\0\2\0016\0\30\0009\0\31\0009\0 \0'\2!\0B\0\2\1K\0\1\0\27colorscheme catppuccin\17nvim_command\bapi\bvim\nnavic\1\0\2\14custom_bg\tNONE\fenabled\1\17dim_inactive\1\0\3\15percentage\4ö≥ÊÃ\tô≥¶˛\3\fenabled\2\nshade\tdark\17integrations\15native_lsp\15underlines\1\2\0\0\14underline\1\2\0\0\14underline\1\2\0\0\14underline\1\0\0\1\2\0\0\14underline\17virtual_text\16information\1\2\0\0\vitalic\rwarnings\1\2\0\0\vitalic\nhints\1\2\0\0\vitalic\verrors\1\0\0\1\2\0\0\vitalic\1\0\1\fenabled\2\1\0\6\14gitgutter\2\15ts_rainbow\2\rmarkdown\2\14telescope\2\15treesitter\2\23treesitter_context\2\15background\1\0\2\tdark\nmocha\nlight\nlatte\1\0\1\fflavour\nmocha\nsetup\15catppuccin\frequire\0", "config", "catppuccin")
time([[Config for catppuccin]], false)
-- Config for: cinnamon.nvim
time([[Config for cinnamon.nvim]], true)
try_loadstring("\27LJ\2\nπ\1\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\b\17scroll_limit\3ˇˇˇˇ\15\15max_length\3Î\1\21extended_keymaps\2\18extra_keymaps\2\20default_keymaps\2\rcentered\2\18default_delay\3\3\18always_scroll\2\nsetup\rcinnamon\frequire\0", "config", "cinnamon.nvim")
time([[Config for cinnamon.nvim]], false)
-- Config for: feline.nvim
time([[Config for feline.nvim]], true)
try_loadstring("\27LJ\2\n÷\1\0\0\a\0\f\0\0206\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\2\3\0015\4\5\0005\5\4\0=\5\6\0045\5\a\0=\5\b\4B\2\2\0019\2\3\0005\4\n\0009\5\t\1B\5\1\2=\5\v\4B\2\2\1K\0\1\0\15components\1\0\0\bget\vassets\1\0\1\14mode_icon\bÔÜ∞\tsett\1\0\0\1\0\1\18show_modified\2\nsetup*catppuccin.groups.integrations.feline\vfeline\frequire\0", "config", "feline.nvim")
time([[Config for feline.nvim]], false)
-- Config for: dressing.nvim
time([[Config for dressing.nvim]], true)
try_loadstring("\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rdressing\frequire\0", "config", "dressing.nvim")
time([[Config for dressing.nvim]], false)
-- Config for: prettier.nvim
time([[Config for prettier.nvim]], true)
try_loadstring("\27LJ\2\n∑\1\0\0\5\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\4\0005\4\3\0=\4\5\3B\1\2\1K\0\1\0\14filetypes\1\0\0\1\r\0\0\bcss\fgraphql\thtml\15javascript\20javascriptreact\tjson\tless\rmarkdown\tscss\15typescript\20typescriptreact\tyaml\nsetup\rprettier\frequire\0", "config", "prettier.nvim")
time([[Config for prettier.nvim]], false)
-- Config for: fidget.nvim
time([[Config for fidget.nvim]], true)
try_loadstring("\27LJ\2\n4\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\vfidget\frequire\0", "config", "fidget.nvim")
time([[Config for fidget.nvim]], false)
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
