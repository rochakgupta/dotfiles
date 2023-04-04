return {
  {
    -- Floating terminal
    'voldikss/vim-floaterm',
    dependencies = {
      {
        'junegunn/fzf',
        build = ':call fzf#install()',
      },
      'voldikss/fzf-floaterm',
    },
    init = function()
      vim.g.floaterm_width = 0.9
      vim.g.floaterm_height = 0.9
      vim.g.floaterm_opener = 'edit'
      vim.g.floaterm_autohide = 2
    end,
    config = function()
      vim.keymap.set('n', '<leader>st', ':Floaterms<CR>', { desc = '[S]earch [T]erminals' })
      vim.keymap.set('n', '<leader>o', ':FloatermNew --name=default --title=default<CR>', { desc = '[O]pen Default Terminal' })
      vim.keymap.set('n', '<leader>l', ':FloatermNew --name=lazygit --title=lazygit lazygit<CR>', { desc = 'Open [L]azygit Terminal' })
      vim.keymap.set('n', '<leader>v', ':FloatermNew --name=vifm --title=vifm vifm<CR>', { desc = 'Open [V]ifm Terminal' })
      vim.keymap.set('t', '<leader>t', '<C-\\><C-n>:FloatermHide<CR>', { desc = 'Hide [T]erminal' })
      vim.keymap.set('n', '<leader>t', ':FloatermShow<CR>', { desc = 'Show [T]erminal' })
    end,
  },
}
