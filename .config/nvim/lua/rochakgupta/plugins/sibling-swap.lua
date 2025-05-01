return {
  'Wansmer/sibling-swap.nvim',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
  },
  keys = {
    {
      '<leader>A',
      function()
        require('sibling-swap').swap_with_left()
      end,
      desc = 'SiblingSwap: Swap with left sibling',
    },
    {
      '<leader>a',
      function()
        require('sibling-swap').swap_with_right()
      end,
      desc = 'SiblingSwap: Swap with right sibling',
    },
  },
  config = function()
    require('sibling-swap').setup({
      use_default_keymaps = false,
    })
  end,
}
