local transparent = require('rochakgupta.settings').transparent

return {
  {
    -- Colorscheme
    'Mofiqul/vscode.nvim',
    priority = 1000,
    lazy = true,
    opts = {
      transparent = transparent,
      italic_comments = true,
      disable_nvimtree_bg = transparent,
    },
  },
}
