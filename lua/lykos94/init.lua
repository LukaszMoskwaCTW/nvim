require("lykos94.remap")
require("lykos94.set")
require("luasnip.loaders.from_snipmate").load()

vim.cmd([[colorscheme monokai-pro-spectrum]])

-- require('onedark').setup {
--     style = 'deep'
-- }
-- require('onedark').load()

vim.cmd([[
nnoremap Q q
nnoremap q <Nop>

noremap <silent> <C-S>          :update<CR>
vnoremap <silent> <C-S>         <C-C>:update<CR>
inoremap <silent> <C-S>         <C-O>:update<CR>
]])

