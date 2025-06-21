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
      dashboard.button('r', '  Restore Session', ':lua require("persistence").load()<CR>'),
      dashboard.button('a', '  Config: aerospace', ':cd ~/.config/aerospace<CR>:e aerospace.toml<CR>'),
      dashboard.button('b', '  Config: bat', ':cd ~/.config/bat<CR>:e config<CR>'),
      dashboard.button('l', '  Config: lazygit', ':cd ~/.config/lazygit<CR>:e config.yml<CR>'),
      dashboard.button('n', '  Config: neovim', ':cd ~/.config/nvim<CR>:e init.lua<CR>'),
      dashboard.button('s', '  Config: starship', ':e ~/.config/starship.toml<CR>'),
      dashboard.button('t', '  Config: tmux', ':cd ~/.config/tmux<CR>:e tmux.conf<CR>'),
      dashboard.button('v', '  Config: vim', ':e ~/.vimrc<CR>'),
      dashboard.button('f', '  Config: vifm', ':cd ~/.config/vifm<CR>:e vifmrc<CR>'),
      dashboard.button('w', '  Config: wezterm', ':cd ~/.config/wezterm<CR>:e wezterm.lua<CR>'),
      dashboard.button('z', '  Config: zsh', ':e ~/.zshrc<CR>'),
      dashboard.button('q', '  Quit', ':qa<CR>'),
    }
    alpha.setup(dashboard.config)

    local cwd = vim.fn.getcwd()
    vim.keymap.set('n', '<leader>ga', function()
      vim.cmd('cd ' .. cwd .. '| Alpha')
    end, { desc = 'Alpha: Open dashboard' })
  end,
}
