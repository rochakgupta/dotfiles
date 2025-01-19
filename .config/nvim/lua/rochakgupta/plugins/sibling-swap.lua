return {
  'Wansmer/sibling-swap.nvim',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
  },
  config = function()
    require('sibling-swap').setup({
      use_default_keymaps = false,
    })
    vim.keymap.set('n', '<leader>A', require('sibling-swap').swap_with_left, { desc = 'SiblingSwap: Swap with left sibling' })
    vim.keymap.set('n', '<leader>a', require('sibling-swap').swap_with_right, { desc = 'SiblingSwap: Swap with right sibling' })
  end,
}
