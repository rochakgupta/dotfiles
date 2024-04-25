local settings = require('rochakgupta.settings')

--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(client, bufnr)
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  nmap('<leader>C', vim.lsp.buf.rename, 'Rename')
  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

  nmap('gd', function()
    require('telescope.builtin').lsp_definitions({ show_line = false })
  end, '[G]oto [D]efinition')

  nmap('gr', function()
    require('telescope.builtin').lsp_references({ show_line = false })
  end, '[G]oto [R]eferences')

  nmap('gi', function()
    require('telescope.builtin').lsp_implementations({ show_line = false })
  end, '[G]oto [I]mplementation')

  nmap('<leader>D', function()
    require('telescope.builtin').lsp_type_definitions({ show_line = false })
  end, 'Type [D]efinition')

  nmap('<leader>ds', function()
    require('telescope.builtin').lsp_document_symbols({ symbol_width = 75 })
  end, '[D]ocument [S]ymbols')

  nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

  -- See `:help K` for why this keymap
  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

  -- Lesser used LSP functionality
  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

  nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
  nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
  nmap('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, '[W]orkspace [L]ist Folders')

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
