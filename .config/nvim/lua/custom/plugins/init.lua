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
    'folke/zen-mode.nvim',
    config = function()
      require('zen-mode').setup({
        window = {
          width = 140,
        },
      })
      vim.keymap.set('n', '<leader>z', '<cmd>ZenMode<CR>', { desc = 'Toggle [Z]en Mode' })
    end,
  },

  {
    'fedepujol/move.nvim',
    config = function()
      local opts = { noremap = true, silent = true }
      vim.keymap.set('n', '<leader>j', ':MoveLine(1)<CR>', opts)
      vim.keymap.set('n', '<leader>k', ':MoveLine(-1)<CR>', opts)

      vim.keymap.set('v', '<leader>j', ':MoveBlock(1)<CR>', opts)
      vim.keymap.set('v', '<leader>k', ':MoveBlock(-1)<CR>', opts)
    end,
  },

  {
    'ThePrimeagen/harpoon',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('harpoon').setup({})
      vim.keymap.set('n', '<leader>ha', require('harpoon.mark').add_file, { desc = '[H]arpoon [A]dd file' })
      vim.keymap.set('n', '<leader>hu', require('harpoon.ui').toggle_quick_menu, { desc = '[H]arpoon [U]I' })
      vim.keymap.set('n', '<leader>hj', require('harpoon.ui').nav_next, { desc = '[H]arpoon [J] Next file' })
      vim.keymap.set('n', '<leader>hk', require('harpoon.ui').nav_prev, { desc = '[H]arpoon [K] Previous file' })
      for id = 1, 9 do
        vim.keymap.set('n', '<leader>h' .. id, function()
          require('harpoon.ui').nav_file(id)
        end, { desc = '[H]arpoon File [' .. id .. ']' })
      end
    end,
  },

  {
    'voldikss/vim-floaterm',
    config = function()
      vim.g.floaterm_width = 0.9
      vim.g.floaterm_height = 0.9
      vim.g.floaterm_opener = 'edit'
      vim.g.floaterm_autohide = 2

      vim.keymap.set({ 'n', 't' }, '<leader>t', ':FloatermToggle<CR>', { desc = 'Toggle Floaterm' })
      vim.keymap.set('n', '<leader>l', ':FloatermNew --name=lazygit lazygit<CR>', { desc = 'Open [L]azygit Floaterm' })
      vim.keymap.set('n', '<leader>v', ':FloatermNew --name=vifm vifm<CR>', { desc = 'Open [V]ifm Floaterm' })
    end,
  },

  {
    'SmiteshP/nvim-navic',
    dependencies = { 'neovim/nvim-lspconfig' },
    config = function()
      -- vim.b.navic_lazy_update_context = true
    end,
  },

  {
    'SmiteshP/nvim-navbuddy',
    dependencies = {
      'neovim/nvim-lspconfig',
      'SmiteshP/nvim-navic',
      'MunifTanjim/nui.nvim',
    },
    config = function()
      require('nvim-navbuddy').setup({
        window = {
          border = 'rounded',
        },
      })
      vim.keymap.set('n', '<leader>n', require('nvim-navbuddy').open, { desc = 'Open [N]avbuddy' })
    end,
  },

  {
    'mbbill/undotree',
    config = function()
      vim.g.undotree_SetFocusWhenToggle = 1
      vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)
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

  {
    'Mofiqul/vscode.nvim',
    config = function()
      local c = require('vscode.colors').get_colors()
      require('vscode').setup({
        transparent = true,
        italic_comments = true,
        disable_nvimtree_bg = true,
        color_overrides = {
          vscLineNumber = '#FFFFFF',
        },
        group_overrides = {
          Cursor = { fg = c.vscDarkBlue, bg = c.vscLightGreen, bold = true },
        },
      })
      require('vscode').load()
    end,
  },
}
