return {
  {
    -- File explorer
    'nvim-tree/nvim-tree.lua',
    dependencies = {
      {
        'nvim-tree/nvim-web-devicons',
        opts = {},
      },
    },
    keys = {
      { '<leader>x', '<cmd>NvimTreeToggle<CR>', desc = 'Toggle NvimTree' },
    },
    init = function()
      -- vim.g.loaded_netrw = 1
      -- vim.g.loaded_netrwPlugin = 1
    end,
    config = function()
      local width = 30
      require('nvim-tree').setup({
        hijack_netrw = false,
        hijack_cursor = true,
        update_focused_file = {
          enable = true,
        },
        view = {
          width = width,
          float = {
            enable = false,
            open_win_config = {
              relative = 'win',
              border = require('rochakgupta.settings').border,
              width = width,
            },
          },
        },
        renderer = {
          highlight_git = true,
          icons = {
            show = {
              git = false,
            },
          },
          full_name = true,
        },
      })
    end,
  },
}
