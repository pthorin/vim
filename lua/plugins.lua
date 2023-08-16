vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {'dracula/vim', as = 'dracula'}

  use {
    'pwntester/octo.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
      'nvim-tree/nvim-web-devicons',
    },
    config = function ()
      require"octo".setup()
    end
  }

  use { "folke/tokyonight.nvim", as = 'tokyonight' }
  use { "catppuccin/nvim", as = "catppuccin" }
end)
