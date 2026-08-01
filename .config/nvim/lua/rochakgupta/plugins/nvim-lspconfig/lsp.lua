local servers = require('rochakgupta.plugins.nvim-lspconfig.servers')
local utils = require('rochakgupta.utils')

local capabilities = vim.lsp.protocol.make_client_capabilities()
if vim.g.rg_nvim_cmp then
  capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
else
  capabilities = require('blink.cmp').get_lsp_capabilities(capabilities)
end

-- Applies to every server configured via vim.lsp.config()
vim.lsp.config('*', {
  capabilities = capabilities,
})

-- This runs when any LSP client attaches to a buffer, including servers started
-- outside of vim.lsp.config() such as jdtls.
vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'Set up LSP keymaps and workspace folders',
  group = vim.api.nvim_create_augroup('LspAttach', { clear = true }),
  callback = function(args)
    require('rochakgupta.plugins.nvim-lspconfig.keymaps').init(args.buf)

    local client = vim.lsp.get_client_by_id(args.data.client_id)

    local spec = client and servers.servers[client.name]
    if spec and spec.on_attach then
      spec.on_attach(client, args.buf)
    end

    -- Prevent language server semantic token highlights from overwriting treesitter highlights
    -- client.server_capabilities.semanticTokensProvider = nil
  end,
})

for name, spec in vim.spairs(servers.servers) do
  if servers.is_excluded(spec) then
    utils.notify_debug(name .. ' language server is excluded in ' .. vim.fn.getcwd())
  else
    local config = spec.config
    if type(config) == 'function' then
      config = config()
    end
    if config then
      vim.lsp.config(name, config)
    end

    local enable = spec.enable
    if type(enable) == 'function' then
      enable(capabilities)
    elseif enable == false then
      utils.notify_debug(name .. ' language server is not enabled')
    else
      vim.lsp.enable(name)
    end
  end
end
