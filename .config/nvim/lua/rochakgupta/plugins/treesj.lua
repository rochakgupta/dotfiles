return {
  'Wansmer/treesj',
  keys = { '<leader>j' },
  dependencies = {
    'nvim-treesitter/nvim-treesitter', -- Configured in nvim-treesitter.lua
  },
  config = function()
    require('treesj').setup({
      use_default_keymaps = false,
      max_join_length = 1000,
    })
    vim.keymap.set('n', '<leader>j', require('treesj').toggle, { desc = 'Treesj: Toggle join' })
  end,
}
