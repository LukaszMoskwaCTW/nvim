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
