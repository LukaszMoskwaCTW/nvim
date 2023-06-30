require("neodev").setup({
  library = { plugins = { "nvim-dap-ui" }, types = true },
  ...
})
require("dapui").setup()
vim.fn.sign_define('DapBreakpoint', {text='🛑', texthl='', linehl='', numhl=''})


vim.keymap.set("n", "<leader>dap", function()
  require("dapui").toggle()
end)

vim.keymap.set("n", "<leader>dab", function()
  require("dap").toggle_breakpoint()
end)

vim.keymap.set("n", "<leader>dal", function()
  require("dap").list_breakpoints()
end)

vim.keymap.set("n", "<leader>dac", function()
  require("dap").clear_breakpoints()
end)
