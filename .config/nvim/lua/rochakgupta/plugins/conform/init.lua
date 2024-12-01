return {
  'stevearc/conform.nvim',
  branch = 'nvim-0.9',
  dependencies = {
    'WhoIsSethDaniel/mason-tool-installer.nvim', -- Configured in mason-tool-installer.lua
  },
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    local opts = {
      async = false,
      timeout_ms = 1000,
      lsp_format = 'fallback',
    }

    require('conform').setup({
      format_on_save = function(bufnr)
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
          print('Autoformat on save is disabled')
          return
        end
        return opts
      end,
      formatters = {
        ['clang-format'] = {
          prepend_args = { '--style', 'webkit' },
        },
        ['google-java-format'] = {
          prepend_args = { '--aosp' },
        },
        ktfmt = {
          prepend_args = { '--kotlinlang-style' },
        },
      },
      formatters_by_ft = {
        c = { 'clang-format' },
        cpp = { 'clang-format' },
        css = { 'prettier' },
        go = { 'gofumpt' },
        html = { 'prettier' },
        java = { 'google-java-format' },
        javascript = { 'prettier' },
        javascriptreact = { 'prettier' },
        json = { 'prettier' },
        kotlin = { 'ktfmt' },
        lua = { 'stylua' },
        markdown = { 'prettier' },
        python = { 'isort', 'black' },
        sh = { 'shfmt' },
        sql = { 'sqlfmt' },
        svelte = { 'prettier' },
        typescript = { 'prettier' },
        typescriptreact = { 'prettier' },
        yaml = { 'prettier' },
        zsh = { 'shfmt' },
      },
    })

    vim.keymap.set({ 'n', 'x' }, '<leader>f', function()
      require('conform').format(opts)
    end, { desc = 'Format' })

    vim.keymap.set('n', '<leader>bf', function()
      local bufnr = vim.api.nvim_get_current_buf()
      vim.b[bufnr].disable_autoformat = not (vim.b[bufnr].disable_autoformat or false)
      print('Buffer autoformat: ' .. (vim.b[bufnr].disable_autoformat and 'disabled' or 'enabled'))
    end, { desc = 'Format: Toggle buffer autoformat' })

    vim.keymap.set('n', '<leader>gf', function()
      vim.g.disable_autoformat = not (vim.g.disable_autoformat or false)
      print('Global autoformat: ' .. (vim.g.disable_autoformat and 'disabled' or 'enabled'))
    end, { desc = 'Format: Toggle global autoformat' })
  end,
}
