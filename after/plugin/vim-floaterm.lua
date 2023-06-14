
vim.keymap.set("n", "<leader>gg", function()
	vim.cmd(':FloatermNew --wintype=vsplit lazygit')
end)
-- Create a variable for the terminal 
vim.keymap.set("n", "<C-j>", function()
    print("heelo")
    vim.cmd(':FloatermNew --wintype=vsplit')
end)
vim.keymap.set("t", "<C-j>", function()
	vim.cmd(':FloatermToggle  --wintype=vsplit')
end)
