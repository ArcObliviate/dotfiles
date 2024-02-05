local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

local packer = require("packer")

packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}
return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use "ellisonleao/gruvbox.nvim"

  use 'numToStr/Comment.nvim'

  use "windwp/nvim-autopairs"
  use "windwp/nvim-ts-autotag"

  use "kylechui/nvim-surround"
  use { "nvim-treesitter/nvim-treesitter", run = 'TSUpdate' }

  use {'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons'}

  use "lukas-reineke/indent-blankline.nvim"

  use "neovim/nvim-lspconfig"

  use "williamboman/mason.nvim"

  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)


