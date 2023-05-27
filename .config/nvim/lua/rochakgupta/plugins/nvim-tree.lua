return {
  {
    -- File explorer
    'nvim-tree/nvim-tree.lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    keys = {
      { '<leader>x', '<cmd>NvimTreeToggle<CR>', desc = 'Toggle NvimTree' },
    },
    init = function()
      -- vim.g.loaded_netrw = 1
      -- vim.g.loaded_netrwPlugin = 1
    end,
    config = function()
      require('nvim-tree').setup {
        hijack_netrw = false,
        hijack_cursor = true,
        respect_buf_cwd = true,
        sync_root_with_cwd = true,
        update_focused_file = {
          enable = true,
        },
        view = {
          width = function()
            local width_ratio = 0.25
            return math.floor(vim.opt.columns:get() * width_ratio)
          end,
          float = {
            enable = true,
            open_win_config = function()
              local height_ratio = 0.85
              local width_ratio = 0.25
              local screen_w = vim.opt.columns:get()
              local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
              local window_w = screen_w * width_ratio
              local window_h = screen_h * height_ratio
              local window_w_int = math.floor(window_w)
              local window_h_int = math.floor(window_h)
              local center_x = (screen_w - window_w) / 2
              local center_y = ((vim.opt.lines:get() - window_h) / 2) - vim.opt.cmdheight:get()
              return {
                border = require('rochakgupta.settings').border,
                relative = 'editor',
                row = center_y,
                col = center_x,
                width = window_w_int,
                height = window_h_int,
              }
            end,
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
      }
    end,
  },
}
