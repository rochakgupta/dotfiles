return {
  {
    -- Colorscheme
    'marko-cerovac/material.nvim',
    priority = 1000,
    lazy = true,
    init = function()
      vim.g.material_style = 'deep ocean'
    end,
    opts = {
      contrast = {
        sidebars = true,
        floating_windows = true,
      },
      styles = {
        comments = { italic = true },
      },
      plugins = {
        'gitsigns',
        'indent-blankline',
        'nvim-cmp',
        'nvim-tree',
        'nvim-web-devicons',
        'telescope',
        'which-key',
      },
      disable = {
        colored_cursor = true,
        background = true,
      },
      lualine_style = 'stealth',
    },
  },
}
