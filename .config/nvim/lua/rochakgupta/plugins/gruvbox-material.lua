local settings = require('rochakgupta.settings')

return {
  'sainnhe/gruvbox-material',
  priority = 1000,
  lazy = settings.colorscheme ~= 'gruvbox-material',
  init = function()
    if settings.transparent then
      vim.g.gruvbox_material_background = 'hard'
      vim.g.gruvbox_material_ui_contrast = 'high'
      vim.g.gruvbox_material_transparent_background = settings.transparent and 1 or 0
    end
    vim.g.gruvbox_material_foreground = 'original'
    vim.g.gruvbox_material_statusline_style = 'original'
    vim.g.gruvbox_material_better_performance = 1
  end,
  config = function()
    -- Using autocmd because overrides must be set after loading the colorscheme but before setting it.
    vim.api.nvim_create_autocmd('ColorScheme', {
      desc = 'Set gruvbox-material float highlights',
      pattern = 'gruvbox-material',
      callback = function()
        -- Reference: <plugin>/colors/gruvbox-material.vim
        vim.cmd([[
            let s:configuration = gruvbox_material#get_configuration()
            let s:palette = gruvbox_material#get_palette(
              \ s:configuration.background, s:configuration.foreground, s:configuration.colors_override)
            if s:configuration.transparent_background >= 1
              call gruvbox_material#highlight('NormalFloat', s:palette.fg0, s:palette.none)
              call gruvbox_material#highlight('FloatBorder', s:palette.fg0, s:palette.none)
            else
              call gruvbox_material#highlight('NormalFloat', s:palette.fg0, s:palette.bg0)
              call gruvbox_material#highlight('FloatBorder', s:palette.fg0, s:palette.bg0)
            endif
          ]])
      end,
      group = vim.api.nvim_create_augroup('GruvboxMaterialCustomHighlights', { clear = true }),
    })
  end,
}
