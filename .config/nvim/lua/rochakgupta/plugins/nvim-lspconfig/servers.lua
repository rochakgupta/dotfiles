local M = {}

M.servers = {
  bashls = {
    config = {
      filetypes = { 'sh', 'zsh' },
    },
  },

  clangd = {
    config = {
      cmd = { 'clangd', '--offset-encoding=utf-16' },
    },
  },

  esbonio = {},

  gopls = {
  },

  gradle_ls = {},

  -- Installed by mason but started by nvim-jdtls, see jdtls_config.lua
  jdtls = {
    enable = function(capabilities)
      vim.api.nvim_create_autocmd('FileType', {
        desc = 'Enable jdtls when a java file is opened',
        pattern = 'java',
        group = vim.api.nvim_create_augroup('JdtlsStart', { clear = true }),
        callback = function()
          require('rochakgupta.plugins.nvim-lspconfig.jdtls_config').setup({
            capabilities = capabilities,
          })
        end,
      })
    end,
  },

  jsonls = {
    config = function()
      return {
        settings = {
          json = {
            schemas = require('schemastore').json.schemas(),
            validate = { enable = true },
          },
        },
      }
    end,
  },

  lemminx = {},

  lua_ls = {
    config = {
      settings = {
        Lua = {
          workspace = { checkThirdParty = false },
          telemetry = { enable = false },
        },
      },
    },
  },

  marksman = {},

  mpls = {
    mason = false,
    enable = vim.g.rg_mpls,
    on_attach = function(_, bufnr)
      -- LspMplsOpenPreview is created by the on_attach shipped in nvim-lspconfig
      vim.keymap.set('n', '<leader>mp', '<cmd>LspMplsOpenPreview<cr>', {
        buffer = bufnr,
        desc = 'Markdown Preview',
      })
    end,
  },

  pyright = {
  },

  rust_analyzer = {},

  ts_ls = {
  },

  vimls = {},

  yamlls = {
    config = {
      filetypes = {
        'yaml',
        'yaml.docker-compose',
        'yaml.gitlab',
      },
      settings = {
        redhat = {
          telemetry = {
            enabled = false,
          },
        },
        yaml = {
          schemaStore = {
            enable = false,
          },
          keyOrdering = false,
        },
      },
    },
  },
}

-- Whether the server is excluded in the current working directory, which is the
-- case when the directory is an excluded one or lives below one.
function M.is_excluded(spec)
  if not spec.exclude then
    return false
  end

  local cwd = vim.fs.normalize(vim.fn.getcwd())
  for _, dir in ipairs(spec.exclude) do
    dir = vim.fs.normalize(vim.fn.expand(dir))
    if cwd == dir or require('rochakgupta.utils').has_prefix(cwd, dir .. '/') then
      return true
    end
  end

  return false
end

-- Names of the servers mason should install, for mason-lspconfig's ensure_installed
function M.get_mason_names()
  local names = {}
  for name, spec in vim.spairs(M.servers) do
    if spec.mason ~= false then
      table.insert(names, name)
    end
  end
  return names
end

return M
