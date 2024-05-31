return {
  {
    -- Greeter
    'goolord/alpha-nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      local alpha = require('alpha')
      local dashboard = require('alpha.themes.dashboard')
      dashboard.section.header.val = {
        '                                                     ',
        '  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ',
        '  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ',
        '  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ',
        '  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ',
        '  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ',
        '  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ',
        '                                                     ',
      }
      dashboard.section.buttons.val = {
        dashboard.button('i', '  New file', '<cmd>ene<CR>'),
        dashboard.button('c', '  Neovim Config', ':cd ~/.config/nvim<CR>:e ~/.config/nvim/init.lua<CR>'),
        dashboard.button('t', '  Tmux Config', ':e ~/.tmux.conf<CR>'),
        dashboard.button('w', '  WezTerm Config', ':e ~/.config/wezterm/wezterm.lua<CR>'),
        dashboard.button('z', '  Zsh Config', ':e ~/.zshrc<CR>'),
        dashboard.button('q', '  Quit', ':qa<CR>'),
      }
      alpha.setup(dashboard.config)
    end,
  },
}
