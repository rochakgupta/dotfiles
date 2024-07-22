-- Enable 24-bit RGB colors
vim.o.termguicolors = true

-- Set background
vim.o.background = vim.g.rg_background

-- Set highlight on search
vim.o.hlsearch = true

-- Enable line numbers
vim.wo.number = true

-- Enable relative line numbers
vim.wo.relativenumber = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
-- vim.o.clipboard = 'unnamed,unnamedplus'

-- Enable break indent
vim.o.breakindent = true

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

-- Open horizontal split below
vim.o.splitbelow = true

-- Open vertical split right
vim.o.splitright = true

-- Show hits as you type
vim.o.inccommand = 'nosplit'

-- Indentation guide: https://gist.github.com/LunarLambda/4c444238fb364509b72cfb891979f1dd

-- Insert spaces for tabs
vim.o.expandtab = true

-- Default number of spaces a tab counts for (detected automatically by vim-sleuth)
vim.o.tabstop = 4

-- Default number of spaces to use for each step of (auto)indent (detected automatically by vim-sleuth)
vim.o.shiftwidth = 4

-- Number of spaces a tab counts for while performing editing operations
vim.o.softtabstop = -1

-- A tab infront of the line inserts spaces
vim.o.smarttab = true

-- Smart autoindenting when starting a new line
vim.o.autoindent = true

-- Better block editing in visual mode
vim.o.virtualedit = 'block'

-- Disable line wrap
vim.o.wrap = false

-- Disable thin cursor in insert mode
vim.o.guicursor = 'a:block'

-- Enable cursor line
vim.o.cursorline = true

-- Set scroll offset
vim.o.scrolloff = 8
vim.o.sidescrolloff = 8

-- Enable cursor column
-- vim.o.cursorcolumn = true

-- Change how auto formatting is done
-- Disabled as it only works when set via autocmd
-- vim.opt.formatoptions:remove({ 'c', 'r', 'o', 't' })

-- Make buffer hidden when it is abandoned
vim.o.hidden = true

-- Do not create swap files
vim.o.swapfile = false

-- Automatically save undo history to an undo file when writing a buffer to a file
vim.o.undofile = true

-- Limit the maximum number of items to show in the popup menu
vim.o.pumheight = 15

-- Disable folds
vim.o.foldenable = false

-- Keep the topline the same when opening, closing or resizing horizontal splits
vim.o.splitkeep = 'topline'

-- Binary search is used as default to search through tag files. As such, they are expected to be sorted.
-- If not due to some reason, E432 "Tags file not sorted" error is raised. Disabling binary search to avoid
-- this error. Read more at https://neovim.io/doc/user/message.html.
vim.o.tagbsearch = false

-- Make jumplist behave like tagstack
vim.o.jumpoptions = 'stack'
