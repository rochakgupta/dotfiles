vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight on yank',
  callback = function()
    vim.highlight.on_yank()
  end,
  group = vim.api.nvim_create_augroup('YankHighlight', { clear = true }),
  pattern = '*',
})
