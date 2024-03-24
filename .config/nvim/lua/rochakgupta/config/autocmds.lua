vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight on yank',
  callback = function()
    vim.highlight.on_yank()
  end,
  group = vim.api.nvim_create_augroup('YankHighlight', { clear = true }),
  pattern = '*',
})

-- Have to set formatoptions via autocmd due to some reason
vim.api.nvim_create_autocmd('FileType', {
  desc = 'Set formatoptions',
  callback = function()
    vim.opt.formatoptions:remove({ 'c', 'r', 'o', 't' })
  end,
  group = vim.api.nvim_create_augroup('SetFormatOptions', { clear = true }),
})
