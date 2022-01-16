local fn = vim.fn
local execute = vim.api.nvim_command

local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
end

local packer = require("packer")
local use = packer.use


-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]
-- Only if your version of Neovim doesn't have https://github.com/neovim/neovim/pull/12632 merged
-- vim._update_package_paths()

packer.startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- You can alias plugin names
  use {'dracula/vim', as = 'dracula'}


  -- Post-install/update hook with neovim command
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  -- Use specific branch, dependency and run lua file after load
  -- use {
  --   'glepnir/galaxyline.nvim', branch = 'main', config = function() require( 'statusline' ) end,
  --   requires = {'kyazdani42/nvim-web-devicons'}
  -- }

  use { 'embark-theme/vim', as = 'embark' }
end)


vim.cmd("autocmd BufWritePost plugins.lua PackerCompile")
