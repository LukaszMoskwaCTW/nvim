require("leetcode").setup({
	arg = "l",
	-- directory = '$HOME/.leetcode',
	lang = "python3",
	-- workspace = '/Users/mofiqulislam/leetcode',
	-- workspace = '/Users/mofiqulislam/leetcode',
	-- workspace = '/Users/mofiqulislam/leetcode
})
vim.keymap.set("n", "<leader>ld", ":Leet desc<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>ls", ":Leet submit<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>lt", ":Leet test<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>lc", ":Leet check<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>ll", ":Leet list<CR>", { noremap = true, silent = true })
