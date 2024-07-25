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
      dashboard.button('i', '  New File', '<cmd>ene<CR>'),
      dashboard.button('b', '  Config: bat', ':cd ~/.config/bat<CR>:e ~/.config/bat/config<CR>'),
      dashboard.button('l', '  Config: lazygit', ':cd ~/.config/lazygit<CR>:e ~/.config/lazygit/config.yml<CR>'),
      dashboard.button('n', '  Config: neovim', ':cd ~/.config/nvim<CR>:e ~/.config/nvim/init.lua<CR>'),
      dashboard.button('s', '  Config: starship', ':e ~/.config/starship.toml<CR>'),
      dashboard.button('t', '  Config: tmux', ':e ~/.tmux.conf<CR>'),
      dashboard.button('v', '  Config: vim', ':e ~/.vimrc<CR>'),
      dashboard.button('f', '  Config: vifm', ':cd ~/.config/vifm<CR>:e ~/.config/vifm/vifmrc<CR>'),
      dashboard.button('w', '  Config: wezterm', ':cd ~/.config/wezterm<CR>:e ~/.config/wezterm/wezterm.lua<CR>'),
      dashboard.button('z', '  Config: zsh', ':e ~/.zshrc<CR>'),
      dashboard.button('q', '  Quit', ':qa<CR>'),
    }
    alpha.setup(dashboard.config)
    vim.keymap.set('n', '<leader>ga', ':Alpha<CR>', { desc = 'Open Alpha Dashboard' })
  end,
}
