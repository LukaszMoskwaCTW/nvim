vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
-- Close a buffer
vim.keymap.set("n", "<leader>w", ":bd<CR>")
-- Close a buffer without saving
-- vim.keymap.set("n", "<leader>W", ":bd!<CR>")
-- Close all buffers except the current one
vim.keymap.set("n", "<leader>W", ":BufferCloseAllButCurrent<CR>")
-- Reopen the last closed buffer, shift + t
vim.keymap.set("n", "<leader><S-t>", ":e #<CR>")
-- vim.keymap.set("i", "<C-s>", "<Esc>:w<CR>")
vim.keymap.set("n", "<leader>s", ":w<CR>")
vim.keymap.set("n", "<leader>tn", ":tabe<CR>")

-- vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>")


-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.dotfiles/nvim/.config/nvim/lua/theprimeagen/packer.lua<CR>");
vim.keymap.set("n", "<leader>mw", "<cmd>set wrap!<CR>");

vim.keymap.set("n", "<leader><leader>", function()
  vim.cmd(":source $MYVIMRC<CR>")
end)
