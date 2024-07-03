return {
  'goolord/alpha-nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
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
      dashboard.button('l', '  Lazygit Config', ':cd ~/.config/lazygit<CR>:e ~/.config/lazygit/config.yml<CR>'),
      dashboard.button('n', '  Neovim Config', ':cd ~/.config/nvim<CR>:e ~/.config/nvim/init.lua<CR>'),
      dashboard.button('s', '  Starship Config', ':e ~/.config/starship.toml<CR>'),
      dashboard.button('t', '  Tmux Config', ':e ~/.tmux.conf<CR>'),
      dashboard.button('v', '  Vim Config', ':e ~/.vimrc<CR>'),
      dashboard.button('f', '  Vifm Config', ':cd ~/.config/vifm<CR>:e ~/.config/vifm/vifmrc<CR>'),
      dashboard.button('w', '  WezTerm Config', ':cd ~/.config/wezterm<CR>:e ~/.config/wezterm/wezterm.lua<CR>'),
      dashboard.button('z', '  Zsh Config', ':e ~/.zshrc<CR>'),
      dashboard.button('q', '  Quit', ':qa<CR>'),
    }
    alpha.setup(dashboard.config)
  end,
}
