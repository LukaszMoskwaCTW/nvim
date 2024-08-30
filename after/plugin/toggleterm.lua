require("toggleterm").setup()

vim.keymap.set("n", "<leader>tt", "<cmd>ToggleTerm direction=vertical size=120<CR>")
vim.keymap.set("t", "<C-t>", "<cmd>ToggleTerm direction=vertical size=120<CR>")

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({
	cmd = "lazygit",
	hidden = true,
	direction = "tab",
})

function _lazygit_toggle()
	lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>gg", "<cmd>lua _lazygit_toggle()<CR>", { noremap = true, silent = true })
