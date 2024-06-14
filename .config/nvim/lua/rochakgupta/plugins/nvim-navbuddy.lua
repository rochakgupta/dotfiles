return {
  'SmiteshP/nvim-navbuddy',
  dependencies = {
    'SmiteshP/nvim-navic', -- Configured in nvim-navic.lua
    'MunifTanjim/nui.nvim',
    'nvim-telescope/telescope.nvim', -- Configured in telescope.lua
  },
  config = function()
    local actions = require('nvim-navbuddy.actions')
    require('nvim-navbuddy').setup({
      window = {
        border = require('rochakgupta.settings').border,
        size = { height = '75%', width = '90%' },
        sections = {
          left = {
            size = '20%',
          },
          mid = {
            size = '30%',
          },
          right = {
            preview = 'always',
          },
        },
      },
      mappings = {
        ['<Down>'] = actions.next_sibling(),
        ['<Up>'] = actions.previous_sibling(),
        ['<Left>'] = actions.parent(),
        ['<Right>'] = actions.children(),
        ['t'] = actions.telescope(require('telescope.config').values),
      },
      lsp = {
        auto_attach = true,
      },
    })
    vim.keymap.set('n', '<leader>n', ':Navbuddy<CR>', { desc = 'Open [N]avbuddy', silent = true })
  end,
}
