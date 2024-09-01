-- OR setup with some options
require("nvim-tree").setup({
	sort = {
		sorter = "case_sensitive",
	},
	view = {
		width = 30,
	},
	renderer = {
		group_empty = true,
	},
	filters = {
		dotfiles = true,
	},
})

vim.keymap.set("n", "<leader>ee", vim.cmd.NvimTreeToggle)
vim.keymap.set("n", "<leader>er", vim.cmd.NvimTreeFindFile)
