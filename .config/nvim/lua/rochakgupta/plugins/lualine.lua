local utils = require('rochakgupta.utils')

return {
  'nvim-lualine/lualine.nvim',
  cond = not vim.g.started_by_firenvim,
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    {
      'linrongbin16/lsp-progress.nvim',
      cond = vim.g.rg_lsp_progress,
      opts = {
        max_size = 100,
        client_format = function(client_name, _, series_messages)
          -- Overidden to remove spinner as it breaks lualine
          return #series_messages > 0 and ('[' .. client_name .. '] ' .. table.concat(series_messages, ' | ')) or nil
        end,
      },
    },
    'dhruvasagar/vim-zoom', -- Configured in vim-zoom.lua
  },
  config = function()
    local filename = {
      'filename',
      path = 1,
      -- Disable vim mode color changes
      -- color = 'lualine_a_normal',
    }

    local tabs = {
      'tabs',
      mode = 2,
    }

    local windows = {
      'windows',
      mode = 2,
    }

    local sections_lualine_x = { 'encoding', 'fileformat', 'filetype' }
    if vim.g.rg_lsp_progress then
      table.insert(sections_lualine_x, 1, function()
        return require('lsp-progress').progress()
      end)
    end

    require('lualine').setup({
      options = {
        icons_enabled = true,
        theme = vim.g.rg_colorscheme,
        disabled_filetypes = {
          statusline = utils.non_filetypes,
          winbar = utils.non_filetypes,
        },
        component_separators = '',
        section_separators = '',
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { "vim.fn['zoom#statusline']()", filename },
        lualine_x = sections_lualine_x,
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
      },
      inactive_sections = {
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
      },
      tabline = {
        lualine_a = { windows },
        lualine_z = { tabs },
      },
    })
  end,
}
