local utils = require('rochakgupta.utils')

-- Remap space as leader key
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Make CTRL-C behave exactly like ESC
vim.keymap.set('i', '<C-c>', '<Esc>')

-- Clear highlight on search upon pressing CTRL-C in normal mode
vim.keymap.set('n', '<C-c>', '<cmd>nohlsearch<CR>')

--  Use CTRL+<hjkl> to switch between windows
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Keymap to toggle line numbers
vim.keymap.set('n', '<C-g>', ':set number! relativenumber!<CR>', { desc = 'Toggle line numbers' })

-- Quickfix/Location list keymaps
local last_list_type = 'quickfix'
vim.keymap.set('n', '<leader>q', function()
  local windows = vim.fn.getwininfo()
  for _, win in pairs(windows) do
    if win.loclist == 1 then
      vim.cmd('lclose')
      last_list_type = 'location'
      return
    end
    if win.quickfix == 1 then
      vim.cmd('cclose')
      last_list_type = 'quickfix'
      return
    end
  end

  if last_list_type == 'location' and #vim.fn.getloclist(0) > 0 then
    vim.cmd('lopen')
    return
  end
  if last_list_type == 'quickfix' and #vim.fn.getqflist() > 0 then
    vim.cmd('copen')
    return
  end
end, { desc = 'Close quickfix/location list' })

-- Move groups of lines up and down with J and K
-- Disabled as K is already bound to vim.lsp.buf.hover()
-- vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
-- vim.keymap.set('v', 'K', ":m '>-2<CR>gv=gv")

-- Keep the line in the center while using C-d, C-u, C-f and C-b
-- vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Scroll down and center' })
-- vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Scroll up and center' })
-- vim.keymap.set('n', '<C-f>', '<C-f>zz', { desc = 'Scroll page down and center' })
-- vim.keymap.set('n', '<C-b>', '<C-b>zz', { desc = 'Scroll page up and center' })

-- Keep the search result in center while jumping to next and previous result using n and N and *
-- vim.keymap.set('n', 'n', 'nzz', { desc = 'Go to next match and center' })
-- vim.keymap.set('n', 'N', 'Nzz', { desc = 'Go to previous match and center' })
-- vim.keymap.set('n', '*', '*zz', { desc = 'Go to next cursor match and center' })

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>df', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })

-- Delete buffers backing files which:
-- 1. Do not exist
-- 2. Exist outside current working directory
vim.keymap.set('n', '<leader>cb', function()
  utils.delete_buffers_without_files()
  utils.delete_buffers_outside_cwd()
end, { desc = 'Cleanup Buffers' })
