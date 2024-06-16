-- Set config before lazy
require('rochakgupta.config')

-- Install and setup lazy
require('rochakgupta.lazy')

-- Set colorscheme after lazy
vim.cmd.colorscheme(vim.g.rg_colorscheme)
