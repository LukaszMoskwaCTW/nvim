local dapui = require("dapui")
vim.keymap.set("n", "<leader>dap", function()
	dapui.toggle()
end, { noremap = true })

vim.fn.sign_define("DapBreakpoint", { text = "🛑", texthl = "", linehl = "", numhl = "" })

vim.keymap.set("n", "<leader>dac", function()
	require("dap").clear_breakpoints()
end)
vim.keymap.set("n", "<leader>daa", ":DapShowLog<CR>")
vim.keymap.set("n", "<leader>dal", function()
	require("dap").list_breakpoints()
end)
