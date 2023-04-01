return {
  {
    -- Colorscheme
    'tiagovla/tokyodark.nvim',
    priority = 1000,
    lazy = true,
    init = function()
      if require('rochakgupta.settings').transparent then
        vim.g.tokyodark_transparent_background = true
      end
      vim.g.tokyodark_enable_italic_comment = true
      vim.g.tokyodark_enable_italic = false
    end,
  },
}
