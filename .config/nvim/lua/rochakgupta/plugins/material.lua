local dark = vim.g.rg_background == 'dark'

return {
  'marko-cerovac/material.nvim',
  priority = 1000,
  lazy = vim.g.rg_colorscheme ~= 'material',
  init = function()
    vim.g.material_style = dark and 'deep ocean' or 'lighter'
  end,
  config = function()
    require('material').setup({
      styles = {
        comments = { italic = true },
      },
      custom_highlights = {
        Pmenu = { bg = dark and '#232637' or '#D3E1E8' },
      },
      custom_colors = function(colors)
        colors.editor.border = '#606897'
        if dark then
          colors.backgrounds.cursor_line = '#2a2d3c'
          colors.editor.selection = '#262a3f'
          colors.syntax.comments = '#686f8a'
        end
      end,
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
        background = vim.g.rg_transparent,
      },
      high_visibility = {
        lighter = true,
      },
      lualine_style = dark and 'stealth' or 'default',
    })
  end,
}
