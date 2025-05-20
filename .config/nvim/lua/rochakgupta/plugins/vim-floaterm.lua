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
    vim.g.floatterm_fzf_layout = {
      window = {
        width = 0.5,
        height = 0.5,
      },
    }
  end,
  config = function()
    vim.keymap.set('n', '<leader>st', ':Floaterms<CR>', { desc = 'Floaterm: Search terminals' })
    vim.keymap.set('n', '<leader>o', ':FloatermNew --name=scratch --title=scratch<CR>', { desc = 'Floaterm: Open scratch terminal' })
    vim.keymap.set('n', '<leader>l', ':FloatermNew --name=lazygit --title=lazygit lazygit<CR>', { desc = 'Floaterm: Open lazygit' })
    vim.keymap.set('n', '<leader>L', ':FloatermNew --name=lazygit-yadm --title=lazygit-yadm yadm enter lazygit<CR>', { desc = 'Floaterm: Open lazygit (yadm)' })
    vim.keymap.set('n', '<leader>v', ':FloatermNew --name=vifm --title=vifm vifm<CR>', { desc = 'Floaterm: Open vifm' })
    vim.keymap.set('t', '<C-t>', '<C-\\><C-n>:FloatermHide<CR>', { desc = 'Floaterm: Hide terminal' })
    vim.keymap.set('n', '<C-t>', ':FloatermShow<CR>', { desc = 'Floaterm: Show terminal' })
    vim.keymap.set('t', '<C-]>', '<C-\\><C-n>:FloatermNext<CR>', { desc = 'Floaterm: Next terminal' })
    vim.keymap.set('t', '<C-[>', '<C-\\><C-n>:FloatermPrev<CR>', { desc = 'Floaterm: Previous terminal' })
    vim.keymap.set('t', '<C-x>', '<C-\\><C-n>:FloatermKill<CR>', { desc = 'Floaterm: Kill terminal' })
    vim.keymap.set('n', '<C-x>', ':FloatermKill!<CR>', { desc = 'Floaterm: Kill all terminals' })
    vim.keymap.set('t', '<C-g>', '<C-\\><C-n>:set number! relativenumber!<CR>A', { desc = 'Floaterm: Toggle line numbers' })
  end,
}
