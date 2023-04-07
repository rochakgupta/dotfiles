local settings = require('rochakgupta.settings')

return {
  {
    -- Colorscheme
    'Mofiqul/vscode.nvim',
    priority = 1000,
    lazy = settings.colorscheme ~= 'vscode',
    opts = {
      transparent = settings.transparent,
      italic_comments = true,
      disable_nvimtree_bg = settings.transparent,
    },
  },
}
