-- Diagnostics
vim.diagnostic.config({
  underline = false,
  signs = true,
  virtual_text = false,
  float = {
    show_header = true,
    source = true,
    border = require('rochakgupta.settings').border,
  },
})
