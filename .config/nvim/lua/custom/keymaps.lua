-- Make CTRL-C behave exactly like ESC
vim.keymap.set('i', '<C-c>', '<Esc>')

-- Move groups of lines up and down with J and K
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
