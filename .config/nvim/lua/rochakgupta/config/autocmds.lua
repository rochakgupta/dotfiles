local utils = require('rochakgupta.utils')

if not vim.g.rg_yanky then
  vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight on yank',
    callback = function()
      vim.highlight.on_yank()
    end,
    group = vim.api.nvim_create_augroup('YankHighlight', { clear = true }),
    pattern = '*',
  })
end

-- Have to set formatoptions via autocmd due to some reason
vim.api.nvim_create_autocmd('FileType', {
  desc = 'Set formatoptions',
  callback = function()
    vim.opt.formatoptions:remove({ 'c', 'r', 'o', 't' })
  end,
  group = vim.api.nvim_create_augroup('SetFormatOptions', { clear = true }),
})

vim.api.nvim_create_autocmd('VimResized', {
  pattern = '*',
  command = 'wincmd =',
  desc = 'Resize windows when host window is resized',
  group = vim.api.nvim_create_augroup('WinResize', { clear = true }),
})

local indents = {
  go = 4,
  java = 4,
  javascript = 4,
  jinja = 2,
  json = 2,
  lua = 2,
  ruby = 2,
  typescript = 4,
  yaml = 2,
}
vim.api.nvim_create_autocmd('FileType', {
  pattern = utils.get_table_keys(indents),
  callback = function()
    local indent = indents[vim.bo.filetype]
    vim.opt_local.tabstop = indent
    vim.opt_local.shiftwidth = indent
  end,
  desc = 'Set indent options for specific file types',
})
