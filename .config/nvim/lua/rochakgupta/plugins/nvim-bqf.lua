return {
  'kevinhwang91/nvim-bqf',
  ft = 'qf',
  dependencies = {
    'nvim-treesitter/nvim-treesitter', -- Configured in nvim-treesitter.lua
  },
  opts = {
    auto_resize_height = true,
    show_title = false,
    preview = {
      winblend = 0,
      auto_preview = false,
    },
    func_map = {
      pscrollup = '<C-u>',
      pscrolldown = '<C-d>',
    },
  },
}
