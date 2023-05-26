return {
  {
    'stevearc/oil.nvim',
    config = function()
      require('oil').setup({
        columns = {},
        win_options = {
          number = false,
          relativenumber = false,
        },
        use_default_keymaps = false,
        keymaps = {
          ['g?'] = 'actions.show_help',
          ['<CR>'] = 'actions.select',
          ['<C-v>'] = 'actions.select_vsplit',
          ['<C-s>'] = 'actions.select_split',
          ['<C-t>'] = 'actions.select_tab',
          ['<C-p>'] = 'actions.preview',
          ['<ESC>'] = 'actions.close',
          ['<C-r>'] = 'actions.refresh',
          ['-'] = 'actions.parent',
          ['_'] = 'actions.open_cwd',
          ['`'] = 'actions.cd',
          ['~'] = 'actions.tcd',
          ['g.'] = 'actions.toggle_hidden',
        },
        view_options = {
          show_hidden = true,
        },
        float = {
          max_width = 50,
          max_height = 50,
          border = require('rochakgupta.settings').border,
          win_options = {
            winblend = 0,
          },
        },
      })
      vim.keymap.set('n', '-', require('oil').open_float, { desc = 'Open parent directory' })
    end,
  },
}
