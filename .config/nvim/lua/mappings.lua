vim.g.mapleader = " "

local map = vim.keymap.set

local config = { noremap = true, silent = true }
---@diagnostic disable-next-line: unused-local
local term_config = { silent = true }

local telescope = require("telescope.builtin")

map("", "<space>", "<nop>", config)

local table = {
	-- normal mode mappings
	n = {
		-- default mappings
		-- remove search highlighting
		["<leader>h"] = {
			"<cmd>nohlsearch<cr>",
			desc = "clear search highlights",
		},
		["<leader>ö"] = {
			function()
				print("hej =)")
			end,
			desc = "print a nice little greeting",
		},
		["å"] = "^",
		["Å"] = { "<C-6>", desc = "toggle alternate file" },
		["<leader>e"] = {
			"<cmd>Lexplore 25<cr>",
			desc = "open netrw file explorer to the left",
		},
		["<leader>bn"] = {
			"<cmd>BufferNumber<cr>",
			desc = "print the current buffer number",
		},

		-- plugins mappings
		--telescope
		["<leader>ff"] = {
			function()
				telescope.find_files()
			end,
			desc = "search files",
		},
		["<leader>fF"] = {
			function()
				telescope.find_files({
					hidden = true,
					no_ignore = true,
				})
			end,
			desc = "search all files",
		},
		["<leader>fb"] = {
			"<cmd>Telescope buffers<cr>",
			desc = "list open buffers",
		},
		["<leader>fh"] = {
			"<cmd>Telescope oldfiles<cr>",
			desc = "list previously opened files",
		},
		["<leader>g?"] = {
			"<cmd>Telescope help_tags<cr>",
			desc = "list available help tags",
		},
		["<leader>fw"] = {
			"<cmd>Telescope live_grep<cr>",
			desc = "look for lines matching a pattern",
		},
		["<leader>fW"] = {
			function()
				telescope.live_grep({
					additional_args = function()
						return {
							"--hidden",
						}
					end,
				})
			end,
			desc = "look for text matching a pattern, including hidden files",
		},
		["<leader>fd"] = {
			"<cmd>Telescope diagnostics bufnr=0<cr>",
			desc = "list buffer diagnostics",
		},
		["<leader>fD"] = {
			"<cmd>Telescope diagnostics<cr>",
			desc = "list all workspace diagnostics",
		},
		["<leader>f/"] = {
			"<cmd>Telescope current_buffer_fuzzy_find<cr>",
			desc = "look for lines matching a pattern in current buffer",
		},
		["<leader>fs"] = {
			telescope.lsp_document_symbols,
			desc = "list symbols in the current buffer",
		},
		["<leader>fS"] = {
			-- NOTE: there is also lsp_dynamic_workspace_symbols, not sure what the
			--       difference between the two is
			telescope.lsp_workspace_symbols,
			desc = "list symbols in the current workspace",
		},
		["<leader>E"] = {
			telescope.symbols,
			desc = "select and insert a symbol (e.g. emoji)",
		},

		-- lsp
		["<leader>d"] = {
			function()
				vim.diagnostic.open_float({
					opts = {
						scope = "line",
					},
				})
			end,
			desc = "open diagnostics in a floating window",
		},
		["gn"] = {
			function()
				vim.diagnostic.goto_next()
			end,
			desc = "show next diagnostic issue",
		},
		["gp"] = {
			function()
				vim.diagnostic.goto_prev()
			end,
			desc = "show previous diagnostic issue",
		},
		["<leader>Q"] = {
			function()
				vim.diagnostic.setqflist()
			end,
			desc = "add diagnostics to quickfix list",
		},
		["<leader>q"] = {
			function()
				vim.diagnostic.setloclist()
			end,
			desc = "add diagnostics to local list",
		},
	},
	-- visual mode mappings
	v = {
		["<"] = { "<gv", desc = "indent selection to the left" },
		[">"] = { ">gv", desc = "indent selection to the right" },
		["å"] = "^",
		-- ["<A-j>"] = { ":move'>+1<cr>==gv", desc = "move code down" },
		-- ["<A-k>"] = { ":move'<-2<cr>==gv", desc = "move code up" },
	},
	-- insert mode mappings
	i = {},
	-- terminal mode mappings
	t = {},
	--  visual block mode mappings
	x = {
		["å"] = "^",
	},
	-- command mode mappings
	c = {},
}

for mode, mappings in pairs(table) do
	for mapping, cmd_and_config in pairs(mappings) do
		if not cmd_and_config then
			goto continue
		end
		local cmd = cmd_and_config
		-- command can be a table of the command itself and a description
		if type(cmd) == "table" then
			---@diagnostic disable-next-line: cast-local-type
			cmd = cmd_and_config[1]
			-- we remove the command from the options table so that the
			-- rest of the contents can be merged with the base config
			cmd_and_config[1] = nil
		else
			cmd_and_config = {}
		end
		map(mode, mapping, cmd, vim.tbl_deep_extend("force", cmd_and_config, config))
		::continue::
	end
end
