require("bufferline").setup({
	animation = false,
	auto_hide = 100,
	tabpages = true,
})

vim.keymap.set("n", "<C-j>", "<cmd>BufferPrevious<CR>")
vim.keymap.set("n", "<C-k>", "<cmd>BufferNext<CR>")
vim.keymap.set("t", "<C-j>", "<cmd>BufferPrevious<CR>")
vim.keymap.set("t", "<C-k>", "<cmd>BufferNext<CR>")
