return {
  {
    'nvim-lualine/lualine.nvim',
    opts = {
      options = {
        icons_enabled = true,
        theme = require('rochakgupta.config.settings').colorscheme,
      },
      sections = {
        lualine_c = {
          {
            function()
              return require('nvim-navic').get_location()
            end,
            cond = function()
              return require('nvim-navic').is_available()
            end,
          },
        },
      },
      tabline = {
        lualine_a = {
          {
            'filename',
            path = 1,
          },
        },
        lualine_z = {
          {
            'windows',
          },
        },
      },
      extensions = { 'nvim-tree' },
    },
  },
}
