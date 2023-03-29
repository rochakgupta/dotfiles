return {
  {
    'tiagovla/tokyodark.nvim',
    priority = 1000,
    lazy = true,
    init = function()
      vim.g.tokyodark_transparent_background = true
      vim.g.tokyodark_enable_italic_comment = true
      vim.g.tokyodark_enable_italic = false
    end,
  },
}
