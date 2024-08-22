return {
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
    vim.g.floaterm_giteditor = false
  end,
  config = function()
    vim.keymap.set('n', '<leader>st', ':Floaterms<CR>', { desc = 'Floaterm: Search terminals' })
    vim.keymap.set('n', '<leader>o', ':FloatermNew --name=default --title=default<CR>', { desc = 'Floaterm: Open default terminal' })
    vim.keymap.set('n', '<leader>l', ':FloatermNew --name=lazygit --title=lazygit lazygit<CR>', { desc = 'Floaterm: Open lazygit' })
    vim.keymap.set('n', '<leader>v', ':FloatermNew --name=vifm --title=vifm vifm<CR>', { desc = 'Floaterm: Open vifm' })
    vim.keymap.set('t', '<C-t>', '<C-\\><C-n>:FloatermHide<CR>', { desc = 'Floaterm: Hide terminal' })
    vim.keymap.set('n', '<C-t>', ':FloatermShow<CR>', { desc = 'Floaterm: Show terminal' })
  end,
}
