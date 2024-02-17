-- SETTINGS START

local options = {
    ignorecase = true,
    number = true,
    numberwidth = 2,
    relativenumber = true,
    scrolloff = 5,
    shiftwidth = 4,
    tabstop = 4,
    softtabstop = 4,
    shiftround = true,
    expandtab = true,
    signcolumn = "yes",
    smartcase = true,
    swapfile = false,
    undofile = true,
    hlsearch = false,
    termguicolors = true,
    wildignore = vim.opt.wildignore + "node_modules",
    guicursor = "",
    completeopt = { "menu", "menuone", "noselect" },
}

for key, value in pairs(options) do
    vim.opt[key] = value
end

local signs = {
    { name = "DiagnosticSignError", text = "" },
    { name = "DiagnosticSignWarn", text = "" },
    { name = "DiagnosticSignHint", text = "" },
    { name = "DiagnosticSignInfo", text = "" },
}

for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

vim.diagnostic.config({
    severity_sort = true,
    signs = {
        active = signs,
    },
    float = { border = "rounded" },
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
    close_events = { "BufHidden", "InsertLeave" },
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
})

-- SETTINGS END

-- PLUGINS START

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {
        -- :3
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            vim.cmd.colorscheme("catppuccin-mocha")

            require("catppuccin").setup({
                dim_inactive = {
                    enabled = true,
                    shade = "dark",
                    percentage = 0.30,
                },
            })
        end,
    },
    {
        "williamboman/mason.nvim",
        init = function()
            require("mason").setup()
        end,
    },
    {
        "neovim/nvim-lspconfig",
    },
    {
        "nvim-lua/plenary.nvim",
    },
    {
        "jose-elias-alvarez/null-ls.nvim",
        init = function()
            local null_ls = require("null-ls")
            local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

            null_ls.setup({
                sources = {
                    null_ls.builtins.formatting.prettierd,
                    null_ls.builtins.formatting.stylua,
                    null_ls.builtins.formatting.rustfmt,
                    null_ls.builtins.formatting.sqlfluff.with({
                        extra_args = { "--dialect", "postgres" },
                    }),
                    null_ls.builtins.code_actions.eslint,
                    null_ls.builtins.diagnostics.sqlfluff.with({
                        extra_args = { "--dialect", "postgres" },
                    }),
                },
                on_attach = function(client, bufnr)
                    if client.supports_method("textDocument/formatting") then
                        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
                        vim.api.nvim_create_autocmd("BufWritePre", {
                            group = augroup,
                            buffer = bufnr,
                            callback = function()
                                vim.lsp.buf.format()
                            end,
                        })
                    end
                end,
            })
        end,
    },
    {
        "tpope/vim-fugitive",
    },
    {
        "tpope/vim-surround",
    },
    {
        "tpope/vim-commentary",
    },
    {
        "tpope/vim-obsession",
    },
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
    },
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("telescope").load_extension("fzf")
        end,
    },
    {
        "lewis6991/gitsigns.nvim",
        init = function()
            require("gitsigns").setup({
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

                    map("n", "<leader>hN", function()
                        vim.schedule(function()
                            gs.prev_hunk()
                        end)
                        return "<ignore>"
                    end, { expr = true })

                    map({ "n", "v" }, "<leader>hr", gs.reset_hunk)
                    map("n", "<leader>hp", gs.preview_hunk)
                    map("n", "<leader>hb", gs.toggle_current_line_blame)
                    map("n", "<leader>hd", gs.diffthis)
                    map("n", "<leader>hD", function()
                        gs.diffthis("~")
                    end)
                end,
            })
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            local configs = require("nvim-treesitter.configs")

            configs.setup({
                ensure_installed = "all",
                sync_install = false,
                auto_install = false,
                highlight = { enable = true },
                indent = { enable = true },
                rainbow = { enable = true },
                ignore_install = {},
                modules = {},
            })
        end,
    },
    {
        "hrsh7th/cmp-nvim-lsp",
    },
    {
        "hrsh7th/cmp-buffer",
    },
    {
        "saadparwaiz1/cmp_luasnip",
    },
    {
        "L3MON4D3/LuaSnip",
        version = "2.*",
        build = "make install_jsregexp",
        dependencies = {
            "rafamadriz/friendly-snippets",
            config = function()
                require("luasnip.loaders.from_vscode").lazy_load()
            end,
        },
        config = function()
            local ls = require("luasnip")

            vim.keymap.set({ "i" }, "<C-K>", function()
                ls.expand()
            end, { silent = true })
            vim.keymap.set({ "i", "s" }, "<C-L>", function()
                ls.jump(1)
            end, { silent = true })
            vim.keymap.set({ "i", "s" }, "<C-H>", function()
                ls.jump(-1)
            end, { silent = true })

            vim.keymap.set({ "i", "s" }, "<C-E>", function()
                if ls.choice_active() then
                    ls.change_choice(1)
                end
            end, { silent = true })
        end,
    },
    {
        "hrsh7th/cmp-path",
    },
    {
        "hrsh7th/nvim-cmp",
        config = function()
            local cmp = require("cmp")
            local luasnip = require("luasnip")

            local has_words_before = function()
                unpack = unpack or table.unpack

                local line, col = unpack(vim.api.nvim_win_get_cursor(0))

                return col ~= 0
                    and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
            end

            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-n>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
                    ["<C-p>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
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
                        elseif has_words_before() then
                            cmp.complete()
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
                sources = cmp.config.sources({
                    { name = "nvim_lsp", priority = 40 },
                    { name = "luasnip",  option = { use_show_condition = false }, priority = 30 },
                    { name = "path",     priority = 20 },
                    { name = "buffer",   priority = 10 },
                }),
            })

            cmp.setup.cmdline({ "/", "?" }, {
                sources = {
                    { name = "buffer" },
                },
            })

            cmp.setup.cmdline(":", {
                sources = cmp.config.sources({
                    { name = "path" },
                }, {
                    { name = "cmdline" },
                }),
            })
        end,
    },
    {
        "nvim-tree/nvim-web-devicons",
        config = function()
            require("nvim-web-devicons").setup()
        end,
    },
    {
        "feline-nvim/feline.nvim",
        config = function()
            local feline = require("feline")
            local catppuccin_feline = require("catppuccin.groups.integrations.feline")

            catppuccin_feline.setup({
                sett = {
                    show_modified = true,
                },
                assets = {
                    mode_icon = "",
                },
            })

            feline.setup({
                components = catppuccin_feline.get(),
            })
        end,
    },
})

