return {
  'saghen/blink.cmp',
  cond = vim.g.rg_blink,
  dependencies = 'rafamadriz/friendly-snippets',
  version = '*',
  opts = {
    keymap = {
      preset = 'default',
      ['<Tab>'] = {},
      ['<S-Tab>'] = {},
      ['<C-j>'] = {
        'snippet_forward',
      },
      ['<C-k>'] = {
        'snippet_backward',
      },
    },
    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = 'mono',
    },

    completion = {
      menu = {
        border = vim.g.rg_border,
        draw = {
          columns = { { 'kind_icon' }, { 'label', 'label_description', 'source_name', gap = 1 } },
        },
      },
      list = {
        selection = {
          preselect = false,
          auto_insert = true,
        },
        cycle = {
          from_bottom = false,
          from_top = false,
        },
      },
      documentation = {
        window = {
          border = vim.g.rg_border,
        },
        auto_show = true,
        auto_show_delay_ms = 0,
      },
    },

    signature = {
      enabled = true,
      window = {
        border = vim.g.rg_border,
        direction_priority = { 's', 'n' },
      },
    },

    sources = {
      default = {
        'lsp',
        'buffer',
        'path',
        'snippets',
      },
      providers = {
        lsp = {
          fallbacks = {},
        },
      },
    },

    cmdline = {
      sources = function()
        local type = vim.fn.getcmdtype()
        if type == '/' or type == '?' then
          return { 'buffer' }
        end
        if type == ':' or type == '@' then
          return { 'cmdline', 'buffer' }
        end
        return {}
      end,
    },
  },
  opts_extend = { 'sources.default' },
}
