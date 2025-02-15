return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  config = function()
    require('snacks').setup({
      indent = {
        enabled = vim.g.rg_snacks_indent and not vim.g.started_by_firenvim,
        animate = {
          enabled = false,
        },
      },
      explorer = {
        enabled = vim.g.rg_snacks_explorer,
        replace_netrw = false,
      },
      picker = {
        enabled = vim.g.rg_snacks_picker or vim.g.rg_snacks_explorer,
        layout = {
          cycle = true,
          preset = 'dropdown',
          layout = {
            width = 0.9,
            height = 0.9,
            border = 'none',
            box = 'vertical',
            { win = 'preview', title = '{preview}', height = 0.5, border = vim.g.rg_border },
            {
              box = 'vertical',
              border = vim.g.rg_border,
              title = '{title} {live} {flags}',
              title_pos = 'center',
              { win = 'input', height = 1, border = 'bottom' },
              { win = 'list', border = 'none' },
            },
          },
        },
        icons = {
          ui = {
            selected = '> ',
          },
        },
        formatters = {
          selected = {
            show_always = true,
            unselected = false,
          },
        },
        sources = {
          explorer = {
            hidden = true,
            supports_live = false,
            diagnostics_open = true,
            git_status_open = true,
            layout = {
              preset = 'sidebar',
              preview = false,
              layout = {
                width = math.floor(vim.opt.columns:get() * 0.2),
                position = 'left',
                border = 'none',
                box = 'vertical',
                { win = 'list', border = 'none' },
              },
            },
            win = {
              list = {
                keys = {
                  ['<Esc>'] = '',
                  ['U'] = 'explorer_up',
                  ['<c-c>'] = '',
                  ['W'] = 'tcd',
                  ['F'] = 'explorer_focus',
                  ['I'] = 'toggle_ignored',
                  ['.'] = 'toggle_hidden',
                  ['H'] = 'explorer_close_all',
                },
              },
            },
          },
        },
        win = {
          input = {
            keys = {
              ['<c-a>'] = '',
              ['<c-o>'] = { 'select_all', mode = { 'n', 'i' } },
            },
          },
          list = {
            keys = {
              ['<c-a>'] = '',
              ['<c-o>'] = 'select_all',
            },
          },
        },
      },
    })

    if vim.g.rg_snacks_explorer then
      vim.keymap.set('n', '<leader>z', require('snacks.picker').explorer, { desc = 'Snacks: Toggle explorer' })
    end

    if vim.g.rg_snacks_picker then
      vim.keymap.set('n', '<leader>?', require('snacks.picker').recent, { desc = 'Snacks: Search recently opened files' })
      vim.keymap.set('n', '<leader>sa', function()
        require('snacks.picker').files({
          hidden = true,
          ignored = true,
        })
      end, { desc = 'Snacks: Search all files' })
      vim.keymap.set('n', '<leader>sf', function()
        require('snacks.picker').files({
          hidden = true,
        })
      end, { desc = 'Snacks: Search files' })
      vim.keymap.set('n', '<leader>sg', require('snacks.picker').git_files, { desc = 'Snacks: Search git files' })
      vim.keymap.set('n', '<leader>sb', function()
        require('snacks.picker').buffers({
          current = false,
        })
      end, { desc = 'Snacks: Search buffers' })
      vim.keymap.set('n', '<leader>sq', require('snacks.picker').qflist, { desc = 'Snacks: Search quickfix' })
      vim.keymap.set('n', '<leader>sl', require('snacks.picker').loclist, { desc = 'Snacks: Search location list' })
      vim.keymap.set('n', '<leader>sh', require('snacks.picker').help, { desc = 'Snacks: Search help' })
      vim.keymap.set('n', '<leader>sd', require('snacks.picker').diagnostics, { desc = 'Snacks: Search diagnostics' })
      vim.keymap.set('n', '<leader>sD', require('snacks.picker').diagnostics_buffer, { desc = 'Snacks: Search buffer diagnostics' })
      vim.keymap.set('n', '<leader>sr', require('snacks.picker').resume, { desc = 'Snacks: Search resume' })
      vim.keymap.set('n', '<leader>sk', require('snacks.picker').keymaps, { desc = 'Snacks: Search keymaps' })
      vim.keymap.set('n', '<leader>sc', require('snacks.picker').commands, { desc = 'Snacks: Search commands' })
      vim.keymap.set('n', '<leader>:', require('snacks.picker').command_history, { desc = 'Snacks: Search command history' })
      vim.keymap.set('n', '<leader>sw', require('snacks.picker').grep_word, { desc = 'Snacks: Search word' })
      vim.keymap.set('v', '<leader>sv', require('snacks.picker').grep_word, { desc = 'Snacks: Search visual selection' })
      vim.keymap.set('n', '<leader>ss', require('snacks.picker').grep, { desc = 'Snacks: Search something' })
      vim.keymap.set('n', '<leader>/', require('snacks.picker').lines, { desc = 'Snacks: Search lines' })
      vim.keymap.set('n', '<leader>s/', require('snacks.picker').search_history, { desc = 'Snacks: Search history' })
      vim.keymap.set('n', '<leader>si', require('snacks.picker').icons, { desc = 'Snacks: Search icons' })
      vim.keymap.set('n', '<leader>sj', require('snacks.picker').jumps, { desc = 'Snacks: Search jumps' })
      vim.keymap.set('n', '<leader>sm', require('snacks.picker').man, { desc = 'Snacks: Search manpages' })
      vim.keymap.set('n', '<leader>sp', require('snacks.picker').lazy, { desc = 'Snacks: Search plugins' })
      vim.keymap.set('n', '<leader>su', require('snacks.picker').undo, { desc = 'Snacks: Search undo' })
      vim.keymap.set('n', '<leader>gs', require('snacks.picker').git_status, { desc = 'Snacks: Search git status' })
      vim.keymap.set('n', '<leader>gc', require('snacks.picker').git_log, { desc = 'Snacks: Search git log' })
      vim.keymap.set('n', '<leader>gg', require('snacks.picker').git_log_file, { desc = 'Snacks: Search git log for file' })
      vim.keymap.set('n', '<leader>gb', require('snacks.picker').git_log_line, { desc = 'Snacks: Search git log for line' })
      vim.keymap.set('n', '<leader>gd', require('snacks.picker').git_diff, { desc = 'Snacks: Search git diff' })
    end
  end,
}
