return {
  'Wansmer/treesj',
  keys = { '<space>j' },
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
  },
  config = function()
    require('treesj').setup({
      use_default_keymaps = false,
      max_join_length = 1000,
    })
    vim.keymap.set('n', '<leader>j', require('treesj').toggle, { desc = 'Toggle [J]oin via treesj' })
  end,
}
