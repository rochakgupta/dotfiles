-- Install lazy package manager
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Lazy requires leaders to be set before it is setup
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Setup lazy
require('lazy').setup('rochakgupta.plugins', {
  ui = {
    border = require('rochakgupta.config.settings').border,
  },
})

-- Options
require('rochakgupta.config.options')

-- Keymaps
require('rochakgupta.config.keymaps')

-- Autocmds
require('rochakgupta.config.autocmds')

-- UI options
require('rochakgupta.config.ui')

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
