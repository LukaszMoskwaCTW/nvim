local lsp_zero = require("lsp-zero")
local util = require("lspconfig.util")

local vim = vim

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

local volar_init_options = {
	typescript = {
		tsdk = "",
	},
}

lspconfig.volar.setup({
	filetypes = { "vue" },
	cmd = { "vue-language-server", "--stdio" },
	root_dir = util.root_pattern("package.json"),
	init_options = volar_init_options,
	on_new_config = function(new_config, new_root_dir)
		if
			new_config.init_options
			and new_config.init_options.typescript
			and new_config.init_options.typescript.tsdk == ""
		then
			new_config.init_options.typescript.tsdk = util.get_typescript_server_path(new_root_dir)
		end
	end,
})

lspconfig.ts_ls.setup({
	init_options = {
		plugins = {
			{
				name = "@vue/typescript-plugin",
				location = npm_prefix .. "/lib/node_modules/@vue/language-server",
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
	-- Check the configuration file in the folder
	--[[ settings = {
		pyright = {
			disableOrganizeImports = true, -- Using Ruff
		},
		python = {
			analysis = {
				ignore = { "*" }, -- Using Ruff
				typeCheckingMode = "off", -- Using mypy
			},
		},
	}, ]]
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
	root_dir = function(fname)
		return require("lspconfig").util.root_pattern(".git")(fname)
			or require("lspconfig").util.root_pattern("Project.swift")(fname)
	end,
	capabilities = {
		workspace = {
			didChangeWatchedFiles = {
				dynamicRegistration = true,
			},
		},
	},

	on_attach = on_attach,
})

require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = {
		"ts_ls",
		"rust_analyzer",
		"gopls",
		"ruff",
		"pyright",
	},
})
