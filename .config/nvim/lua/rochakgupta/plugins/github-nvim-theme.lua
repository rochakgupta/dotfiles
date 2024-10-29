return {
  'projekt0n/github-nvim-theme',
  priority = 1000,
  lazy = vim.g.rg_colorscheme ~= 'github_dark_high_contrast',
  name = 'github-theme',
  config = function()
    require('github-theme').setup({
      options = {
        transparent = vim.g.rg_transparent,
        terminal_colors = true,
      },
    })
  end,
}
