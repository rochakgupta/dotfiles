return {
  'hrsh7th/nvim-cmp',
  cond = vim.g.rg_nvim_cmp,
  dependencies = {
    'hrsh7th/cmp-nvim-lsp', -- Used and configured in nvim-lspconfig
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/cmp-nvim-lsp-signature-help',
    'dcampos/nvim-snippy',
    'honza/vim-snippets',
    'dcampos/cmp-snippy',
    'rcarriga/cmp-dap',
  },
  -- cond = not vim.g.started_by_firenvim,
  config = function()
    local cmp = require('cmp')
    local snippy = require('snippy')

    cmp.setup({
      enabled = function()
        -- Disable in buffers corresponding to telescope prompt
        -- Enable in nvim-dap buffers
        return vim.api.nvim_get_option_value('buftype', { buf = 0 }) ~= 'prompt' or require('cmp_dap').is_dap_buffer()
      end,
      window = {
        completion = cmp.config.window.bordered({
          border = vim.g.rg_border,
        }),
        documentation = cmp.config.window.bordered({
          border = vim.g.rg_border,
        }),
      },
      snippet = {
        expand = function(args)
          snippy.expand_snippet(args.body)
        end,
      },
      preselect = cmp.PreselectMode.None,
      mapping = {
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-y>'] = cmp.mapping(
          cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
          }),
          { 'i', 'c' }
        ),
        ['<C-n>'] = cmp.mapping.select_next_item({
          behavior = cmp.SelectBehavior.Insert,
        }),
        ['<C-p>'] = cmp.mapping.select_prev_item({
          behavior = cmp.SelectBehavior.Insert,
        }),
      },
      sources = {
        { name = 'nvim_lsp' },
        { name = 'buffer' },
        { name = 'nvim_lsp_signature_help' },
        { name = 'path' },
        { name = 'snippy' },
      },
    })

    vim.keymap.set({ 'i', 's' }, '<C-j>', function()
      if snippy.can_expand_or_advance() then
        snippy.expand_or_advance()
      end
    end, { silent = true })

    vim.keymap.set({ 'i', 's' }, '<C-k>', function()
      if snippy.can_jump(-1) then
        snippy.previous()
      end
    end, { silent = true })

    cmp.setup.cmdline({ '/', '?' }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'buffer' },
      },
    })

    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = 'buffer' },
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

    cmp.setup.filetype({
      'dap-repl',
      'dapui_watches',
      'dapui_hover',
    }, {
      sources = {
        { name = 'dap' },
      },
    })
  end,
}
