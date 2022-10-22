-- options / sets
local options = {
	clipboard = "unnamedplus",
	expandtab = true,
	ignorecase = true,
	number = true,
	numberwidth = 2,
	relativenumber = true,
	scrolloff = 5,
	shiftwidth = 2,
	showmode = false,
	signcolumn = "yes",
	smartcase = true,
	swapfile = false,
	tabstop = 2,
	undofile = true,
	hlsearch = false,
	termguicolors = true,
	wildignore = vim.opt.wildignore + "node_modules",
	guicursor = "",
}

for key, value in pairs(options) do
	vim.opt[key] = value
end

local globalOptions = {
	netrw_banner = false,
}

for key, value in pairs(globalOptions) do
	vim.g[key] = value
end
