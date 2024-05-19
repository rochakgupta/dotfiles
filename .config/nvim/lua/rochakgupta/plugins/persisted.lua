return {
  'olimorris/persisted.nvim',
  init = function()
    vim.keymap.set('n', '<leader>S', '<cmd>SessionSave<CR>', { desc = '[S]ave session' })
    vim.keymap.set('n', '<leader>L', '<cmd>SessionLoad<CR>', { desc = '[L]oad session' })
  end,
  config = function()
    require('persisted').setup({
      silent = true,
      autosave = false,
      autoload = false,
      follow_cwd = true,
    })
  end,
}
