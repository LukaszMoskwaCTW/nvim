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
  use('tpope/vim-fugitive')
  use('vim-test/vim-test')
  use('wfxr/minimap.vim')
  use('preservim/nerdtree')
  use('voldikss/vim-floaterm')
  use('vim-airline/vim-airline')
  use('vim-airline/vim-airline-themes')
  use('github/copilot.vim')
  use('prettier/vim-prettier',
  { autoformat = 1, autoformat_require_pragma = 0 }
  )
  use('Mofiqul/vscode.nvim')
  use('tpope/vim-commentary')


end)

