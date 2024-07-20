-- automatically ensure lazy is installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- [[ Basic Keymaps ]]
-- Set <space> as the default map leader
-- See :help mapleader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("lazy").setup({
    -- colorschemes
  { "catppuccin/nvim", name = "catppuccin" },

    -- file explorer
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons", lazy=true }
  },

  -- status line
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons", lazy = true }
  },

  -- tab line
  'kdheepak/tabline.nvim',

    -- fuzzy searcher
  {
    "nvim-telescope/telescope.nvim", branch = "0.1.x",
    dependencies = { "nvim-lua/plenary.nvim" }
  },

  "numToStr/Comment.nvim", -- Commenting
  "windwp/nvim-autopairs", -- For auto pairing braces

  -- Git tools
  "tpope/vim-fugitive",
  { 'sindrets/diffview.nvim', dependencies = 'nvim-lua/plenary.nvim' },

})

