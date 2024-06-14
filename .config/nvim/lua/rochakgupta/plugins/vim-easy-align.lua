return {
  'junegunn/vim-easy-align',
  init = function()
    -- Start interactive EasyAlign in visual mode (e.g. vipga)
    vim.keymap.set('x', 'ga', '<Plug>(EasyAlign)', { noremap = false })
    -- Start interactive EasyAlign for a motion/text object (e.g. gaip)
    vim.keymap.set('n', 'ga', '<Plug>(EasyAlign)', { noremap = false })
  end,
}
