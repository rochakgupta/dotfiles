return {
  'RRethy/vim-illuminate',
  config = function()
    require('illuminate').configure({
      providers = {
        -- 'lsp', -- Disable LSP as the behavior is unclear
        'treesitter',
        'regex',
      },
      modes_allowlist = { 'n' },
      min_count_to_highlight = 2,
    })

    vim.keymap.set('n', '<leader>it', require('illuminate').toggle, { desc = 'Illuminate: Toggle' })
    vim.keymap.set('n', ']r', require('illuminate').goto_next_reference, { desc = 'Illuminate: Go to next reference' })
    vim.keymap.set('n', '[r', require('illuminate').goto_prev_reference, { desc = 'Illuminate: Go to previous reference' })
  end,
}
