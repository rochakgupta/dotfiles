return {
  'folke/tokyonight.nvim',
  priority = 1000,
  lazy = vim.g.rg_color ~= 'tokyonight',
  opts = {
    style = 'night',
    transparent = vim.g.rg_transparent,
    styles = {
      comments = { fg = '#7e86ae' },
      keywords = { italic = false },
      sidebars = vim.g.rg_transparent and 'transparent' or 'dark',
      floats = vim.g.rg_transparent and 'transparent' or 'dark',
    },
  },
}
