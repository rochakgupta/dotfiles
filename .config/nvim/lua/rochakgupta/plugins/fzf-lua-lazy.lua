return {
  'roginfarrer/fzf-lua-lazy.nvim',
  cond = vim.g.rg_fzf_lua,
  dependencies = {
    'ibhagwan/fzf-lua',
  },
  config = function()
    require('fzf-lua-lazy').setup({
      mappings = {
        open_in_browser = 'default',
        open_readme = 'ctrl-o',
        open_in_find_files = 'ctrl-s',
        open_in_live_grep = 'ctrl-g',
        change_cwd_to_plugin = 'ctrl-w',
      },
    })
    vim.keymap.set('n', '<leader>sp', require('fzf-lua-lazy').search, { desc = 'FzfLua + Lazy: Search plugins' })
  end,
}
