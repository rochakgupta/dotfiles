return {
  {
    -- Floating terminal
    'voldikss/vim-floaterm',
    init = function()
      vim.g.floaterm_width = 0.9
      vim.g.floaterm_height = 0.9
      vim.g.floaterm_opener = 'edit'
      vim.g.floaterm_autohide = 2
    end,
    config = function()
      vim.keymap.set('n', '<leader>t', ':FloatermToggle<CR>', { desc = 'Toggle Floaterm' })
      vim.keymap.set('t', '<leader>t', '<C-\\><C-n>:FloatermToggle<CR>', { desc = 'Toggle Floaterm' })
      vim.keymap.set('n', '<leader>l', ':FloatermNew --name=lazygit lazygit<CR>', { desc = 'Open [L]azygit Floaterm' })
      vim.keymap.set('n', '<leader>v', ':FloatermNew --name=vifm vifm<CR>', { desc = 'Open [V]ifm Floaterm' })
    end,
  },
}
