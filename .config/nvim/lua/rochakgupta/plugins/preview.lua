return {
  'https://gitlab.com/itaranto/preview.nvim',
  keys = {
    {
      '<leader>p',
      '<cmd>PreviewFile<CR>',
      desc = 'Preview File',
    },
  },
  config = function()
    require('preview').setup({
      previewers_by_ft = {
        plantuml = {
          name = 'plantuml_text',
          renderer = { type = 'buffer', opts = { split_cmd = 'vsplit' } },
        },
      },
      render_on_write = false,
    })
  end,
}
