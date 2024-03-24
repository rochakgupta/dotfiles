return {
  'vim-scripts/ReplaceWithSameIndentRegister',
  init = function()
    vim.keymap.set('n', '<leader>RR', '<Plug>ReplaceWithSameIndentRegisterLine', { desc = 'Replace with same indent register line' })
    vim.keymap.set('x', '<leader>R', '<Plug>ReplaceWithSameIndentRegisterVisual', { desc = 'Replace with same indent register visual' })
  end,
}
