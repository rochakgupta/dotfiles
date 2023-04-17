-- Set leaders first
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set config before lazy
require('rochakgupta.config')

-- Install and setup lazy
require('rochakgupta.lazy')

-- Set colorscheme after lazy
vim.cmd.colorscheme(require('rochakgupta.settings').colorscheme)
