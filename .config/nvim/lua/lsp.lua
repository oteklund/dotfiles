-- mappings
local map = vim.keymap.set
-- attach function
local on_attach = function(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	-- NOTE: this is incompatible with cmp completion
	-- so it might not be working
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	-- disable conflicting formatters
	local disabled_formatters = {
		["tsserver"] = true, -- typescript formatting is handled by eslint
		["sumneko_lua"] = true, -- lua formatting is handled by stylua
		["jsonls"] = true,
		["rust_analyzer"] = true,
	}

	if disabled_formatters[client.name] then
		client.resolved_capabilities.document_formatting = false
	end

	-- mappings
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	map("n", "gD", vim.lsp.buf.declaration, bufopts)
	map("n", "gd", vim.lsp.buf.definition, bufopts)
	map("n", "K", vim.lsp.buf.hover, bufopts)
	map("n", "gi", vim.lsp.buf.implementation, bufopts)
	map("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
	map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, bufopts)
	map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
	map("n", "<leader>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workleader_folders()))
	end, bufopts)
	map("n", "td", vim.lsp.buf.type_definition, bufopts)
	map("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
	map("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
	map("n", "gr", vim.lsp.buf.references, bufopts)
	map("n", "<leader>lf", vim.lsp.buf.formatting, bufopts)
	map("v", "<leader>ca", vim.lsp.buf.range_code_action, bufopts)
end

-- language servers

local lspconfig = require("lspconfig")
local cmp_lsp = require("cmp_nvim_lsp")

-- vscode-json-language-server and vscode-css-language-server
-- only provide completions when snippet support is enabled.
-- To enable completion, install a snippet plugin and add the
-- following override to your language client capabilities during setup.
local capabilities = cmp_lsp.update_capabilities(vim.lsp.protocol.make_client_capabilities())

capabilities.textDocument.completion.completionItem.snippetSupport = true

-- typescript
lspconfig.tsserver.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

-- json
lspconfig.jsonls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

-- yaml
lspconfig.yamlls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

-- prisma
lspconfig.prismals.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

-- markdown FIXME: add nlprule for language processing?
lspconfig.prosemd_lsp.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

-- bash
lspconfig.bashls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

-- css
lspconfig.cssls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

-- eslint
lspconfig.eslint.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

-- lua
lspconfig.sumneko_lua.setup({
	capabilities = capabilities,
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
		},
	},
	on_attach = on_attach,
})

--graphql
lspconfig.graphql.setup({
	filetypes = {
		"graphql",
		"typescriptreact",
		"javascriptreact",
		"typescript",
	},
})

--rust
lspconfig.rust_analyzer.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})
