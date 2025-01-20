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
      default_file_explorer = false,
      columns = {},
      win_options = {
        number = true,
        relativenumber = true,
      },
      delete_to_trash = true,
      lsp_file_methods = {
        autosave_changes = true,
      },
      use_default_keymaps = false,
      keymaps = {
        ['g?'] = { 'actions.show_help', mode = 'n' },
        ['<CR>'] = 'actions.select',
        ['L'] = 'actions.select',
        ['<C-s>'] = { 'actions.select', opts = { horizontal = true } },
        ['<C-\\>'] = { 'actions.select', opts = { vertical = true } },
        ['<C-p>'] = 'actions.preview',
        ['<leader>m'] = { 'actions.close', mode = 'n' },
        ['<C-l>'] = 'actions.refresh',
        ['H'] = { 'actions.parent', mode = 'n' },
        ['_'] = { 'actions.open_cwd', mode = 'n' },
        ['`'] = { 'actions.cd', mode = 'n' },
        ['~'] = { 'actions.cd', opts = { scope = 'tab' }, mode = 'n' },
        ['gx'] = 'actions.open_external',
        ['g.'] = { 'actions.toggle_hidden', mode = 'n' },
        ['g\\'] = { 'actions.toggle_trash', mode = 'n' },
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
    vim.keymap.set('n', '<leader>m', require('oil').open_float, { desc = 'Oil: Open parent directory' })
  end,
}
