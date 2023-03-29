return {
  {
    'ThePrimeagen/harpoon',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      vim.keymap.set('n', '<leader>ha', require('harpoon.mark').add_file, { desc = '[H]arpoon [A]dd file' })
      vim.keymap.set('n', '<leader>hu', require('harpoon.ui').toggle_quick_menu, { desc = '[H]arpoon [U]I' })
      vim.keymap.set('n', '<leader>hj', require('harpoon.ui').nav_next, { desc = '[H]arpoon [J] Next file' })
      vim.keymap.set('n', '<leader>hk', require('harpoon.ui').nav_prev, { desc = '[H]arpoon [K] Previous file' })
      for id = 1, 9 do
        vim.keymap.set('n', '<leader>h' .. id, function()
          require('harpoon.ui').nav_file(id)
        end, { desc = '[H]arpoon File [' .. id .. ']' })
      end
    end,
  },
}
