return {
  'saghen/blink.cmp',
  cond = vim.g.rg_blink,
  dependencies = 'rafamadriz/friendly-snippets',
  version = '*',
  opts = {
    enabled = function()
      return vim.bo.filetype ~= 'NvimTree'
    end,
    keymap = {
      preset = 'default',
      ['<Tab>'] = {},
      ['<S-Tab>'] = {},
      ['<C-j>'] = {
        'snippet_forward',
        'fallback',
      },
      ['<C-k>'] = {
        'snippet_backward',
        'fallback',
      },
      ['<C-s>'] = {
        'show_signature',
        'hide_signature',
        'fallback',
      },
    },
    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = 'mono',
    },
    completion = {
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
      accept = {
        auto_brackets = {
          enabled = false,
        },
      },
      menu = {
        border = vim.g.rg_border,
        draw = {
          columns = { { 'kind_icon' }, { 'label', 'label_description', 'source_name', gap = 1 } },
        },
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 0,
        window = {
          border = vim.g.rg_border,
        },
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
      keymap = { preset = 'inherit' },
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
      completion = {
        menu = {
          auto_show = true,
        },
      },
    },
  },
  opts_extend = { 'sources.default' },
}
