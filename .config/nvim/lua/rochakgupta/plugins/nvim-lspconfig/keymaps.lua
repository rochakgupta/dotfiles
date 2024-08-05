local M = {}

function M.init(bufnr)
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  nmap('<leader>C', vim.lsp.buf.rename, 'Rename')
  nmap('<leader>ca', vim.lsp.buf.code_action, 'Code action')

  nmap('gd', function()
    if vim.g.rg_telescope then
      require('telescope.builtin').lsp_definitions({ show_line = false })
    else
      require('fzf-lua').lsp_definitions({
        jump_to_single_result = true,
      })
    end
  end, 'Go to definition')

  nmap('gr', function()
    if vim.g.rg_telescope then
      require('telescope.builtin').lsp_references({ show_line = false })
    else
      require('fzf-lua').lsp_references({
        jump_to_single_result = true,
        includeDeclaration = false,
      })
    end
  end, 'Go to references')

  nmap('gi', function()
    if vim.g.rg_telescope then
      require('telescope.builtin').lsp_implementations({ show_line = false })
    else
      require('fzf-lua').lsp_implementations({
        jump_to_single_result = true,
      })
    end
  end, 'Go to implementation')

  nmap('gt', function()
    if vim.g.rg_telescope then
      require('telescope.builtin').lsp_type_definitions({ show_line = false })
    else
      require('fzf-lua').lsp_typedefs()
    end
  end, 'Go to type definition')

  nmap('<leader>ds', function()
    if vim.g.rg_telescope then
      require('telescope.builtin').lsp_document_symbols({ symbol_width = 75 })
    else
      require('fzf-lua').lsp_document_symbols()
    end
  end, 'Document symbols')

  nmap('<leader>ws', function()
    if vim.g.rg_telescope then
      require('telescope.builtin').lsp_dynamic_workspace_symbols()
    else
      require('fzf-lua').lsp_live_workspace_symbols()
    end
  end, 'Workspace symbols')

  -- See `:help K` for why this keymap
  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

  -- Lesser used LSP functionality
  nmap('gD', vim.lsp.buf.declaration, 'Go to declaration')

  nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, 'Add workspace folder')
  nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, 'Remove workspace folder')
  nmap('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, 'List workspace folders')
end

return M
