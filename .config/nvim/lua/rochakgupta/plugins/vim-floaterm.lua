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
    vim.keymap.set('n', '<leader>o', ':FloatermNew --name=scratch --title=scratch<CR>', { desc = 'Floaterm: Open scratch terminal' })
    vim.keymap.set('n', '<leader>l', ':FloatermNew --name=lazygit --title=lazygit lazygit<CR>', { desc = 'Floaterm: Open lazygit' })
    vim.keymap.set('n', '<leader>L', ':FloatermNew --name=lazygit-yadm --title=lazygit-yadm yadm enter lazygit<CR>', { desc = 'Floaterm: Open lazygit (yadm)' })
    vim.keymap.set('n', '<leader>v', ':FloatermNew --name=vifm --title=vifm vifm<CR>', { desc = 'Floaterm: Open vifm' })
    vim.keymap.set('t', '<C-t>', '<C-\\><C-n>:FloatermHide<CR>', { desc = 'Floaterm: Hide terminal' })
    vim.keymap.set('n', '<C-t>', ':FloatermShow<CR>', { desc = 'Floaterm: Show terminal' })
  end,
}
