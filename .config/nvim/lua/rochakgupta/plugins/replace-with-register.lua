return {
  'vim-scripts/ReplaceWithRegister',
  init = function()
    vim.keymap.set('n', '<leader>r', '<Plug>ReplaceWithRegisterOperator', { desc = 'Replace with register operator' })
    vim.keymap.set('n', '<leader>rr', '<Plug>ReplaceWithRegisterLine', { desc = 'Replace with register line' })
    vim.keymap.set('x', '<leader>r', '<Plug>ReplaceWithRegisterVisual', { desc = 'Replace with register visual' })
  end,
}
