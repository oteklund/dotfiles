-- command Bfno :echo bufnr('%')
local create_command = vim.api.nvim_create_user_command

create_command("BufferNumber", function()
	print(vim.fn.bufnr())
end, { desc = "show current buffer number" })

vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "*",
	callback = function()
		package.loaded["feline"] = nil
		package.loaded["catppuccin.groups.integrations.feline"] = nil

		local ctp_feline = require("catppuccin.groups.integrations.feline")
		local feline = require("feline")

		ctp_feline.setup({
			sett = {
				show_modified = true,
			},
			assets = {
				mode_icon = "",
			},
			file_modified_icon = "",
		})

		feline.setup({
			components = ctp_feline.get(),
		})
	end,
})
