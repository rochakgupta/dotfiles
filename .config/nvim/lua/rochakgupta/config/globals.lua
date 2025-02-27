-- UI --
vim.g.rg_background = 'dark'
vim.g.rg_border = 'single'
vim.g.rg_color = 'tokyonight'
vim.g.rg_colorscheme = vim.g.rg_color
vim.g.rg_transparent = false

-- Plugins --
vim.g.rg_not_started_by_firenvim = not vim.g.started_by_firenvim

-- Completion
vim.g.rg_blink = vim.g.rg_not_started_by_firenvim and vim.version().minor >= 10
vim.g.rg_nvim_cmp = vim.g.rg_not_started_by_firenvim and not vim.g.rg_blink

-- Picker
vim.g.rg_fzf_lua = false
vim.g.rg_snacks_picker = not vim.g.rg_fzf_lua

-- Explorer
vim.g.rg_nvim_tree = false
vim.g.rg_snacks_explorer = not vim.g.rg_nvim_tree

-- Progress
vim.g.rg_fidget = false
vim.g.rg_lsp_progress = true

-- Indent line
vim.g.rg_indent_blankline = vim.g.rg_not_started_by_firenvim
vim.g.rg_snacks_indent = vim.g.rg_not_started_by_firenvim and not vim.g.rg_indent_blankline

-- Others
vim.g.rg_gitlinker = true
vim.g.rg_gitsigns = vim.g.rg_not_started_by_firenvim -- Buggy and not needed in firenvim, so disabling
vim.g.rg_lualine = vim.g.rg_not_started_by_firenvim
vim.g.rg_sleuth = false
vim.g.rg_yanky = true

-- Plugin specific --
vim.g.rg_plantuml_local = true

-- Log level --
vim.g.rg_log_level = vim.log.levels.OFF

-- Leaders --
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
