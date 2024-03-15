require("lykos94.remap")
require("lykos94.set")
require("luasnip.loaders.from_snipmate").load()
require("lykos94.telepackages")

vim.cmd([[colorscheme monokai-pro-spectrum]])

-- Set the cursorline
vim.cmd([[set cursorline]])


vim.cmd([[autocmd InsertEnter * highlight CursorLine guibg=bg guifg=fg]])

-- Green
vim.cmd([[autocmd InsertLeave * highlight CursorLine guibg=#B5BD68 guifg=#000000]])

-- Change also the color of selected text to green
vim.cmd([[autocmd InsertEnter * highlight Visual guibg=#B5BD68 guifg=#000000]])



vim.cmd([[
nnoremap Q q
nnoremap q <Nop>

noremap <silent> <C-S>          :update<CR>
vnoremap <silent> <C-S>         <C-C>:update<CR>
inoremap <silent> <C-S>         <C-O>:update<CR>
]])
