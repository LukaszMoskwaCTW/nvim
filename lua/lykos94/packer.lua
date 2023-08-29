vim.cmd.packadd('packer.nvim')


return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.1',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }
  -- use({ 'rose-pine/neovim', 
  -- as = 'rose-pine',
  -- config = function()
	  -- -- vim.cmd('colorscheme rose-pine')
  -- end
  -- })
  use "rebelot/kanagawa.nvim"
  use {
    "loctvl842/monokai-pro.nvim",
    config = function()
      require("monokai-pro").setup({
        filter = "pro",
      })
    end
  }
  -- use { "ellisonleao/gruvbox.nvim" }
  use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v2.x',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},             -- Required
		  {                                      -- Optional
		  'williamboman/mason.nvim',
		  run = function()
			  pcall(vim.cmd, 'MasonUpdate')
		  end,
	  },
	  {'williamboman/mason-lspconfig.nvim'}, -- Optional

	  -- Autocompletion
	  {'hrsh7th/nvim-cmp'},     -- Required
	  {'hrsh7th/cmp-nvim-lsp'}, -- Required
	  {'L3MON4D3/LuaSnip'},     -- Required
  }
}


  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use('nvim-treesitter/playground')
  use('nvim-treesitter/nvim-treesitter-context')
  use('theprimeagen/harpoon')
  use('mbbill/undotree')
  use('vim-test/vim-test')
  use('wfxr/minimap.vim')
  use('preservim/nerdtree')
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }
  use('github/copilot.vim')
  use('prettier/vim-prettier')
  use('Mofiqul/vscode.nvim')
  use 'navarasu/onedark.nvim'
  use('prisma/vim-prisma')
  use('airblade/vim-gitgutter')
  use('tpope/vim-commentary')
  use('tpope/vim-fugitive')
  use('tpope/vim-surround')

  -- File explorer icons
  use 'nvim-tree/nvim-web-devicons'
  -- Git status
  use 'lewis6991/gitsigns.nvim' 
  -- Buffer navigation tabline
  --
  use('romgrk/barbar.nvim', {
    config = function ()
      require'bufferline'.setup{animation = false}
    end
  })
  use 'ryanoasis/vim-devicons'
  use 'christoomey/vim-tmux-navigator'

  use {"akinsho/toggleterm.nvim", tag = '*', config = function()
    require("toggleterm").setup()
  end}
  use "windwp/nvim-autopairs"

  use {
    'topaxi/gh-actions.nvim',
    cmd = 'GhActions',
    requires = {'nvim-lua/plenary.nvim', 'MunifTanjim/nui.nvim'},
    config = function()
      require('gh-actions').setup({})
    end,
  }
  use {
    'pwntester/octo.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
      'nvim-tree/nvim-web-devicons',
    },
    config = function ()
      -- require"octo".setup()
    end
  }

  -- Debugger
  use('folke/neodev.nvim')
  use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
  use 'David-Kunz/jester'
    use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }
   use {
    "folke/trouble.nvim",
    requires = "nvim-tree/nvim-web-devicons",
    config = function()
      require("trouble").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }
  use({
    "jackMort/ChatGPT.nvim",
    config = function()
      require("chatgpt").setup({
        api_key_cmd = "cat ~/.openai",
      })
    end,
    requires = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim"
    }
  })
  -- Add support for scala
  use({'scalameta/nvim-metals', requires = { "nvim-lua/plenary.nvim" }})


end)

