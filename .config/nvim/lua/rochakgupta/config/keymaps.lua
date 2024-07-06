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

-- Keymaps to resize windows
vim.keymap.set('n', '<C-.>', '<C-w><', { desc = 'Decrease size of window' })
vim.keymap.set('n', '<C-/>', '<C-w>>', { desc = 'Increase size of window' })
vim.keymap.set('n', '<C-;>', '<C-W>+', { desc = 'Decrease size of window' })
vim.keymap.set('n', "<C-'>", '<C-W>-', { desc = 'Increase size of window' })

-- Quickfix list keymaps
vim.keymap.set('n', ']q', ':cnext<CR>', { desc = 'Go to next item in quickfix list' })
vim.keymap.set('n', '[q', ':cprevious<CR>', { desc = 'Go to previous item in quickfix list' })
vim.keymap.set('n', ']Q', ':clast<CR>', { desc = 'Go to last item in quickfix list' })
vim.keymap.set('n', '[Q', ':cfirst<CR>', { desc = 'Go to first item in quickfix list' })
vim.keymap.set('n', '<leader>q', function()
  local qf_exists = false
  for _, win in pairs(vim.fn.getwininfo()) do
    if win['quickfix'] == 1 then
      qf_exists = true
    end
  end
  if qf_exists == true then
    vim.cmd('cclose')
  else
    vim.cmd('copen')
  end
end, { desc = 'Toggle quickfix list' })

-- Move groups of lines up and down with J and K
-- Disabled as K is already bound to vim.lsp.buf.hover()
-- vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
-- vim.keymap.set('v', 'K', ":m '>-2<CR>gv=gv")

-- Keep the line in the center while using C-d, C-u, C-f and C-b
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Scroll down and center' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Scroll up and center' })
vim.keymap.set('n', '<C-f>', '<C-f>zz', { desc = 'Scroll page down and center' })
vim.keymap.set('n', '<C-b>', '<C-b>zz', { desc = 'Scroll page up and center' })

-- Keep the search result in center while jumping to next and previous result using n and N and *
vim.keymap.set('n', 'n', 'nzz', { desc = 'Go to next match and center' })
vim.keymap.set('n', 'N', 'Nzz', { desc = 'Go to previous match and center' })
vim.keymap.set('n', '*', '*zz', { desc = 'Go to next cursor match and center' })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>df', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
