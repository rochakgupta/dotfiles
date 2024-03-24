return {
  -- Fuzzy Finder (files, lsp, etc)
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        -- Fuzzy Finder Algorithm which requires local dependencies to be built.
        -- Only load if `make` is available. Make sure you have the system
        -- requirements installed.
        'nvim-telescope/telescope-fzf-native.nvim',
        -- NOTE: If you are having trouble with this installation,
        --       refer to the README for telescope-fzf-native for more instructions.
        build = 'make',
        cond = function()
          return vim.fn.executable('make') == 1
        end,
      },
      'nvim-telescope/telescope-live-grep-args.nvim',
      'nvim-telescope/telescope-ui-select.nvim',
    },
    config = function()
      local telescope = require('telescope')
      local actions = require('telescope.actions')
      local builtin = require('telescope.builtin')
      local lga_actions = require('telescope-live-grep-args.actions')
      local lga_shortcuts = require('telescope-live-grep-args.shortcuts')

      telescope.setup({
        defaults = {
          layout_strategy = 'vertical',
          layout_config = {
            width = 0.9,
            prompt_position = 'top',
            preview_height = 0.5,
          },
          scroll_strategy = 'limit',
          -- path_display = {
          --   'shorten',
          -- },
          sorting_strategy = 'ascending',
          mappings = {
            i = {
              ['<C-f>'] = actions.move_selection_next,
              ['<C-b>'] = actions.move_selection_previous,
            },
          },
        },
        pickers = {
          buffers = {
            sort_lastused = true,
            mappings = {
              i = {
                ['<C-g>'] = actions.delete_buffer,
              },
            },
          },
          diagnostics = { layout_strategy = 'vertical' },
        },
        extensions = {
          live_grep_args = {
            auto_quoting = true,
            mappings = {
              i = {
                ['<C-k>'] = lga_actions.quote_prompt(),
              },
            },
          },
        },
      })

      -- Enable telescope fzf native, if installed
      pcall(telescope.load_extension, 'fzf')

      -- Enable telescope-ui-select, if installed
      pcall(telescope.load_extension, 'ui-select')

      -- Enable persisted, if installed
      pcall(telescope.load_extension, 'persisted')

      -- Keymaps
      vim.keymap.set('n', '<leader>?', builtin.oldfiles, { desc = '[?] Find recently opened files' })
      vim.keymap.set('n', '<leader>/', builtin.current_buffer_fuzzy_find, { desc = '[/] Fuzzily search in current buffer' })
      vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
      vim.keymap.set('n', '<leader>sg', builtin.git_files, { desc = '[S]earch [G]it Files' })
      vim.keymap.set('n', '<leader>sb', builtin.buffers, { desc = '[S]earch [B]uffers' })
      vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
      vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
      vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
      vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
      vim.keymap.set('n', '<leader>sc', builtin.commands, { desc = '[S]earch [C]ommands' })

      -- Enable telescope live grep args, if installed
      local ok = pcall(telescope.load_extension, 'live_grep_args')
      if ok then
        vim.keymap.set('n', '<leader>ss', telescope.extensions.live_grep_args.live_grep_args, { desc = '[S]earch [S]omething' })
        vim.keymap.set('n', '<leader>sw', lga_shortcuts.grep_word_under_cursor, { desc = '[S]earch current [W]ord' })
        vim.keymap.set('v', '<leader>sv', lga_shortcuts.grep_visual_selection, { desc = '[S]earch [V]isual selection' })
      else
        vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
        vim.keymap.set('n', '<leader>ss', builtin.live_grep, { desc = '[S]earch [S]omething' })
      end

      -- Enable harpoon, if installed
      ok = pcall(telescope.load_extension, 'harpoon')
      if ok then
        vim.keymap.set('n', '<leader>hs', '<cmd>Telescope harpoon marks<CR>', { desc = '[H]arpoon [S]earch Files' })
      end
    end,
  },
}
