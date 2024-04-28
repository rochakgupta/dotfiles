local settings = require('rochakgupta.settings')

--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(client, bufnr)
  require('rochakgupta.plugins.nvim-lspconfig.keymaps').init(bufnr)

  if client.server_capabilities.documentSymbolProvider then
    require('nvim-navbuddy').attach(client, bufnr)
  end
end

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Setup mason so it can manage external tooling
require('mason').setup({
  ui = {
    border = settings.border,
  },
})

require('mason-lspconfig').setup({
  ensure_installed = {
    'bashls',
    'clangd',
    'esbonio',
    'gopls',
    'jdtls',
    'jsonls',
    'lua_ls',
    'marksman',
    'pyright',
    'rust_analyzer',
    'tsserver',
    'vimls',
    'yamlls',
  },
})

local lsp_defaults = {
  capabilities = capabilities,
  on_attach = on_attach,
}

local lspconfig = require('lspconfig')

lspconfig.util.default_config = vim.tbl_deep_extend('force', lspconfig.util.default_config, lsp_defaults)

lspconfig.bashls.setup({
  filetypes = { 'sh', 'zsh' },
})

lspconfig.clangd.setup({
  cmd = { 'clangd', '--offset-encoding=utf-16' },
})

lspconfig.esbonio.setup({})

lspconfig.gopls.setup({})

vim.api.nvim_create_autocmd('FileType', {
  desc = 'Enable jdtls when a java file is opened',
  pattern = 'java',
  group = vim.api.nvim_create_augroup('rochakgupta-jdtls', { clear = true }),
  callback = function()
    require('rochakgupta.plugins.nvim-lspconfig.jdtls_config').setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })
  end,
})

lspconfig.jsonls.setup({
  settings = {
    json = {
      schemas = require('schemastore').json.schemas(),
      validate = { enable = true },
    },
  },
})

lspconfig.lua_ls.setup({
  settings = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
})

lspconfig.marksman.setup({})

lspconfig.pyright.setup({})

lspconfig.rust_analyzer.setup({})

lspconfig.tsserver.setup({})

lspconfig.vimls.setup({})

lspconfig.yamlls.setup({
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
})
