vim.cmd.packadd("packer.nvim")

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")
	use("nvim-lua/plenary.nvim")
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.6",
		-- or                            , branch = '0.1.x',
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	use({
		"loctvl842/monokai-pro.nvim",
		config = function()
			require("monokai-pro").setup({
				filter = "pro",
			})
		end,
	})
	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		requires = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" }, -- Required
			{
				"williamboman/mason.nvim",
			},
			{
				"williamboman/mason-lspconfig.nvim",
			},
			-- Autocompletion
			{ "hrsh7th/nvim-cmp" }, -- Required
			{ "hrsh7th/cmp-nvim-lsp" }, -- Required
			{ "L3MON4D3/LuaSnip" }, -- Required
		},
	})

	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})

	use("nvim-treesitter/nvim-treesitter-context")
	use("mbbill/undotree")
	use("preservim/nerdtree")
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "nvim-tree/nvim-web-devicons", opt = true },
	})
	use("github/copilot.vim")
	use("prisma/vim-prisma")
	use("mhinz/vim-signify")
	use("tpope/vim-commentary")
	use("tpope/vim-fugitive")
	use("tpope/vim-surround")
	use("chentoast/marks.nvim")

	-- File explorer icons
	use("nvim-tree/nvim-web-devicons")
	-- Git status
	use("lewis6991/gitsigns.nvim")
	-- Buffer navigation tabline
	--
	use({
		"jose-elias-alvarez/null-ls.nvim",
		config = function()
			require("null-ls").setup()
		end,
		requires = { "nvim-lua/plenary.nvim" },
	})
	--
	use("romgrk/barbar.nvim", {
		config = function()
			require("bufferline").setup({ animation = false })
		end,
	})
	use("ryanoasis/vim-devicons")
	use("christoomey/vim-tmux-navigator")

	use({
		"akinsho/toggleterm.nvim",
		tag = "*",
		config = function()
			require("toggleterm").setup()
		end,
	})
	use("windwp/nvim-autopairs")

	use({
		"kawre/leetcode.nvim",
		requires = {
			"nvim-telescope/telescope.nvim",
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
		},
		build = {
			run = ":TSUpdate html",
		},
		config = function()
			require("leetcode").setup({
				arg = "l",
				-- directory = '$HOME/.leetcode',
				lang = "python3",
				-- workspace = '/Users/mofiqulislam/leetcode',
				-- workspace = '/Users/mofiqulislam/leetcode',
				-- workspace = '/Users/mofiqulislam/leetcode
			})
		end,
	})

	-- Test
	use("vim-test/vim-test")
	use("David-Kunz/jester")

	-- Formatter
	use("elentok/format-on-save.nvim")
	use("prettier/vim-prettier")

	-- Debugger
	use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } })
	use({
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("todo-comments").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	})
	use({
		"folke/trouble.nvim",
		requires = "nvim-tree/nvim-web-devicons",
		config = function()
			require("trouble").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	})
	-- Add support for scala
	use({ "scalameta/nvim-metals", requires = { "nvim-lua/plenary.nvim" } })
	use({
		"echasnovski/mini.nvim",
		config = function()
			require("mini.notify").setup()
		end,
	})

	-- use('sheerun/vim-polyglot')
	use("JoosepAlviste/nvim-ts-context-commentstring")
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})

	use("$HOME/git/depscope")
end)
