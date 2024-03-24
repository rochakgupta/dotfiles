local settings = require('rochakgupta.settings')

return {
  {
    -- Statusline
    'nvim-lualine/lualine.nvim',
    cond = function()
      return settings.lualine
    end,
    dependencies = {
      'nvim-tree/nvim-web-devicons',
      {
        'linrongbin16/lsp-progress.nvim',
        cond = function()
          return settings.lsp_progress
        end,
        opts = {
          max_size = 50,
          client_format = function(client_name, spinner, series_messages)
            -- Overidden to remove spinner as it breaks lualine
            return #series_messages > 0 and ('[' .. client_name .. '] ' .. table.concat(series_messages, ', ')) or nil
          end,
        },
      },
    },
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

      local sections_lualine_x = { 'encoding', 'fileformat', 'filetype' }
      if settings.lsp_progress then
        table.insert(sections_lualine_x, 1, require('lsp-progress').progress)
      end

      require('lualine').setup({
        options = {
          icons_enabled = true,
          theme = settings.colorscheme,
          disabled_filetypes = { 'NvimTree' },
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = { 'branch', 'diff', 'diagnostics' },
          lualine_c = filename,
          lualine_x = sections_lualine_x,
          lualine_y = { 'progress' },
          lualine_z = { 'location' },
        },
        inactive_sections = {
          lualine_c = { 'filename' },
          lualine_x = { 'location' },
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
