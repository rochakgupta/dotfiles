return {
  'lewis6991/gitsigns.nvim',
  dependencies = {
    {
      'purarue/gitsigns-yadm.nvim',
      opts = {},
    },
  },
  cond = vim.g.rg_gitsigns,
  opts = {
    signs = {
      add = { text = '+' },
      change = { text = '~' },
      delete = { text = '_' },
      topdelete = { text = '‾' },
      changedelete = { text = '~' },
    },
    _on_attach_pre = function(_, callback)
      require('gitsigns-yadm').yadm_signs(callback)
    end,
  },
}
