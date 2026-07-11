-- UI --
vim.g.rg_background = 'dark'
vim.g.rg_border = 'single'
vim.g.rg_color = 'tokyonight'
vim.g.rg_colorscheme = vim.g.rg_color
vim.g.rg_transparent = false

-- Plugins --
vim.g.rg_not_firenvim = not vim.g.started_by_firenvim

-- Completion
vim.g.rg_blink = false
vim.g.rg_nvim_cmp = vim.g.rg_not_firenvim and not vim.g.rg_blink

-- Picker
vim.g.rg_fzf_lua = false
vim.g.rg_snacks_picker = not vim.g.rg_fzf_lua

-- Explorer
vim.g.rg_nvim_tree = true
vim.g.rg_snacks_explorer = true

-- Progress
vim.g.rg_fidget = true
vim.g.rg_lsp_progress = false

-- Indent line
vim.g.rg_indent_blankline = vim.g.rg_not_firenvim
vim.g.rg_snacks_indent = vim.g.rg_not_firenvim and not vim.g.rg_indent_blankline

-- Illuminate
vim.g.rg_illuminate = false
vim.g.rg_snacks_words = not vim.g.rg_illuminate

-- Markdown Preview
vim.g.rg_markdown_preview = true
vim.g.rg_mpls = not vim.g.rg_markdown_preview

-- Others
vim.g.rg_gitlinker = true
vim.g.rg_gitsigns = vim.g.rg_not_firenvim -- Buggy and not needed in firenvim, so disabling
vim.g.rg_lualine = vim.g.rg_not_firenvim
vim.g.rg_sleuth = false
vim.g.rg_guess_indent = false
vim.g.rg_yanky = true

-- Log level --
vim.g.rg_log_level = vim.log.levels.OFF

-- Leaders --
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
