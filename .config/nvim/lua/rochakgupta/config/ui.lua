-- Highlights
-- Prevent language server semantic token highlights from overwriting treesitter highlights
-- https://github.com/NvChad/NvChad/issues/1907
-- Any number lower than 100, treesitter's priority level, would do
-- vim.highlight.priorities.semantic_tokens = 99

-- Diagnostics
vim.diagnostic.config({
  underline = false,
  signs = true,
  virtual_text = false,
  float = {
    show_header = true,
    source = true,
    border = vim.g.rg_border,
  },
})
