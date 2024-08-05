return {
  'vim-scripts/ReplaceWithSameIndentRegister',
  init = function()
    vim.keymap.set('n', '<leader>RR', '<Plug>ReplaceWithSameIndentRegisterLine', { desc = 'ReplaceWithSameIndentRegister: Replace line' })
    vim.keymap.set('x', '<leader>R', '<Plug>ReplaceWithSameIndentRegisterVisual', { desc = 'ReplaceWithSameIndentRegister: Replace visual' })
  end,
}
