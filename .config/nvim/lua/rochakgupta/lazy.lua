-- Install
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

-- Setup
require('lazy').setup('rochakgupta.plugins', {
  change_detection = {
    enabled = false,
  },
  ui = {
    border = vim.g.rg_border,
  },
})

vim.keymap.set('n', '<leader><leader>', require('lazy').home, { desc = 'Lazy: Open' })
