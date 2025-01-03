return {
  'ibhagwan/fzf-lua',
  cond = vim.g.rg_fzf_lua,
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    {
      'junegunn/fzf',
      build = './install --bin',
    },
  },
  config = function()
    local fzf_lua = require('fzf-lua')
    local actions = require('fzf-lua.actions')

    local opts = {
      winopts = {
        width = 0.9,
        border = vim.g.rg_border,
        preview = {
          vertical = 'up:50%',
          layout = 'vertical',
          delay = 0, -- Increase delay to reduce lag on fast scrolling
        },
      },
      keymap = {
        builtin = {
          false, -- do not inherit from defaults
          -- neovim `:tmap` mappings for the fzf win
          ['<F1>'] = 'toggle-help',
          ['<F2>'] = 'toggle-fullscreen',
          -- Only valid with the 'builtin' previewer
          ['<F3>'] = 'toggle-preview-wrap',
          ['<F4>'] = 'toggle-preview',
          -- Rotate preview clockwise/counter-clockwise
          ['<F5>'] = 'toggle-preview-ccw',
          ['<F6>'] = 'toggle-preview-cw',
          ['<C-f>'] = 'preview-down',
          ['<C-b>'] = 'preview-up',
          ['<C-d>'] = 'preview-page-down',
          ['<C-u>'] = 'preview-page-up',
          ['<C-r>'] = 'preview-page-reset',
        },
        fzf = {
          false, -- do not inherit from defaults
          -- fzf '--bind=' options
          ['ctrl-x'] = 'clear-query',
          ['ctrl-space'] = 'toggle',
          ['ctrl-o'] = 'toggle-all',
          ['ctrl-l'] = 'clear-selection',
          ['ctrl-k'] = 'first',
          ['ctrl-j'] = 'last',
          -- Only valid with fzf previewers (bat/cat/git/etc)
          ['f3'] = 'toggle-preview-wrap',
          ['f4'] = 'toggle-preview',
          ['ctrl-f'] = 'preview-down',
          ['ctrl-b'] = 'preview-up',
          ['ctrl-d'] = 'preview-page-down',
          ['ctrl-u'] = 'preview-page-up',
        },
      },
      actions = {
        files = {
          -- providers that inherit these actions:
          --   files, git_files, git_status, grep, lsp
          --   oldfiles, quickfix, loclist, tags, btags
          --   args
          false, -- do not inherit from defaults,
          ['default'] = actions.file_edit_or_qf,
          ['ctrl-s'] = actions.file_split,
          ['ctrl-v'] = actions.file_vsplit,
          ['ctrl-q'] = actions.file_edit_or_qf,
        },
        buffers = {
          false, -- do not inherit from defaults
          -- providers that inherit these actions:
          --   buffers, tabs, lines, blines
          ['default'] = actions.buf_edit_or_qf,
          ['ctrl-s'] = actions.buf_split,
          ['ctrl-v'] = actions.buf_vsplit,
          ['ctrl-g'] = {
            fn = actions.buf_del,
            reload = true,
          },
          ['ctrl-q'] = actions.buf_edit_or_qf,
        },
      },
      diagnostics = {
        multiline = false,
      },
    }
    fzf_lua.setup(opts)

    fzf_lua.register_ui_select()

    vim.keymap.set('n', '<leader>?', fzf_lua.oldfiles, { desc = 'FzfLua: Search recently opened files' })
    vim.keymap.set('n', '<leader>/', fzf_lua.lgrep_curbuf, { desc = 'FzfLua: Search in current buffer' })
    vim.keymap.set('n', '<leader>sa', function()
      fzf_lua.files({
        find_opts = [[-type f -printf '%P\n']],
        rg_opts = [[--color=never --files --hidden --follow]],
        fd_opts = [[--color=never --type f --hidden --follow]],
      })
    end, { desc = 'FzfLua: Search all files' })
    vim.keymap.set('n', '<leader>sf', fzf_lua.files, { desc = 'FzfLua: Search files' })
    vim.keymap.set('n', '<leader>sg', fzf_lua.git_files, { desc = 'FzfLua: Search git files' })
    vim.keymap.set('n', '<leader>sb', fzf_lua.buffers, { desc = 'FzfLua: Search buffers' })
    vim.keymap.set('n', '<leader>sq', fzf_lua.quickfix, { desc = 'FzfLua: Search quickfix' })
    vim.keymap.set('n', '<leader>sh', fzf_lua.helptags, { desc = 'FzfLua: Search help' })
    vim.keymap.set('n', '<leader>sd', fzf_lua.diagnostics_workspace, { desc = 'FzfLua: Search diagnostics' })
    vim.keymap.set('n', '<leader>sr', fzf_lua.resume, { desc = 'FzfLua: Search resume' })
    vim.keymap.set('n', '<leader>sk', fzf_lua.keymaps, { desc = 'FzfLua: Search keymaps' })
    vim.keymap.set('n', '<leader>sc', fzf_lua.commands, { desc = 'FzfLua: Search commands' })
    vim.keymap.set('n', '<leader>sw', fzf_lua.grep_cword, { desc = 'FzfLua: Search current word' })
    vim.keymap.set('n', '<leader>ss', fzf_lua.live_grep, { desc = 'FzfLua: Search something' })
    vim.keymap.set('v', '<leader>sv', fzf_lua.grep_visual, { desc = 'FzfLua: Search visual selection' })

    -- Harpoon
    vim.keymap.set('n', '<leader>hs', function()
      local harpoon_files = require('harpoon'):list()
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end

      fzf_lua.fzf_exec(file_paths, {
        prompt = 'Harpoon> ',
        previewer = 'builtin',
        actions = vim.tbl_extend('force', fzf_lua.defaults.actions.files, opts.actions.files),
      })
    end, { desc = 'FzfLua + Harpoon: Search files' })
  end,
}
