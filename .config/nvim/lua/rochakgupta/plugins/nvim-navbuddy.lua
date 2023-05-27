return {
  {
    -- Navigate and perform actions on symbols with ease
    'SmiteshP/nvim-navbuddy',
    dependencies = {
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
        -- Manually attached in nvim-lspconfig
        -- lsp = {
        --   auto_attach = true,
        -- },
      })
      vim.keymap.set('n', '<leader>n', ':Navbuddy<CR>', { desc = 'Open [N]avbuddy', silent = true })
    end,
  },
}
