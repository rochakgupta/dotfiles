return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  -- https://github.com/ThePrimeagen/harpoon/issues/577
  commit = 'e76cb03',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  config = function()
    local harpoon = require('harpoon')

    harpoon:setup()

    vim.keymap.set('n', '<leader>ha', function()
      harpoon:list():add()
    end, { desc = '[H]arpoon [A]dd file' })
    vim.keymap.set('n', '<leader>hu', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = '[H]arpoon [U]I' })

    for id = 1, 5 do
      vim.keymap.set('n', '<leader>h' .. id, function()
        harpoon:list():select(id)
      end, { desc = '[H]arpoon File [' .. id .. ']' })
    end
  end,
}
