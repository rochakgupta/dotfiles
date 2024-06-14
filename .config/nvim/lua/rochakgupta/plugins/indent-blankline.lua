local settings = require('rochakgupta.settings')

return {
  'lukas-reineke/indent-blankline.nvim',
  main = 'ibl',
  cond = settings.indent_blankline,
  config = function()
    -- Overrides have to be done after the colorscheme is set.
    require('ibl').setup({
      indent = {
        char = '┆',
        -- char = '┊',
        -- char = '│',
      },
      scope = {
        show_start = false,
        show_end = false,
        char = '│',
        -- char = '┆',
        -- char = '┊',
      },
    })
    if settings.colorscheme == 'material' then
      local hooks = require('ibl.hooks')
      hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        vim.api.nvim_set_hl(0, 'IblScope', {
          fg = (settings.background == 'dark' and '#c793ea' or '#876ad7'),
          nocombine = true,
        })
      end)
    end
  end,
}
