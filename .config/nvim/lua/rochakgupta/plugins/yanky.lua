return {
  'gbprod/yanky.nvim',
  cond = require('rochakgupta.settings').yanky,
  config = function()
    require('yanky').setup({
      ring = {
        storage = 'memory',
        sync_with_numbered_registers = false,
      },
      system_clipboard = {
        sync_with_ring = false,
      },
      highlight = {
        timer = 150,
      },
    })

    vim.keymap.set({ 'n', 'x' }, 'p', '<Plug>(YankyPutAfter)')
    vim.keymap.set({ 'n', 'x' }, 'P', '<Plug>(YankyPutBefore)')
    vim.keymap.set({ 'n', 'x' }, 'gp', '<Plug>(YankyGPutAfter)')
    vim.keymap.set({ 'n', 'x' }, 'gP', '<Plug>(YankyGPutBefore)')
    vim.keymap.set('n', '<c-p>', '<Plug>(YankyPreviousEntry)')
    vim.keymap.set('n', '<c-n>', '<Plug>(YankyNextEntry)')
  end,
}
