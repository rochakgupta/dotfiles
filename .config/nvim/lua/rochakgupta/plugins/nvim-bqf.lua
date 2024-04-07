return {
  'kevinhwang91/nvim-bqf',
  ft = 'qf',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
  },
  opts = {
    auto_resize_height = true,
    show_title = false,
    preview = {
      winblend = 0,
      -- auto_preview = false,
    },
    func_map = {
      pscrollup = '<C-u>',
      pscrolldown = '<C-d>',
    },
    filter = {
      fzf = {
        extra_opts = { '--bind', 'ctrl-o:toggle-all,ctrl-l:clear-query' },
      },
    },
  },
}
