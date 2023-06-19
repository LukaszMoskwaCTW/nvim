vim.cmd.packadd('packer.nvim')


return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.1',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }
  use({ 'rose-pine/neovim', 
  as = 'rose-pine',
  config = function()
	  -- vim.cmd('colorscheme rose-pine')
  end
  })
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
  use 'romgrk/barbar.nvim'
  use 'ryanoasis/vim-devicons'
  use 'christoomey/vim-tmux-navigator'

  use {"akinsho/toggleterm.nvim", tag = '*', config = function()
    require("toggleterm").setup()
  end}

end)

