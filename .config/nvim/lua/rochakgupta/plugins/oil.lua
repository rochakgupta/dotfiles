return {
  'stevearc/oil.nvim',
  config = function()
    local height_ratio = 0.85
    local width_ratio = 0.25
    local screen_w = vim.opt.columns:get()
    local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
    local window_w = screen_w * width_ratio
    local window_h = screen_h * height_ratio
    local window_w_int = math.floor(window_w)
    local window_h_int = math.floor(window_h)

    require('oil').setup({
      columns = {},
      win_options = {
        number = true,
        relativenumber = true,
      },
      use_default_keymaps = false,
      keymaps = {
        ['g?'] = 'actions.show_help',
        ['<CR>'] = 'actions.select',
        ['<C-\\>'] = 'actions.select_vsplit',
        ['<C-s>'] = 'actions.select_split',
        ['<C-t>'] = 'actions.select_tab',
        ['<C-p>'] = 'actions.preview',
        ['<C-q>'] = 'actions.close',
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
        max_width = window_w_int,
        max_height = window_h_int,
        border = vim.g.rg_border,
        win_options = {
          winblend = 0,
        },
      },
    })
    vim.keymap.set('n', '-', require('oil').open_float, { desc = 'Oil: Open parent directory' })
  end,
}
