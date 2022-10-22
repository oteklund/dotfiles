vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	use("neovim/nvim-lspconfig")

	-- mason is used for managing editor tooling suchas lsp servers
	use({
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	})

	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		auto_install = true,
		config = function()
			local treesitter = require("nvim-treesitter.configs")

			treesitter.setup({
				rainbow = {
					enable = true,
				},
				highlight = {
					enable = true,
				},
				indent = {
					enable = true,
				},
			})
		end,
	})

	-- this is required null-ls telescope and contains some lua utilities:
	use({ "nvim-lua/plenary.nvim" })

	-- null-ls helps us with code actions, formatting and such
	use({
		"jose-elias-alvarez/null-ls.nvim",
		config = function()
			local null_ls = require("null-ls")
			local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
			---@diagnostic disable-next-line: redundant-parameter
			null_ls.setup({
				sources = {
					-- null_ls.builtins.code_actions.eslint_d,
					null_ls.builtins.completion.luasnip,
					-- null_ls.builtins.diagnostics.eslint_d,
					null_ls.builtins.diagnostics.markdownlint,
					null_ls.builtins.diagnostics.yamllint,
					null_ls.builtins.diagnostics.sqlfluff.with({
						extra_args = { "--dialect", "postgres" }, -- change to your dialect
					}),
					-- luacheck is inactive because luarocks and the
					-- luarocks binary is not installed yet
					-- null_ls.builtins.diagnostics.luacheck,
					-- null_ls.builtins.formatting.eslint_d,
					null_ls.builtins.formatting.prettierd,
					null_ls.builtins.formatting.rustfmt,
					null_ls.builtins.formatting.stylua,
				},
				-- format on save
				on_attach = function(client, bufnr)
					if client.supports_method("textDocument/formatting") then
						vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
						vim.api.nvim_create_autocmd("BufWritePre", {
							group = augroup,
							buffer = bufnr,
							callback = function()
								-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
								vim.lsp.buf.formatting_sync()
							end,
						})
					end
				end,
			})
		end,
	})

	-- smooth scrolling 8-)
	-- use({
	-- 	"declancm/cinnamon.nvim",
	-- 	config = function()
	-- 		require("cinnamon").setup({
	-- 			default_keymaps = true, -- Create default keymaps.
	-- 			extra_keymaps = true, -- Create extra keymaps.
	-- 			max_length = 235,
	-- 			scroll_limit = -1,
	-- 			always_scroll = true,
	-- 			default_delay = 4,
	-- 		})
	-- 	end,
	-- })

	-- surround pieces of code with parenthesis, quotes etc...
	use({ "tpope/vim-surround" })

	-- add some language symbols and stuff, uses by feline :3
	use({
		"kyazdani42/nvim-web-devicons",
		config = function()
			require("nvim-web-devicons").setup({
				default = true,
			})
		end,
	})

	-- our editor theme! =)
	use({
		"catppuccin/nvim",
		as = "catppuccin",
		config = function()
			vim.g.catppuccin_flavour = "mocha" --latte, frappe, macchiato, mocha
			require("catppuccin").setup({
				telescope = true,
				markdown = true,
				treesitter = true,
				ts_rainbow = true,
				native_lsp = {
					enabled = true,
					virtual_text = {
						errors = { "italic" },
						hints = { "italic" },
						warnings = { "italic" },
						information = { "italic" },
					},
					underlines = {
						errors = { "underline" },
						hints = { "underline" },
						warnings = { "underline" },
						information = { "underline" },
					},
				},
			})

			vim.cmd([[colorscheme catppuccin]])
		end,
	})

	-- git decorations and stuff
	use({
		"lewis6991/gitsigns.nvim",
		event = "BufEnter",
		config = function()
			require("gitsigns").setup({
				current_line_blame = true,
				on_attach = function(bufnr)
					local gs = package.loaded.gitsigns

					local function map(mode, l, r, opts)
						opts = opts or {}
						opts.buffer = bufnr
						vim.keymap.set(mode, l, r, opts)
					end

					-- mappings
					map("n", "<leader>hn", function()
						vim.schedule(function()
							gs.next_hunk()
						end)
						return "<ignore>"
					end, { expr = true })

					map("n", "<leader>hp", function()
						vim.schedule(function()
							gs.prev_hunk()
						end)
						return "<ignore>"
					end, { expr = true })

					map({ "n", "v" }, "<leader>hr", ":Gitsigns reset_hunk<CR>")
					map("n", "<leader>hp", gs.preview_hunk)
					map("n", "<leader>hb", gs.toggle_current_line_blame)
					map("n", "<leader>hd", gs.diffthis)
					map("n", "<leader>hD", function()
						gs.diffthis("~")
					end)
				end,
			})
		end,
	})

	use({
		"tpope/vim-fugitive",
		config = function()
			vim.api.nvim_set_keymap("n", "<leader>gg", "<cmd>G<cr>", { desc = "open fugitive" })
		end,
	})

	-- make custom bindings repeatable (like adding the same surround command to
	-- a number of words / chunks / whatever
	use({ "tpope/vim-repeat" })

	-- commentary allows for commenting out code
	use({ "tpope/vim-commentary" })

	-- creates or updates a vim session file on exit or layout change,
	-- so that one can resume where they left off!
	use({ "tpope/vim-obsession" })

	-- telescope is used for fuzzy finding
	use({
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		requires = { { "nvim-lua/plenary.nvim" } },
		config = function()
			local telescope = require("telescope")
			local actions = require("telescope.actions")
			telescope.setup({
				defaults = {
					mappings = {
						i = {
							["<c-j>"] = actions.move_selection_next,
							["<c-k>"] = actions.move_selection_previous,
							["<down>"] = actions.cycle_history_next,
							["<up>"] = actions.cycle_history_prev,
						},
						n = {
							["<c-j>"] = actions.move_selection_next,
							["<c-k>"] = actions.move_selection_previous,
						},
					},
					path_display = { "truncate", truncate = 3 },
				},
				pickers = {
					find_files = {
						theme = "ivy",
						hidden = true,
					},
					git_files = {
						theme = "ivy",
					},
					buffers = {
						theme = "ivy",
					},
				},
			})
			-- load the fzf into telescope
			telescope.load_extension("fzf")
		end,
	})

	-- makes telescope look faster
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })

	-- snippets and code completion
	use({ "L3MON4D3/LuaSnip" })

	use({ "saadparwaiz1/cmp_luasnip" })

	use({ "hrsh7th/cmp-nvim-lsp" })

	use({ "hrsh7th/cmp-buffer" })

	use({ "hrsh7th/cmp-path" })

	use({ "lukas-reineke/cmp-rg" })

	vim.opt.completeopt = { "menu", "menuone", "noselect" }

	use({
		"hrsh7th/nvim-cmp",
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")

			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				sources = {
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					-- more sources
				},
				{
					{ name = "buffer" },
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump()
						-- elseif has_words_before() then //FIXME this does not work
						--    cmp.complete()
						else
							fallback()
						end
					end, { "i", "s" }),

					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),
				}),
				performance = {
					trigger_debounce_time = 120,
				},
			})

			-- Set configuration for specific filetype.
			-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
			-- TODO: move this into the main hash above
			cmp.setup.cmdline("/", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = "buffer" },
				},
			})

			-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = "path" },
				}, {
					{ name = "cmdline" },
				}),
			})
		end,
	})

	use({
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	})

	-- feline statusline
	use({
		"feline-nvim/feline.nvim",
		config = function()
			local feline = require("feline")

			local catppuccin = require("catppuccin.groups.integrations.feline")

			catppuccin.setup({
				sett = {
					show_modified = true,
				},
				assets = {
					mode_icon = "",
				},
				file_modified_icon = "",
			})

			feline.setup({
				components = catppuccin.get(),
			})
		end,
	})

	-- code formatting
	-- use "sbdchd/neoformat"
	use({
		"MunifTanjim/prettier.nvim",
		config = function()
			local prettier = require("prettier")

			prettier.setup({
				filetypes = {
					"css",
					"graphql",
					"html",
					"javascript",
					"javascriptreact",
					"json",
					"less",
					"markdown",
					"scss",
					"typescript",
					"typescriptreact",
					"yaml",
				},
			})
		end,
	})

	-- greeter screen
	use({
		"goolord/alpha-nvim",
		config = function()
			local alpha = require("alpha")
			local dashboard = require("alpha.themes.dashboard")

			dashboard.section.header.val = {
				[[        _                        ]],
				[[        \`*-.                    ]],
				[[         )  _`-.  ?              ]],
				[[        .  : `. .                ]],
				[[        : _   '  \               ]],
				[[        ; *` _.   `*-._          ]],
				[[        `-.-'          `-.       ]],
				[[          ;       `       `.     ]],
				[[          :.       .        \    ]],
				[[          . \  .   :   .-'   .   ]],
				[[          '  `+.;  ;  '      :   ]],
				[[          :  '  |    ;       ;-. ]],
				[[          ; '   : :`-:     _.`* ;]],
				[[ [bug] .*' /  .*' ; .*`- +'  `*' ]],
				[[       `*-*   `*-*  `*-*'        ]],
			}

			dashboard.opts = { position = "center", hl = "DashboardHeader" }

			dashboard.section.buttons.val = {
				dashboard.button("e", "  new file", ":ene <BAR> startinsert <CR>"),
				dashboard.button("ff", "  look for files", "<cmd>Telescope find_files<cr>"),
				dashboard.button(
					"fF",
					"  look for *all* files",
					"<cmd>Telescope find_files hidden=true no_ignore=true<cr>"
				),
				dashboard.button("q", "  quit NVIM", ":qa<CR>"),
				dashboard.button("fw", "  look for words", "<cmd>Telescope live_grep<cr>"),
				dashboard.button("fh", "  list recent files", "<cmd>Telescope oldfiles<cr>"),
			}

			dashboard.padding = { type = "padding", val = 25 }

			alpha.setup(dashboard.config)
		end,
	})
	-- dressing gives us some ui enhancements
	use({
		"stevearc/dressing.nvim",
		config = function()
			require("dressing").setup()
		end,
	})
end)

-- adds matching brackets
-- use "9mm/vim-closer"

-- allows for extended %-style matching (if -> else etc)
-- use {"andymass/vim-matchup", event = "VimEnter"}

-- plugin for previewing markdown files
-- use {"iamcco/markdown-preview.nvim", run = "cd app && yarn", cmd = "MarkdownPreview"}

-- Use specific branch, dependency and run lua file after load
-- statusline plugin
-- use {
--   "glepnir/galaxyline.nvim", branch = "main", config = function() require"statusline" end,
--   requires = {"kyazdani42/nvim-web-devicons"}
-- }
--
-- indent-o-matic
-- nvim-notify
