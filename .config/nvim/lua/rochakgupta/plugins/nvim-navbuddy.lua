return {
  {
    'SmiteshP/nvim-navbuddy',
    dependencies = {
      'neovim/nvim-lspconfig', -- Used and configured in nvim-lspconfig
      'SmiteshP/nvim-navic', -- Used and configured in nvim-navic
      'MunifTanjim/nui.nvim',
    },
    config = function()
      require('nvim-navbuddy').setup({
        window = {
          border = 'rounded',
        },
      })
      vim.keymap.set('n', '<leader>n', require('nvim-navbuddy').open, { desc = 'Open [N]avbuddy' })
    end,
  },
}
