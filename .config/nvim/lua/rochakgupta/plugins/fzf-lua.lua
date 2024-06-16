return {
  'ibhagwan/fzf-lua',
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
        -- These override the default tables completely
        -- no need to set to `false` to disable a bind
        -- delete or modify is sufficient
        builtin = {
          -- neovim `:tmap` mappings for the fzf win
          ['<F1>'] = 'toggle-help',
          ['<F2>'] = 'toggle-fullscreen',
          -- Only valid with the 'builtin' previewer
          ['<F3>'] = 'toggle-preview-wrap',
          ['<F4>'] = 'toggle-preview',
          -- Rotate preview clockwise/counter-clockwise
          ['<F5>'] = 'toggle-preview-ccw',
          ['<F6>'] = 'toggle-preview-cw',
          ['<C-f>'] = 'preview-page-down',
          ['<C-b>'] = 'preview-page-up',
          ['<C-r>'] = 'preview-page-reset',
        },
        fzf = {
          -- fzf '--bind=' options
          ['ctrl-l'] = 'clear-query',
          ['ctrl-c'] = 'abort',
          ['tab'] = 'toggle-out',
          ['shift-tab'] = 'toggle-in',
          ['ctrl-o'] = 'toggle-all',
          ['ctrl-f'] = 'preview-down',
          ['ctrl-b'] = 'preview-up',
          -- Only valid with fzf previewers (bat/cat/git/etc)
          ['f3'] = 'toggle-preview-wrap',
          ['f4'] = 'toggle-preview',
          ['ctrl-d'] = 'preview-page-down',
          ['ctrl-u'] = 'preview-page-up',
        },
      },
      actions = {
        -- These override the default tables completely
        -- no need to set to `false` to disable an action
        -- delete or modify is sufficient
        files = {
          -- providers that inherit these actions:
          --   files, git_files, git_status, grep, lsp
          --   oldfiles, quickfix, loclist, tags, btags
          --   args
          -- default action opens a single selection
          -- or sends multiple selection to quickfix
          -- replace the default action with the below
          -- to open all files whether single or multiple
          -- ["default"]     = actions.file_edit,
          ['default'] = actions.file_edit_or_qf,
          ['ctrl-s'] = actions.file_split,
          ['ctrl-v'] = actions.file_vsplit,
          ['ctrl-q'] = actions.file_edit_or_qf,
        },
        buffers = {
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
    }
    fzf_lua.setup(opts)

    if vim.g.rg_fzf_lua then
      fzf_lua.register_ui_select()

      vim.keymap.set('n', '<leader>?', fzf_lua.oldfiles, { desc = '[?] Find recently opened files' })
      vim.keymap.set('n', '<leader>/', fzf_lua.lgrep_curbuf, { desc = '[/] Fuzzily search in current buffer' })
      vim.keymap.set('n', '<leader>sa', function()
        fzf_lua.files({
          find_opts = [[-type f -printf '%P\n']],
          rg_opts = [[--color=never --files --hidden --follow]],
          fd_opts = [[--color=never --type f --hidden --follow]],
        })
      end, { desc = '[S]earch [A]ll Files' })
      vim.keymap.set('n', '<leader>sf', fzf_lua.files, { desc = '[S]earch [F]iles' })
      vim.keymap.set('n', '<leader>sg', fzf_lua.git_files, { desc = '[S]earch [G]it Files' })
      vim.keymap.set('n', '<leader>sb', fzf_lua.buffers, { desc = '[S]earch [B]uffers' })
      vim.keymap.set('n', '<leader>sh', fzf_lua.helptags, { desc = '[S]earch [H]elp' })
      vim.keymap.set('n', '<leader>sd', fzf_lua.diagnostics_workspace, { desc = '[S]earch [D]iagnostics' })
      vim.keymap.set('n', '<leader>sr', fzf_lua.resume, { desc = '[S]earch [R]esume' })
      vim.keymap.set('n', '<leader>sk', fzf_lua.keymaps, { desc = '[S]earch [K]eymaps' })
      vim.keymap.set('n', '<leader>sc', fzf_lua.commands, { desc = '[S]earch [C]ommands' })
      vim.keymap.set('n', '<leader>sw', fzf_lua.grep_cword, { desc = '[S]earch current [W]ord' })
      vim.keymap.set('n', '<leader>ss', fzf_lua.live_grep, { desc = '[S]earch [S]omething' })
      vim.keymap.set('v', '<leader>sv', fzf_lua.grep_visual, { desc = '[S]earch [V]isual selection' })

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
      end, { desc = '[H]arpoon [S]earch Files' })
    end
  end,
}
