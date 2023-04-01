return {
  {
    -- Colorscheme
    'Mofiqul/vscode.nvim',
    priority = 1000,
    lazy = true,
    opts = {
      transparent = require('rochakgupta.settings').transparent,
      italic_comments = true,
      disable_nvimtree_bg = true,
    },
  },
}
