return {
  {
    -- File explorer
    'nvim-tree/nvim-tree.lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    lazy = true,
    keys = {
      { '<leader>x', '<cmd>NvimTreeToggle<CR>', desc = 'Toggle NvimTree' },
    },
    init = function()
      -- vim.g.loaded_netrw = 1
      -- vim.g.loaded_netrwPlugin = 1
    end,
    config = function()
      require('nvim-tree').setup({
        hijack_netrw = false,
        hijack_cursor = true,
        update_focused_file = {
          enable = true,
        },
        modified = {
          enable = true,
        },
        renderer = {
          full_name = true,
        },
      })
    end,
  },
}
