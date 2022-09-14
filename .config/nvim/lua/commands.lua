-- command Bfno :echo bufnr('%')
local create_command = vim.api.nvim_create_user_command

create_command("BufferNumber", function() print(vim.fn.bufnr()) end, { desc = "show current buffer number" })
