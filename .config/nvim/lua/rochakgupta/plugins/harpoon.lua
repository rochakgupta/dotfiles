return {
  {
    -- Faster file navigation
    'ThePrimeagen/harpoon',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      vim.keymap.set('n', '<leader>ha', require('harpoon.mark').add_file, { desc = '[H]arpoon [A]dd file' })
      vim.keymap.set('n', '<leader>hu', require('harpoon.ui').toggle_quick_menu, { desc = '[H]arpoon [U]I' })
      for id = 1, 5 do
        vim.keymap.set('n', '<leader>h' .. id, function()
          require('harpoon.ui').nav_file(id)
        end, { desc = '[H]arpoon File [' .. id .. ']' })
      end
    end,
  },
}
