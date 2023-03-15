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
vim.o.guicursor = ''

-- Enable cursor line
vim.o.cursorline = true

-- Set scroll offset
vim.o.scrolloff = 8

-- Enable cursor column
-- vim.opt.cursorcolumn = true

-- Change how auto formatting is done
vim.opt.formatoptions:remove { 'c', 'r', 'o', 't' }

-- Make buffer hidden when it is abandoned
vim.o.hidden = true

-- Do not create swap files
vim.o.swapfile = false

-- Automatically save undo history to an undo file when writing a buffer to a file
vim.o.undofile = true

-- Set colorscheme
vim.cmd.colorscheme 'tokyonight'
