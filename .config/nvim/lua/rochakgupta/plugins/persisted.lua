return {
  'olimorris/persisted.nvim',
  init = function()
    vim.keymap.set('n', '<leader>bs', '<cmd>SessionSave<CR>', { desc = '[S]ave session' })
    vim.keymap.set('n', '<leader>br', '<cmd>SessionLoad<CR>', { desc = '[R]estore session' })
    vim.keymap.set('n', '<leader>bd', '<cmd>SessionDelete<CR>', { desc = '[D]elete session' })
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
