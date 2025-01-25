local utils = require('rochakgupta.utils')

return {
  'folke/persistence.nvim',
  config = function()
    require('persistence').setup({
      branch = false,
    })

    vim.keymap.set('n', '<leader>R', require('persistence').load, { desc = 'Persistence: Load session' })

    vim.api.nvim_create_autocmd('User', {
      pattern = 'PersistenceSavePre',
      callback = function()
        utils.delete_non_filetypes_buffers()
        utils.delete_buffers_outside_cwd()
        utils.delete_buffers_without_files()
      end,
    })
  end,
}
