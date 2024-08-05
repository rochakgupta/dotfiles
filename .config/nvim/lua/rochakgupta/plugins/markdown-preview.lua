return {
  'iamcco/markdown-preview.nvim',
  ft = {
    'markdown',
    'plantuml',
  },
  build = function()
    vim.fn['mkdp#util#install']()
  end,
  config = function()
    -- Run `plantuml -picoweb` to start the server
    vim.g.mkdp_preview_options = {
      uml = {
        server = vim.g.rg_plantuml_local and 'http://localhost:8080' or 'http://www.plantuml.com/plantuml',
        imageFormat = 'svg',
      },
    }
    vim.g.mkdp_browser = '/Applications/Google Chrome.app'
    vim.g.mkdp_filetypes = { 'markdown', 'plantuml' }
    vim.g.mkdp_echo_preview_url = 1
    -- vim.g.mkdp_theme = 'light'
    vim.g.mkdp_auto_close = 0
    vim.g.mkdp_combine_preview = 1

    vim.keymap.set('n', '<leader>mp', ':MarkdownPreview<CR>', { desc = 'MarkdownPreview: Preview' })
  end,
}
