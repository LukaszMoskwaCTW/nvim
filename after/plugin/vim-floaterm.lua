
vim.keymap.set("n", "<leader>gg", function() 
	vim.cmd(':FloatermNew --wintype=vsplit lazygit')
end)
