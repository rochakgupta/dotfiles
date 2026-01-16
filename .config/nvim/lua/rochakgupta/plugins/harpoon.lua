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
    end, { desc = 'Harpoon: Add file' })

    vim.keymap.set('n', '[h', function()
      harpoon:list():prev()
    end, { desc = 'Harpoon: Previous file' })
    vim.keymap.set('n', ']h', function()
      harpoon:list():next()
    end, { desc = 'Harpoon: Next file' })

    vim.keymap.set('n', '<leader>hu', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = 'Harpoon: Toggle UI' })

    for id = 1, 5 do
      vim.keymap.set('n', '<leader>h' .. id, function()
        harpoon:list():select(id)
      end, { desc = 'Harpoon: Open file [' .. id .. ']' })
    end
  end,
}
