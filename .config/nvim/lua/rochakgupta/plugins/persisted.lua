return {
  'olimorris/persisted.nvim',
  init = function()
    vim.keymap.set('n', '<leader>R', '<cmd>SessionLoad<CR>', { desc = 'Persisted: Load session' })
  end,
  config = function()
    require('persisted').setup({
      autoload = false,
      follow_cwd = true,
    })
  end,
}
