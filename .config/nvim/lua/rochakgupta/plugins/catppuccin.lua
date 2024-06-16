return {
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 1000,
  lazy = vim.g.rg_colorscheme ~= 'catppuccin',
  opts = {
    transparent_background = vim.g.rg_transparent,
    term_colors = true,
    integrations = {
      fidget = true,
      harpoon = true,
      mason = true,
      which_key = true,
    },
  },
}
