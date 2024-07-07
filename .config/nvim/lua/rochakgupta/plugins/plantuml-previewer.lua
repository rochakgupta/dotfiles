return {
  'weirongxu/plantuml-previewer.vim',
  dependencies = {
    'tyru/open-browser.vim',
  },
  ft = 'plantuml',
  init = function()
    vim.g.plantuml_previewer = {
      save_format = 'svg',
    }
  end,
}
