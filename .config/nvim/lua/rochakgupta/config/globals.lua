-- Set my globals

-- UI
vim.g.rg_background = 'dark'
vim.g.rg_border = 'single'
vim.g.rg_color = 'tokyonight'
vim.g.rg_colorscheme = vim.g.rg_color
vim.g.rg_transparent = false

-- Plugins
vim.g.rg_telescope = false
vim.g.rg_fzf_lua = not vim.g.rg_telescope
vim.g.rg_fidget = false
vim.g.rg_lsp_progress = true
vim.g.rg_gitlinker = true
vim.g.rg_indent_blankline = true
vim.g.rg_sleuth = false
vim.g.rg_yanky = true

-- Plugin settings
vim.g.rg_plantuml_local = true

-- Log level
vim.g.rg_log_level = vim.log.levels.OFF

-- Set vim globals

-- Leaders
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
