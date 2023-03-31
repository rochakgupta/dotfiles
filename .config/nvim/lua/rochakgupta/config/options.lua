-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
-- vim.o.clipboard = 'unnamed,unnamedplus'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
-- vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 50
vim.o.timeout = true
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noinsert,noselect'

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true

-- Open horizontal split below
vim.o.splitbelow = true

-- Open vertical split right
vim.o.splitright = true

-- Show search result as you type
vim.o.incsearch = true

-- Enable relative numbers
vim.wo.relativenumber = true

-- Number of spaces a tab counts for
vim.o.tabstop = 4

-- Number of spaces a tab counts for while performing editing operations
vim.o.softtabstop = 4

-- A tab infront of the line inserts spaces
vim.o.smarttab = true

-- Number of spaces to use for each step of (auto)indent
vim.o.shiftwidth = 4

-- Insert spaces for tabs
vim.o.expandtab = true

-- Smart autoindenting when starting a new line
vim.o.autoindent = true

-- Disable line wrap
vim.o.wrap = false

-- Disable thin cursor in insert mode
vim.o.guicursor = 'a:block'

-- Enable cursor line
vim.o.cursorline = true

-- Set scroll offset
vim.o.scrolloff = 8

-- Enable cursor column
-- vim.o.cursorcolumn = true

-- Change how auto formatting is done
vim.opt.formatoptions:remove({ 'c', 'r', 'o', 't' })

-- Make buffer hidden when it is abandoned
vim.o.hidden = true

-- Do not create swap files
vim.o.swapfile = false

-- Automatically save undo history to an undo file when writing a buffer to a file
vim.o.undofile = true

-- Set colorscheme
vim.cmd.colorscheme(require('rochakgupta.settings').colorscheme)
