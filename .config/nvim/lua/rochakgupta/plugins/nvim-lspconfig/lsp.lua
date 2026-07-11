--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(client, bufnr)
  require('rochakgupta.plugins.nvim-lspconfig.keymaps').init(bufnr)

  -- Prevent language server semantic token highlights from overwriting treesitter highlights
  -- client.server_capabilities.semanticTokensProvider = nil
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
if vim.g.rg_nvim_cmp then
  capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
else
  capabilities = require('blink.cmp').get_lsp_capabilities(capabilities)
end

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

lspconfig.gradle_ls.setup({})

vim.api.nvim_create_autocmd('FileType', {
  desc = 'Enable jdtls when a java file is opened',
  pattern = 'java',
  group = vim.api.nvim_create_augroup('JdtlsStart', { clear = true }),
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

lspconfig.lemminx.setup({})

lspconfig.lua_ls.setup({
  settings = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
})

lspconfig.marksman.setup({})

if vim.g.rg_mpls then
  vim.lsp.config('mpls', {
    cmd = {
      'mpls',
      '--no-auto',
      '--theme',
      'dark',
      '--enable-emoji',
      '--enable-footnotes',
    },
    root_markers = { '.marksman.toml', '.git' },
    filetypes = { 'markdown' },
    on_attach = function(client, bufnr)
      vim.api.nvim_create_autocmd('BufEnter', {
        pattern = { '*.md' },
        group = vim.api.nvim_create_augroup('lspconfig.mpls.focus', { clear = true }),
        callback = function(ctx)
          ---@diagnostic disable-next-line:param-type-mismatch
          client:notify('mpls/editorDidChangeFocus', { uri = ctx.match })
        end,
        desc = 'mpls: notify buffer focus changed',
      })
      vim.api.nvim_buf_create_user_command(bufnr, 'LspMplsOpenPreview', function()
        client:exec_cmd({
          title = 'Preview markdown with mpls',
          command = 'open-preview',
        })
      end, { desc = 'Preview markdown with mpls' })
      -- Optional keybinding
      vim.keymap.set('n', '<leader>mp', '<cmd>LspMplsOpenPreview<cr>', {
        buffer = bufnr,
        desc = 'Markdown Preview',
      })
    end,
  })

  vim.lsp.enable({ 'mpls' })
end

lspconfig.pyright.setup({})

lspconfig.rust_analyzer.setup({})

lspconfig.ts_ls.setup({})

lspconfig.vimls.setup({})

lspconfig.yamlls.setup({
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
})
