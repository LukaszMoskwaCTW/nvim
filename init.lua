require("config.lazy")
require("lykos94")

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
vim.treesitter.language.register("markdown", "octo")

-- On terminal remove line numbers:
-- autocmd TermOpen * setlocal nonumber norelativenumber
-- autocmd TermOpen * startinsert
vim.cmd("autocmd TermOpen * setlocal nonumber norelativenumber")

-- Create an autocommand group for lazygit terminal close behavior
vim.api.nvim_create_augroup("LazygitAutoClose", { clear = true })

-- Define the autocommand to close the terminal when lazygit exits
vim.api.nvim_create_autocmd("TermClose", {
	group = "LazygitAutoClose",
	pattern = "*",
	callback = function(event)
		-- Get the buffer name and check if it contains 'lazygit'
		local bufname = vim.api.nvim_buf_get_name(event.buf)
		if bufname:match("lazygit") then
			vim.api.nvim_buf_delete(event.buf, { force = true })
		end
	end,
})
