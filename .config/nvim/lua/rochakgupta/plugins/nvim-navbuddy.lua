return {
  'SmiteshP/nvim-navbuddy',
  dependencies = {
    'SmiteshP/nvim-navic',
    'MunifTanjim/nui.nvim',
    {
      'nvim-telescope/telescope.nvim', -- Configured in telescope.lua
      cond = vim.g.rg_telescope,
    },
  },
  config = function()
    local actions = require('nvim-navbuddy.actions')

    local mappings = {
      ['<Down>'] = actions.next_sibling(),
      ['<Up>'] = actions.previous_sibling(),
      ['<Left>'] = actions.parent(),
      ['<Right>'] = actions.children(),
    }

    if vim.g.rg_telescope then
      mappings = vim.tbl_extend('force', mappings, {
        ['t'] = actions.telescope(require('telescope.config').values),
      })
    end

    require('nvim-navbuddy').setup({
      window = {
        border = vim.g.rg_border,
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
      mappings = mappings,
      lsp = {
        auto_attach = true,
      },
    })
    vim.keymap.set('n', '<leader>n', ':Navbuddy<CR>', { desc = 'Navbuddy: Open', silent = true })
  end,
}
