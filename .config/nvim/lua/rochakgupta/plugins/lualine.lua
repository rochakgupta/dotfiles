return {
  {
    -- Statusline
    'nvim-lualine/lualine.nvim',
    config = function()
      local filename = {
        {
          'filename',
          path = 1,
        },
      }

      local tabs = {
        {
          'tabs',
          mode = 2,
        },
      }

      local windows = {
        {
          'windows',
          mode = 2,
        },
      }

      local navic = {
        {
          function()
            return require('nvim-navic').get_location()
          end,
          cond = function()
            return require('nvim-navic').is_available()
          end,
        },
      }

      require('lualine').setup({
        options = {
          icons_enabled = true,
          theme = require('rochakgupta.settings').colorscheme,
        },
        sections = {
          lualine_c = require('rochakgupta.settings').navic and navic or filename,
        },
        tabline = {
          lualine_a = windows,
          lualine_z = tabs,
        },
        extensions = { 'nvim-tree' },
      })
    end,
  },
}
