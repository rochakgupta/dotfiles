return {
  {
    -- Move block of lines with correct indent
    'fedepujol/move.nvim',
    config = function()
      local opts = { noremap = true, silent = true }
      vim.keymap.set('n', '<leader>j', ':MoveLine(1)<CR>', opts)
      vim.keymap.set('n', '<leader>k', ':MoveLine(-1)<CR>', opts)
      vim.keymap.set('v', '<leader>j', ':MoveBlock(1)<CR>', opts)
      vim.keymap.set('v', '<leader>k', ':MoveBlock(-1)<CR>', opts)
    end,
  },
}
