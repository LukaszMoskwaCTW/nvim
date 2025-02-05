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

local function get_buffer_name(buf)
	-- Check if the buffer is valid and loaded
	if vim.api.nvim_buf_is_loaded(buf) then
		-- Retrieve and return the buffer name
		return vim.api.nvim_buf_get_name(buf)
	else
		-- Handle the error case
		return "error"
	end
end
-- Define the autocommand to close the terminal when lazygit exits
vim.api.nvim_create_autocmd("TermClose", {
	group = "LazygitAutoClose",
	pattern = "*",
	callback = function(event)
		-- Get the buffer name and check if it contains 'lazygit'
		-- Check if the event buf exists
		if not event.buf then
			return
		end
		local bufname = get_buffer_name(event.buf)
		-- Print the buffer name
		print(bufname)
		if bufname == "Error: Buffer is not valid or not loaded." then
			return
		end
		if bufname:match("lazygit") then
			vim.api.nvim_buf_delete(event.buf, { force = true })
		end
	end,
})
