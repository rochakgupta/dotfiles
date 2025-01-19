return {
  'Wansmer/treesj',
  keys = { '<leader>j', '<leader>J' },
  dependencies = {
    'nvim-treesitter/nvim-treesitter', -- Configured in nvim-treesitter.lua
  },
  config = function()
    require('treesj').setup({
      use_default_keymaps = false,
      max_join_length = 1000,
    })
    vim.keymap.set('n', '<leader>j', require('treesj').toggle, { desc = 'Treesj: Toggle join' })
    vim.keymap.set('n', '<leader>J', function()
      require('treesj').toggle({ split = { recursive = true } })
    end, { desc = 'Treesj: Toggle recursive join' })
  end,
}
