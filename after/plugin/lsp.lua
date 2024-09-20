local lsp_zero = require("lsp-zero")

local vim = vim

-- Helper function to check file size
local function file_size_is_too_big(bufnr)
	local max_filesize = 1001 -- Set limit to 11,000 lines
	local line_count = vim.api.nvim_buf_line_count(bufnr)
	if line_count > max_filesize then
		return true
	end
	return false
end

local function custom_on_init(client, bufnr)
	if file_size_is_too_big(bufnr) then
		-- Stop the LSP from attaching to this buffer
		client.stop()
		print("File too big for LSP (" .. line_count .. " lines)")
		return
	end
end

local lsp_attach = function(client, bufnr)
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
end

local npm_prefix = vim.fn.system("npm prefix -g")
npm_prefix = string.gsub(npm_prefix, "\n", "")

-- Specific LSP configuration to make Volar work with typescript support
local lspconfig = require("lspconfig")
local cmp_nvim_lsp = require("cmp_nvim_lsp")
local capabilities = vim.lsp.protocol.make_client_capabilities()

lsp_zero.extend_lspconfig({
	sign_text = true,
	lsp_attach = lsp_attach,
	capabilities = capabilities,
})

lspconfig.volar.setup({
	filetypes = { "vue" },
})
lspconfig.ts_ls.setup({
	init_options = {
		plugins = {
			{
				name = "@vue/typescript-plugin",
				location = npm_prefix .. "/lib/node_modules/@vue/typescript-plugin",
				languages = { "javascript", "typescript", "vue" },
			},
		},
	},
	filetypes = {
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
		"vue",
	},
})

lspconfig.pyright.setup({
	root_dir = function(fname)
		return require("lspconfig").util.root_pattern(".git")(fname)
			or require("lspconfig").util.root_pattern("pyproject.toml")(fname)
			or require("lspconfig").util.root_pattern("setup.py")(fname)
			or require("lspconfig").util.root_pattern("setup.cfg")(fname)
			or require("lspconfig").util.root_pattern("requirements.txt")(fname)
			or require("lspconfig").util.root_pattern("Pipfile")(fname)
			or require("lspconfig").util.root_pattern("poetry.lock")(fname)
			or require("lspconfig").util.root_pattern("pyrightconfig.json")(fname)
	end,
})

lspconfig.gopls.setup({
	cmd = { "gopls", "serve" },
	root_dir = function(fname)
		return require("lspconfig").util.root_pattern(".git")(fname)
			or require("lspconfig").util.root_pattern("go.mod")(fname)
			or require("lspconfig").util.root_pattern("go.sum")(fname)
	end,
})

lspconfig.ruff.setup({
	root_dir = function(fname)
		return require("lspconfig").util.root_pattern(".git")(fname)
			or require("lspconfig").util.root_pattern("pyproject.toml")(fname)
			or require("lspconfig").util.root_pattern("setup.py")(fname)
			or require("lspconfig").util.root_pattern("setup.cfg")(fname)
			or require("lspconfig").util.root_pattern("requirements.txt")(fname)
			or require("lspconfig").util.root_pattern("Pipfile")(fname)
			or require("lspconfig").util.root_pattern("poetry.lock")(fname)
			or require("lspconfig").util.root_pattern("pyrightconfig.json")(fname)
	end,
})

local opts = { noremap = true, silent = true }
local on_attach = function(_, bufnr)
	opts.buffer = bufnr

	opts.desc = "Show line diagnostics"
	vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

	opts.desc = "Show documentation for what is under cursor"
	vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
end

lspconfig.sourcekit.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	on_init = custom_on_init,
})

require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = {
		"ts_ls",
		"rust_analyzer",
		"gopls",
		"volar",
		"ruff",
		"pyright",
	},
})
