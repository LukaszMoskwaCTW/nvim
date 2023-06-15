vim.keymap.set("n", "<leader>/", function()
	vim.cmd(':Commentary')
end)
vim.keymap.set("x", "<leader>/", function()
	vim.cmd.Commentary()
end)

