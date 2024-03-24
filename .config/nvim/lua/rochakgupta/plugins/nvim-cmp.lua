return {
  {
    -- Completion
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp', -- Used and configured in nvim-lspconfig
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'dcampos/nvim-snippy',
      'honza/vim-snippets',
      'dcampos/cmp-snippy',
    },
    config = function()
      local cmp = require('cmp')
      local snippy = require('snippy')

      cmp.setup({
        enabled = function ()
          -- Disable in buffers corresponding to telescope prompt
          return vim.api.nvim_buf_get_option(0, "buftype") ~= "prompt"
        end,
        window = {
          documentation = cmp.config.window.bordered(),
        },
        snippet = {
          expand = function(args)
            snippy.expand_snippet(args.body)
          end,
        },
        preselect = cmp.PreselectMode.None,
        mapping = cmp.mapping.preset.insert({
          ['<C-d>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete({}),
          ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
          }),
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif snippy.can_expand_or_advance() then
              snippy.expand_or_advance()
            else
              fallback()
            end
          end, { 'i', 's' }),
          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif snippy.can_jump(-1) then
              snippy.previous()
            else
              fallback()
            end
          end, { 'i', 's' }),
        }),
        sources = {
          { name = 'snippy' },
          { name = 'nvim_lsp' },
          { name = 'buffer' },
          { name = 'path' },
        },
      })

      cmp.setup.cmdline('/', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' },
        },
      })

      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path' },
        }, {
          {
            name = 'cmdline',
            option = {
              ignore_cmds = { 'Man', '!' },
            },
          },
        }),
      })
    end,
  },
}
