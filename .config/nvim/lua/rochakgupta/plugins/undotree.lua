return {
  'mbbill/undotree',
  init = function()
    vim.g.undotree_SetFocusWhenToggle = 1
  end,
  config = function()
    vim.keymap.set('n', '<leader>U', vim.cmd.UndotreeToggle, { desc = 'Undotree: Toggle' })
  end,
}
