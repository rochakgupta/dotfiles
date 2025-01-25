return {
  'saghen/blink.cmp',
  cond = vim.g.rg_blink,
  dependencies = 'rafamadriz/friendly-snippets',
  version = '*',
  opts = {
    enabled = function()
      -- Disable in buffers corresponding to telescope prompt
      return vim.bo.buftype ~= 'prompt'
    end,
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
      },
      list = {
        selection = {
          preselect = false,
          auto_insert = true,
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
  },
  opts_extend = { 'sources.default' },
}
