return {
  {
    -- Distraction free writing
    'folke/zen-mode.nvim',
    config = function()
      require('zen-mode').setup({
        window = {
          width = 120,
        },
      })
      vim.keymap.set('n', '<leader>z', '<cmd>ZenMode<CR>', { desc = 'Toggle [Z]en Mode' })
    end,
  },
}