-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.8',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  use({
	'rose-pine/neovim',
	as = 'rose-pine',
	config = function()
		vim.cmd('colorscheme rose-pine-dawn')
	end
  })

  use {
	  'nvim-treesitter/nvim-treesitter',
	  run = function()
		  local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
		  ts_update()
	  end,
  }
  use('nvim-treesitter/playground')

  use('theprimeagen/harpoon')
  use('theprimeagen/vim-be-good')

  use('mbbill/undotree')

  use({'hrsh7th/nvim-cmp'})
  use({'hrsh7th/cmp-nvim-lsp'})
  use {
	  "williamboman/mason.nvim",
	  "williamboman/mason-lspconfig.nvim",
	  "neovim/nvim-lspconfig",
  }
  use({"stevearc/oil.nvim"})

  use({"tpope/vim-dadbod"})
  use({"kristijanhusak/vim-dadbod-ui"})
  use({"kristijanhusak/vim-dadbod-completion"})

  use({"Hoffs/omnisharp-extended-lsp.nvim"})

  use({"jlcrochet/vim-razor"})

  use({"mg979/vim-visual-multi"})
end)
