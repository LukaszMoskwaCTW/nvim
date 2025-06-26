require("lykos94.remap")
require("lykos94.set")
-- require("luasnip.loaders.from_snipmate").load()
require("monokai-pro").setup({
	filter = "pro",
})

-- vim.cmd([[set notermguicolors]])
vim.cmd([[set notermguicolors]])
vim.cmd([[colorscheme monokai-pro-spectrum]])

-- Set the cursorline
vim.cmd([[set cursorline]])

vim.cmd([[autocmd InsertEnter * highlight CursorLine guibg=bg guifg=fg]])

-- Green
vim.cmd([[autocmd InsertLeave * highlight CursorLine guibg=#B5BD68 guifg=#000000]])

-- Change also the color of selected text to green
vim.cmd([[autocmd InsertEnter * highlight Visual guibg=#B5BD68 guifg=#000000]])

-- Allow to copy the lines in the Visual mode
vim.keymap.set("v", "<leader>cp", function()
	local filepath = vim.fn.expand("%")
	local start_line = vim.fn.line("v")
	local end_line = vim.fn.line(".")

	if start_line > end_line then
		start_line, end_line = end_line, start_line
	end

	local lines = {}
	for i = start_line, end_line do
		local content = vim.fn.getline(i)
		table.insert(lines, string.format("%s %d: %s", filepath, i, content))
	end

	local result = table.concat(lines, "\n")
	vim.fn.setreg("+", result)
	print("Copied " .. #lines .. " lines to clipboard")
end, { noremap = true, silent = true })

vim.cmd([[
nnoremap Q q
nnoremap q <Nop>

noremap <silent> <C-S>          :update<CR>
vnoremap <silent> <C-S>         <C-C>:update<CR>
inoremap <silent> <C-S>         <C-O>:update<CR>
]])
