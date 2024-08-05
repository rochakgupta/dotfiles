return {
  'vim-scripts/ReplaceWithRegister',
  init = function()
    vim.keymap.set('n', '<leader>r', '<Plug>ReplaceWithRegisterOperator', { desc = 'ReplaceWithRegister: Replace operator' })
    vim.keymap.set('n', '<leader>rr', '<Plug>ReplaceWithRegisterLine', { desc = 'ReplaceWithRegister: Replace line' })
    vim.keymap.set('x', '<leader>r', '<Plug>ReplaceWithRegisterVisual', { desc = 'ReplaceWithRegister: Replace visual' })
  end,
}
