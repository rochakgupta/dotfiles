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
    if vim.g.rg_fzf_lua then
      require('fzf-lua').lsp_definitions({
        jump_to_single_result = true,
      })
    elseif vim.g.rg_snacks_picker then
      require('snacks.picker').lsp_definitions()
    end
  end, 'Go to definition (direct)')

  nmap('gD', function()
    if vim.g.rg_fzf_lua then
      require('fzf-lua').lsp_definitions()
    elseif vim.g.rg_snacks_picker then
      require('snacks.picker').lsp_definitions({
        auto_confirm = false,
      })
    end
  end, 'Go to definition')

  nmap('gr', function()
    if vim.g.rg_fzf_lua then
      require('fzf-lua').lsp_references({
        jump_to_single_result = true,
        includeDeclaration = false,
      })
    elseif vim.g.rg_snacks_picker then
      require('snacks.picker').lsp_references({
        include_declaration = false,
      })
    end
  end, 'Go to references (direct)')

  nmap('gR', function()
    if vim.g.rg_fzf_lua then
      require('fzf-lua').lsp_references({
        includeDeclaration = false,
      })
    elseif vim.g.rg_snacks_picker then
      require('snacks.picker').lsp_references({
        auto_confirm = false,
        include_declaration = false,
      })
    end
  end, 'Go to references')

  nmap('gi', function()
    if vim.g.rg_fzf_lua then
      require('fzf-lua').lsp_implementations({
        jump_to_single_result = true,
      })
    elseif vim.g.rg_snacks_picker then
      require('snacks.picker').lsp_implementations()
    end
  end, 'Go to implementation (direct)')

  nmap('gI', function()
    if vim.g.rg_fzf_lua then
      require('fzf-lua').lsp_implementations()
    elseif vim.g.rg_snacks_picker then
      require('snacks.picker').lsp_implementations({
        auto_confirm = false,
      })
    end
  end, 'Go to implementation')

  nmap('gt', function()
    if vim.g.rg_fzf_lua then
      require('fzf-lua').lsp_typedefs({
        jump_to_single_result = true,
      })
    elseif vim.g.rg_snacks_picker then
      require('snacks.picker').lsp_type_definitions()
    end
  end, 'Go to type definition (direct)')

  nmap('gT', function()
    if vim.g.rg_fzf_lua then
      require('fzf-lua').lsp_typedefs()
    elseif vim.g.rg_snacks_picker then
      require('snacks.picker').lsp_type_definitions({
        auto_confirm = false,
      })
    end
  end, 'Go to type definition')

  nmap('<leader>ds', function()
    if vim.g.rg_fzf_lua then
      require('fzf-lua').lsp_document_symbols()
    elseif vim.g.rg_snacks_picker then
      require('snacks.picker').lsp_symbols()
    end
  end, 'Document symbols')

  nmap('<leader>ws', function()
    if vim.g.rg_fzf_lua then
      require('fzf-lua').lsp_live_workspace_symbols()
    elseif vim.g.rg_snacks_picker then
      require('snacks.picker').lsp_workspace_symbols()
    end
  end, 'Workspace symbols')

  -- See `:help K` for why this keymap
  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

  nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, 'Add workspace folder')
  nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, 'Remove workspace folder')
  nmap('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, 'List workspace folders')
end

return M
