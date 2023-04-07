local settings = require('rochakgupta.settings')

return {
  {
    -- Colorscheme
    'sainnhe/gruvbox-material',
    priority = 1000,
    lazy = settings.colorscheme ~= 'gruvbox-material',
    init = function()
      if settings.transparent then
        vim.g.gruvbox_material_background = 'hard'
        vim.g.gruvbox_material_ui_contrast = 'high'
        vim.g.gruvbox_material_transparent_background = 1
      end
      vim.g.gruvbox_material_palette = 'material'
      vim.g.gruvbox_material_better_performance = 1
    end,
  },
}
