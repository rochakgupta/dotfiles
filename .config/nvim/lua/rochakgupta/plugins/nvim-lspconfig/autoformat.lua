-- Switch for controlling whether you want autoformatting.
--  Use :FormatToggle to toggle autoformatting on or off
local format_is_enabled = true
vim.api.nvim_create_user_command('FormatToggle', function()
  format_is_enabled = not format_is_enabled
  print('Setting autoformatting to: ' .. tostring(format_is_enabled))
end, {})

vim.keymap.set('n', '<leader>f', ':FormatToggle<CR>', { desc = 'Toggle Auto[f]ormatting' })

-- Create an augroup that is used for managing our formatting autocmds.
--  We need one augroup per client to make sure that multiple clients
--  can attach to the same buffer without interfering with each other.
local _augroups = {}
local get_augroup = function(client)
  if not _augroups[client.id] then
    local group_name = 'rochakgupta-lsp-format-' .. client.name
    local id = vim.api.nvim_create_augroup(group_name, { clear = true })
    _augroups[client.id] = id
  end

  return _augroups[client.id]
end

-- Whenever an LSP attaches to a buffer, we will run this function.
-- See `:help LspAttach` for more information about this autocmd event.
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('rochakgupta-lsp-attach-format', { clear = true }),
  -- This is where we attach the autoformatting for reasonable clients
  callback = function(args)
    local client_id = args.data.client_id
    local client = vim.lsp.get_client_by_id(client_id)
    local bufnr = args.buf

    local client_name

    -- Fallback to null-ls if client does not support formatting
    if not client.server_capabilities.documentFormattingProvider then
      client_name = 'null-ls'
    end

    -- Use formatter provided by null-ls instead of language server
    if client.name == 'tsserver' or client.name == 'lua_ls' or client.name == 'clangd' then
      client_name = 'null-ls'
    end

    -- Create an autocmd that will run *before* we save the buffer.
    --  Run the formatting command for the LSP that has just attached.
    vim.api.nvim_create_autocmd('BufWritePre', {
      group = get_augroup(client),
      buffer = bufnr,
      callback = function()
        if not format_is_enabled then
          return
        end

        vim.lsp.buf.format({
          async = false,
          filter = function(c)
            if client_name then
              return c.name == client_name
            end
            return c.id == client.id
          end,
        })
      end,
    })
  end,
})
