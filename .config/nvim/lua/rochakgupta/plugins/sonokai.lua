return {
  'sainnhe/sonokai',
  priority = 1000,
  lazy = vim.g.rg_color ~= 'sonokai',
  init = function()
    vim.g.sonokai_style = 'andromeda'
    vim.g.sonokai_float_style = 'dim'
    vim.g.sonokai_transparent_background = vim.g.rg_transparent and 2 or 0
  end,
  config = function()
    -- Using autocmd because overrides must be set after loading the colorscheme but before setting it.
    vim.api.nvim_create_autocmd('ColorScheme', {
      desc = 'Set sonokai float highlights',
      pattern = 'sonokai',
      callback = function()
        vim.cmd('hi NormalFloat ctermbg=NONE guibg=NONE')
        vim.cmd('hi FloatTitle ctermbg=NONE guibg=NONE')
        vim.cmd('hi FloatBorder ctermbg=NONE guibg=NONE')
      end,
      group = vim.api.nvim_create_augroup('SonokaiCustomHighlights', { clear = true }),
    })
  end,
}
