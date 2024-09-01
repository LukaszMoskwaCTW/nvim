local lsp_zero = require("lsp-zero")
-- local notify = require("notify")

local vim = vim

require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = {
		"tsserver",
		"rust_analyzer",
		"gopls",
		"volar",
		"ruff",
	},
	handlers = {
		lsp_zero.default_setup,
	},
})

local cmp = require("cmp")
local cmp_format = lsp_zero.cmp_format()

lsp_zero.on_attach(function(client, bufnr)
	-- Print
	-- notify({
	--   client.name
	-- }, "info", {
	--   title = "LSP 1",
	--   timeout = 100,
	-- })
	local opts = { buffer = bufnr, remap = false }
	vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<cr>", opts)

	vim.keymap.set("n", "gd", function()
		vim.lsp.buf.definition()
	end, opts)
	vim.keymap.set("n", "K", function()
		vim.lsp.buf.hover()
	end, opts)
	vim.keymap.set("n", "<leader>vws", function()
		vim.lsp.buf.workspace_symbol()
	end, opts)
	vim.keymap.set("n", "<leader>vd", function()
		vim.diagnostic.open_float()
	end, opts)
	vim.keymap.set("n", "[d", function()
		vim.diagnostic.goto_next()
	end, opts)
	vim.keymap.set("n", "]d", function()
		vim.diagnostic.goto_prev()
	end, opts)
	vim.keymap.set("n", "<leader>va", function()
		vim.lsp.buf.code_action()
	end, opts)
	vim.keymap.set("n", "<leader>vrr", function()
		vim.lsp.buf.references()
	end, opts)
	vim.keymap.set("n", "<leader>vrn", function()
		vim.lsp.buf.rename()
	end, opts)
	vim.keymap.set("i", "<C-h>", function()
		vim.lsp.buf.signature_help()
	end, opts)
end)

-- lsp_zero.setup()
cmp.setup({
	formatting = cmp_format,
	mapping = cmp.mapping.preset.insert({
		-- scroll up and down the documentation window
		["<C-u>"] = cmp.mapping.scroll_docs(-1),
		["<C-d>"] = cmp.mapping.scroll_docs(1),
		-- Select completion by pressing enter
		["<CR>"] = cmp.mapping.confirm({ select = true }),
	}),
})

vim.diagnostic.config({
	virtual_text = true,
})

local npm_prefix = vim.fn.system("npm prefix -g")
npm_prefix = string.gsub(npm_prefix, "\n", "")

-- Specific LSP configuration to make Volar work with typescript support
require("lspconfig").volar.setup({
	filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "json" },
	init_options = {
		typescript = {
			-- tsdk = "/opt/homebrew/lib/node_modules/typescript/lib",
			tsdk = npm_prefix .. "/lib/node_modules/typescript/lib",
		},
	},
})
require("lspconfig").tsserver.setup({
	init_options = {
		plugins = {
			{
				name = "@vue/typescript-plugin",
				-- location = "/opt/homebrew/lib/node_modules/@vue/typescript-plugin",
				location = npm_prefix .. "/lib/node_modules/@vue/typescript-plugin",
				languages = { "javascript", "typescript", "vue" },
			},
		},
	},
	filetypes = {
		"javascript",
		"typescript",
		"vue",
	},
})

local lspconfig = require("lspconfig")
local cmp_nvim_lsp = require("cmp_nvim_lsp")
local capabilities = cmp_nvim_lsp.default_capabilities()
local opts = { noremap = true, silent = true }
local on_attach = function(_, bufnr)
	opts.buffer = bufnr

	opts.desc = "Show line diagnostics"
	vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

	opts.desc = "Show documentation for what is under cursor"
	vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
end

lspconfig["sourcekit"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})
