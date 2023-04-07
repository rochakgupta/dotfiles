local settings = require('rochakgupta.settings')

return {
  {
    -- Colorscheme
    'tiagovla/tokyodark.nvim',
    priority = 1000,
    lazy = settings.colorscheme ~= 'tokyodark',
    init = function()
      if settings.transparent then
        vim.g.tokyodark_transparent_background = true
      end
      vim.g.tokyodark_enable_italic_comment = true
      vim.g.tokyodark_enable_italic = false
    end,
  },
}
