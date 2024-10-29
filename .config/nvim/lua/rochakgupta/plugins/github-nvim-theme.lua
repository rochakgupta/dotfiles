return {
  'projekt0n/github-nvim-theme',
  priority = 1000,
  lazy = vim.g.rg_color ~= 'github',
  name = 'github-theme',
  config = function()
    vim.g.rg_colorscheme = 'github_dark_high_contrast'
    require('github-theme').setup({
      options = {
        transparent = vim.g.rg_transparent,
        terminal_colors = true,
      },
    })
  end,
}
