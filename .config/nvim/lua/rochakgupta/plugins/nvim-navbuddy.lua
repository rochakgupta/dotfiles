return {
  {
    -- Navigate and perform actions on symbols with ease
    'SmiteshP/nvim-navbuddy',
    -- Uncomment if attaching automatically
    -- event = 'LspAttach',
    dependencies = {
      'SmiteshP/nvim-navic',
      'MunifTanjim/nui.nvim',
      'nvim-telescope/telescope.nvim', -- Used and configued in telescope
    },
    config = function()
      local actions = require('nvim-navbuddy.actions')
      require('nvim-navbuddy').setup({
        window = {
          border = require('rochakgupta.settings').border,
          size = { height = '75%', width = '75%' },
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
        -- Uncomment if attaching automatically
        -- lsp = {
        --   auto_attach = true,
        -- },
      })
      vim.keymap.set('n', '<leader>n', ':Navbuddy<CR>', { desc = 'Open [N]avbuddy', silent = true })
    end,
  },
}
