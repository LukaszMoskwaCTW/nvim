local builtin = require('telescope.builtin')
local actions = require("telescope.actions")

require("telescope").setup({
  defaults = {
    mappings = {
      i = {
        ["<esc>"] = actions.close,
      },
    },
  },
  pickers = {
    find_files = {
      -- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
      find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
    },
  },
})

vim.keymap.set('n', '<leader>pf', builtin.git_files, {})
vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<leader>ps', function()
  builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
