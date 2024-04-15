local settings = require('rochakgupta.settings')
local utils = require('rochakgupta.utils')

return {
  {
    -- Statusline
    'nvim-lualine/lualine.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
      {
        'linrongbin16/lsp-progress.nvim',
        cond = function()
          return settings.lsp_progress
        end,
        opts = {
          max_size = 50,
          client_format = function(client_name, _, series_messages)
            -- Overidden to remove spinner as it breaks lualine
            return #series_messages > 0 and ('[' .. client_name .. '] ' .. table.concat(series_messages, ', ')) or nil
          end,
        },
      },
    },
    config = function()
      local jdt = {}

      jdt.prefix = 'jdt://'
      jdt.shortened_prefix = 'j//'

      function jdt.is_path(path)
        return utils.has_prefix(path, jdt.prefix)
      end

      function jdt.is_shortened_path(path)
        return utils.has_prefix(path, jdt.shortened_prefix)
      end

      function jdt.clean_suffix(suffix)
        suffix = suffix:gsub('[%%][%w][%w]', '')
        -- Delete remaining % due to escaping of %5C, %3C, etc to %%5C, %%3C, etc
        suffix = suffix:gsub('[%%]', '')
        -- Delete extra / caused by fragments who have now become empty due to above deletions
        suffix = suffix:gsub('[%/][%/]', '/')
        return suffix
      end

      function jdt.clean_path(path)
        if not jdt.is_path(path) then
          return path
        end
        local suffix = path:sub(#jdt.prefix + 1)
        return jdt.prefix .. jdt.clean_suffix(suffix)
      end

      function jdt.clean_shortened_path(path)
        if not jdt.is_shortened_path(path) then
          return path
        end
        local suffix = path:sub(#jdt.shortened_prefix + 1)
        return jdt.shortened_prefix .. jdt.clean_suffix(suffix)
      end

      local filename = {
        'filename',
        path = 1,
        fmt = function(str)
          -- Bug in lualine causes jdt URI to break lualine. So, handling them myself.
          -- https://github.com/nvim-lualine/lualine.nvim/issues/820
          -- path = 1, so str is just the relative path with initial fragments shortened to a single character
          if jdt.is_shortened_path(str) then
            return jdt.clean_shortened_path(str)
          end
          return str
        end,
        -- cond = function()
        --   -- Bug in lualine causes jdt URI to break lualine. So, disabling it for them.
        --   -- https://github.com/nvim-lualine/lualine.nvim/issues/820
        --   local buf = vim.fn.expand('%')
        --   return not jdt.is_path(buf)
        -- end,
      }

      local tabs = {
        'tabs',
        mode = 2,
        fmt = function(str)
          -- mode = 2, so str is just the name of the file
          local buf = vim.fn.expand('%')
          if jdt.is_path(buf) then
            return jdt.clean_suffix(str)
          end
          return str
        end,
      }

      local windows = {
        'windows',
        mode = 2,
        fmt = function(str)
          -- mode = 2, so str is just the name of the file
          local buf = vim.fn.expand('%')
          if jdt.is_path(buf) then
            return jdt.clean_suffix(str)
          end
          return str
        end,
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
          component_separators = '',
          section_separators = '',
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = { 'branch', 'diff', 'diagnostics' },
          lualine_c = { filename },
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
  },
}
