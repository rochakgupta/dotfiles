vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Make CTRL-C behave exactly like ESC
vim.keymap.set('i', '<C-c>', '<Esc>')

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

-- Keep the line in the center while using C-d and C-u
-- vim.keymap.set('n', '<C-d>', '<C-d>zz')
-- vim.keymap.set('n', '<C-u>', '<C-u>zz')

-- Keep the search result in center while jumping to next and previous result using n and N
-- vim.keymap.set('n', 'n', 'nzzzv')
-- vim.keymap.set('n', 'N', 'Nzzzv')

-- Use Leader-p to delete the selection to _ (black hole) register and replace it in place with contents of unnamed register
vim.keymap.set('x', '<leader>p', '"_dp')

-- Use Leader-d to delete the selection to _ (black hole) register
vim.keymap.set({ 'n', 'v' }, '<leader>d', '"_d')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
