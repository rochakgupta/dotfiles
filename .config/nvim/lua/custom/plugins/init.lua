-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'goolord/alpha-nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      local alpha = require('alpha')
      local dashboard = require('alpha.themes.dashboard')
      dashboard.section.buttons.val = {
        dashboard.button('e', '  New file', '<cmd>ene <CR>'),
        dashboard.button('c', '  Config', ':e ~/.config/nvim/init.lua <CR>'),
        dashboard.button('q', '  Quit', ':qa <CR>'),
      }
      alpha.setup(dashboard.config)
    end,
  },

  'tpope/vim-surround',

  'easymotion/vim-easymotion',

  {
    'ojroques/nvim-osc52',
    config = function()
      vim.keymap.set('n', '<leader>y', require('osc52').copy_operator, { expr = true })
      vim.keymap.set('n', '<leader>yy', '<leader>y_', { remap = true })
      vim.keymap.set('v', '<leader>y', require('osc52').copy_visual)
    end,
  },

  {
    'jay-babu/mason-null-ls.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      'williamboman/mason.nvim',
      'jose-elias-alvarez/null-ls.nvim',
    },
    config = function()
      local null_ls = require('null-ls')
      local formatting = null_ls.builtins.formatting
      null_ls.setup({
        sources = {
          formatting.black,
          formatting.stylua,
          formatting.prettierd,
        },
      })
      require('mason-null-ls').setup({
        ensure_installed = nil,
        automatic_installation = true,
        automatic_setup = false,
      })
    end,
  },

  {
    'vifm/vifm.vim',
    config = function()
      -- vim.g.loaded_netrw = 1
      -- vim.g.loaded_netrwPlugin = 1
      vim.g.vifm_embed_term = 1
      vim.g.vifm_embed_split = 1
      vim.keymap.set('n', '<leader>v', '<cmd>Vifm<CR>')
    end,
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
          enable = true,
        },
      })
      -- vim.g.loaded_netrw = 1
      -- vim.g.loaded_netrwPlugin = 1
      vim.keymap.set('n', '<leader>x', '<cmd>NvimTreeToggle<CR>')
    end,
  },

  {
    'folke/tokyonight.nvim',
    priority = 1000,
    lazy = true,
    config = function()
      require('tokyonight').setup({
        style = 'night',
        transparent = true,
        styles = {
          keywords = { italic = false },
          sidebars = 'transparent',
          floats = 'transparent',
        },
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
      vim.g.tokyodark_enable_italic = false
    end,
  },

  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    lazy = true,
    config = function()
      require('catppuccin').setup({
        transparent_background = true,
        term_colors = true,
        styles = {
          conditionals = {},
        },
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
        disable_italics = true,
      })
    end,
  },

  {
    'sainnhe/gruvbox-material',
    priority = 1000,
    lazy = true,
    config = function()
      vim.g.gruvbox_material_background = 'hard'
      vim.g.gruvbox_material_palette = 'material'
      vim.g.gruvbox_material_ui_contrast = 'high'
      vim.g.gruvbox_material_transparent_background = 1
      vim.g.gruvbox_material_better_performance = 1
    end,
  },

  {
    'marko-cerovac/material.nvim',
    priority = 1000,
    lazy = true,
    config = function()
      require('material').setup({
        contrast = {
          sidebars = true,
          floating_windows = true,
        },
        styles = {
          comments = { italic = true },
        },
        plugins = {
          'gitsigns',
          'indent-blankline',
          'nvim-cmp',
          'nvim-tree',
          'nvim-web-devicons',
          'telescope',
          'which-key',
        },
        disable = {
          colored_cursor = true,
          background = true,
        },
        lualine_style = 'stealth',
      })
      vim.g.material_style = 'deep ocean'
    end,
  },
}
