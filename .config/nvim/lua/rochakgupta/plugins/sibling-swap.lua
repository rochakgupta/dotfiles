return {
  'Wansmer/sibling-swap.nvim',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
  },
  config = function()
    require('sibling-swap').setup({
      use_default_keymaps = false,
    })
    vim.keymap.set('n', '<C-h>', require('sibling-swap').swap_with_left, { desc = 'Swap with left sibling' })
    vim.keymap.set('n', '<C-l>', require('sibling-swap').swap_with_right, { desc = 'Swap with right sibling' })
  end,
}
