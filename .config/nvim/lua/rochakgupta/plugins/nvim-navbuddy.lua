return {
  {
    -- Navigate and perform actions on symbols with ease
    'SmiteshP/nvim-navbuddy',
    dependencies = {
      'neovim/nvim-lspconfig', -- Used and configured in nvim-lspconfig
      'SmiteshP/nvim-navic', -- Used and configured in nvim-navic
      'MunifTanjim/nui.nvim',
    },
    config = function()
      local actions = require('nvim-navbuddy.actions')
      require('nvim-navbuddy').setup({
        window = {
          border = 'rounded',
        },
        mappings = {
          ['<Down>'] = actions.next_sibling,
          ['<Up>'] = actions.previous_sibling,
          ['<Left>'] = actions.parent,
          ['<Right>'] = actions.children,
        },
      })
      vim.keymap.set('n', '<leader>n', require('nvim-navbuddy').open, { desc = 'Open [N]avbuddy' })
    end,
  },
}
