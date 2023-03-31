return {
  {
    -- Colorscheme
    'folke/tokyonight.nvim',
    priority = 1000,
    lazy = true,
    opts = {
      style = 'night',
      transparent = true,
      styles = {
        keywords = { italic = false },
        sidebars = 'transparent',
        floats = 'transparent',
      },
    },
  },
}
