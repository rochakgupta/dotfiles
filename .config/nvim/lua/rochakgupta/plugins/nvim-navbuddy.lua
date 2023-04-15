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
          border = require('rochakgupta.settings').border,
        },
        mappings = {
          ['<Down>'] = actions.next_sibling,
          ['<Up>'] = actions.previous_sibling,
          ['<Left>'] = actions.parent,
          ['<Right>'] = actions.children,
        },
        lsp = {
          auto_attach = true,
        },
      })
      vim.keymap.set('n', '<leader>n', ':Navbuddy<CR>', { desc = 'Open [N]avbuddy', silent = true })
    end,
  },
}
