local M = {}

local use_telescope = vim.g.rg_telescope

function M.init(bufnr)
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  nmap('<leader>C', vim.lsp.buf.rename, 'Rename')
  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

  nmap('gd', function()
    if use_telescope then
      require('telescope.builtin').lsp_definitions({ show_line = false })
    else
      require('fzf-lua').lsp_definitions({
        jump_to_single_result = true,
      })
    end
  end, '[G]oto [D]efinition')

  nmap('gr', function()
    if use_telescope then
      require('telescope.builtin').lsp_references({ show_line = false })
    else
      require('fzf-lua').lsp_references({
        jump_to_single_result = true,
        includeDeclaration = false,
      })
    end
  end, '[G]oto [R]eferences')

  nmap('gi', function()
    if use_telescope then
      require('telescope.builtin').lsp_implementations({ show_line = false })
    else
      require('fzf-lua').lsp_implementations({
        jump_to_single_result = true,
      })
    end
  end, '[G]oto [I]mplementation')

  nmap('gt', function()
    if use_telescope then
      require('telescope.builtin').lsp_type_definitions({ show_line = false })
    else
      require('fzf-lua').lsp_typedefs()
    end
  end, '[G]oto [T]ype Definition')

  nmap('<leader>ds', function()
    if use_telescope then
      require('telescope.builtin').lsp_document_symbols({ symbol_width = 75 })
    else
      require('fzf-lua').lsp_document_symbols()
    end
  end, '[D]ocument [S]ymbols')

  nmap('<leader>ws', function()
    if use_telescope then
      require('telescope.builtin').lsp_dynamic_workspace_symbols()
    else
      require('fzf-lua').lsp_live_workspace_symbols()
    end
  end, '[W]orkspace [S]ymbols')

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
end

return M
