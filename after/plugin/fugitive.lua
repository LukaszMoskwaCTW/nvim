vim.keymap.set("n", "<leader>gs", vim.cmd.Gvdiffsplit)
vim.keymap.set("n", "<leader>ga", vim.cmd.Gstatus)

vim.keymap.set("n", "<leader>gb", function()
	vim.cmd(':Git blame')
end)

vim.keymap.set("n", "<leader>gh", function()
	vim.cmd(':GcLog -- %')
end)
