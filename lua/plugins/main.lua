return {
	"nvim-lua/plenary.nvim",
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	"loctvl842/monokai-pro.nvim",
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v4.x",
		dependencies = {
			-- LSP Support
			"neovim/nvim-lspconfig",
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"hrsh7th/nvim-cmp", -- Required
			"hrsh7th/cmp-nvim-lsp", -- Required
			"L3MON4D3/LuaSnip", -- Required
		},
	},

	"nvim-treesitter/nvim-treesitter-context",
	"mbbill/undotree",
	{
		"stevearc/oil.nvim",
		---@module 'oil'
		---@type oil.SetupOpts
		opts = {},
		-- Optional dependencies
		-- dependencies = { { "echasnovski/mini.icons", opts = {} } },
		dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
	},
	"github/copilot.vim",
	"prisma/vim-prisma",
	"mhinz/vim-signify",
	-- "tpope/vim-commentary",
	"tpope/vim-fugitive",
	"tpope/vim-surround",
	"chentoast/marks.nvim",

	-- File explorer icons
	"nvim-tree/nvim-web-devicons",
	-- Git status
	"lewis6991/gitsigns.nvim",
	-- Buffer navigation tabline
	"romgrk/barbar.nvim",
	"christoomey/vim-tmux-navigator",
	"windwp/nvim-autopairs",

	{
		"kawre/leetcode.nvim",
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
		},
	},
	-- Test
	"vim-test/vim-test",

	-- Formatter
	-- "elentok/format-on-save.nvim")
	"stevearc/conform.nvim",
	-- "prettier/vim-prettier",

	-- Debugger
	{
		"folke/todo-comments.nvim",
		dependencies = "nvim-lua/plenary.nvim",
	},
	{
		"folke/trouble.nvim",
		tag = "v3.6.0",
		dependencies = "nvim-tree/nvim-web-devicons",
	},
	-- Add support for scala
	{ "scalameta/nvim-metals", dependencies = { "nvim-lua/plenary.nvim" } },
	{
		"echasnovski/mini.nvim",
	},
	-- Comments in .vue files (template, css, ts)
	"JoosepAlviste/nvim-ts-context-commentstring",
	-- Commenting
	"numToStr/Comment.nvim",
}
