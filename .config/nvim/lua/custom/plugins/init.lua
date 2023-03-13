-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'goolord/alpha-nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function ()
      require('alpha').setup(require('alpha.themes.startify').config)
    end
  },

  'tpope/vim-surround',

  'easymotion/vim-easymotion',

  {
    'ojroques/nvim-osc52',
    config = function()
      vim.keymap.set('n', '<leader>y', require('osc52').copy_operator, {expr = true})
      vim.keymap.set('n', '<leader>yy', '<leader>y_', {remap = true})
      vim.keymap.set('v', '<leader>y', require('osc52').copy_visual)
    end
  },

  {
    'vifm/vifm.vim',
    config = function()
      -- vim.g.loaded_netrw = 1
      -- vim.g.loaded_netrwPlugin = 1
      vim.g.vifm_embed_term = 1
      vim.g.vifm_embed_split = 1
      vim.keymap.set('n', '<leader>v', '<cmd>Vifm<CR>')
    end
  },

  {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require('nvim-tree').setup({
        hijack_netrw = false,
        hijack_cursor = true,
        update_focused_file = {
          enable = true
        }
      })
      -- vim.g.loaded_netrw = 1
      -- vim.g.loaded_netrwPlugin = 1
      vim.keymap.set('n', '<leader>x', '<cmd>NvimTreeToggle<CR>')
    end
  },

  {
    'folke/tokyonight.nvim',
    priority = 1000,
    lazy = true,
    config = function()
      require('tokyonight').setup({
        style = 'night',
        transparent = true,
      })
    end,
  },

  {
    'tiagovla/tokyodark.nvim',
    priority = 1000,
    lazy = true,
    config = function()
      vim.g.tokyodark_transparent_background = true
      vim.g.tokyodark_enable_italic_comment = true
      vim.g.tokyodark_enable_italic = true
    end
  },

  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    lazy = true,
    config = function()
      require('catppuccin').setup({
        transparent_background = true,
        term_colors = true,
      })
    end,
  },

  {
    'rose-pine/neovim',
    name = 'rose-pine',
    priority = 1000,
    lazy = true,
    config = function()
      require('rose-pine').setup({
        disable_background = true,
        disable_float_background = true,
      })
    end
  },

  {
    'rebelot/kanagawa.nvim',
    priority = 1000,
    lazy = true,
    config = function()
      require('kanagawa').setup({
        transparent = true,
        theme = 'dragon'
      })
    end
  },

  {
    'sainnhe/gruvbox-material',
    priority = 1000,
    lazy = true,
    config = function()
      vim.g.gruvbox_material_background = 'hard'
      vim.g.gruvbox_material_diagnostic_line_highlight = 1
      -- vim.g.gruvbox_material_disable_italic_comment = 1
      -- vim.g.gruvbox_material_enable_bold = 1
      vim.g.gruvbox_material_palette = 'material'
      -- vim.g.gruvbox_material_sign_column_background='none'
      vim.g.gruvbox_material_ui_contrast = 'high'
      vim.g.gruvbox_material_transparent_background = 1
    end
  },

  {
    'marko-cerovac/material.nvim',
    priority = 1000,
    lazy = true,
    config = function()
      require('material').setup({
        contrast = {
          floating_windows = true,
        },
        styles = {
          comments = { italic = true },
        },
        plugins = { -- Uncomment the plugins that you use to highlight them
          -- Available plugins:
          -- "dap",
          -- "dashboard",
          "gitsigns",
          -- "hop",
          "indent-blankline",
          -- "lspsaga",
          -- "mini",
          -- "neogit",
          -- "neorg",
          "nvim-cmp",
          -- "nvim-navic",
          -- "nvim-tree",
          -- "nvim-web-devicons",
          -- "sneak",
          "telescope",
          -- "trouble",
          "which-key",
        },
        disable = {
          colored_cursor = true
        },
      })
      vim.g.material_style = "deep ocean"
    end
  },
}