-- PLUGINS END

-- LSP START

local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

lspconfig.tsserver.setup({
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        client.server_capabilities.documentFormattingProvider = false
    end,
})

lspconfig.prismals.setup({
    capabilities = capabilities,
})

lspconfig.rust_analyzer.setup({
    capabilities = capabilities,
})

lspconfig.eslint.setup({
    capabilities = capabilities,
})

lspconfig.html.setup({
    capabilities = capabilities,
})

lspconfig.cssls.setup({
    capabilities = capabilities,
})

lspconfig.jsonls.setup({
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        -- prettier handles this
        client.server_capabilities.documentFormattingProvider = false
    end,
})

lspconfig.graphql.setup({
    capabilities = capabilities,
    filetypes = {
        "graphql",
        "typescriptreact",
        "javascriptreact",
        "typescript",
    },
})

lspconfig.lua_ls.setup({
    capabilities = capabilities,
    on_init = function(client)
        local path = client.workspace_folders[1].name
        if not vim.loop.fs_stat(path .. "/.luarc.json") and not vim.loop.fs_stat(path .. "/.luarc.jsonc") then
            client.config.settings = vim.tbl_deep_extend("force", client.config.settings.Lua, {
                runtime = {
                    version = "LuaJIT",
                },
                workspace = {
                    library = { vim.env.VIMRUNTIME },
                },
            })

            client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
        end
        return true
    end,
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT",
            },
            diagnostics = {
                globals = { "vim" },
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false,
            },
            telemetry = {
                enable = false,
            },
        },
    },
})

lspconfig.htmx.setup({
    capabilities = capabilities,
})

lspconfig.gopls.setup({
    capabilities = capabilities,
})

-- TODO: add more language servers =)
-- - lua
-- - go?

-- LSP END

-- MAPPINGS START

local config = { noremap = true, silent = true }

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, config)
vim.keymap.set("n", "gp", vim.diagnostic.goto_prev, config)
vim.keymap.set("n", "gn", vim.diagnostic.goto_next, config)
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, config)
vim.keymap.set("n", "Å", "<C-^>", config)
vim.keymap.set("n", "<leader>gg", "<cmd>G<cr>")

local telescope_builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>ff", telescope_builtin.find_files)
vim.keymap.set("n", "<leader>fF", function()
    telescope_builtin.find_files({
        hidden = true,
        no_ignore = true,
    })
end)
vim.keymap.set("n", "<leader>fb", telescope_builtin.buffers)
vim.keymap.set("n", "<leader>fh", telescope_builtin.help_tags)
vim.keymap.set("n", "<leader>fd", telescope_builtin.diagnostics)
vim.keymap.set("n", "<leader>fs", telescope_builtin.lsp_document_symbols)
vim.keymap.set("n", "<leader>fw", telescope_builtin.live_grep)

-- MAPPINGS END

-- AUTOCOMMANDS START

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf }
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
        vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
        vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
        vim.keymap.set("n", "<leader>wl", function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)
        vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "<leader>lf", function()
            vim.lsp.buf.format()
        end, opts)
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = {
        "typescript",
        "javascript",
        "json",
        "html",
        "prisma",
        "typescriptreact",
        "javascriptreact",
        "yaml",
        "markdown",
        "css",
        "scss",
        "sass",
    },
    callback = function()
        vim.opt_local.shiftwidth = 2
        vim.opt_local.tabstop = 2
        vim.opt_local.softtabstop = 2
    end,
})

-- AUTOCOMMANDS END
