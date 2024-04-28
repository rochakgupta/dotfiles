local use_telescope = require('rochakgupta.settings').finder == 'telescope'

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
      {
        'nvim-telescope/telescope-live-grep-args.nvim',
        cond = function()
          return use_telescope
        end,
      },
      'nvim-telescope/telescope-ui-select.nvim',
    },
    config = function()
      local telescope = require('telescope')
      local actions = require('telescope.actions')
      local builtin = require('telescope.builtin')

      -- Scroll preview one line at a time
      -- https://github.com/nvim-telescope/telescope.nvim/issues/2602#issuecomment-1636809235
      local slow_scroll = function(prompt_bufnr, direction)
        local previewer = require('telescope.actions.state').get_current_picker(prompt_bufnr).previewer
        local status = require('telescope.state').get_status(prompt_bufnr)

        -- Check if we actually have a previewer and a preview window
        if type(previewer) ~= 'table' or previewer.scroll_fn == nil or status.preview_win == nil then
          return
        end

        previewer:scroll_fn(1 * direction)
      end

      local extensions = {}
      if use_telescope then
        vim.tbl_extend('force', extensions, {
          live_grep_args = {
            auto_quoting = true,
            mappings = {
              i = {
                ['<C-g>'] = require('telescope-live-grep-args.actions').quote_prompt(),
              },
            },
          },
        })
      end

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
              ['<C-f>'] = function(bufnr)
                slow_scroll(bufnr, 1)
              end,
              ['<C-b>'] = function(bufnr)
                slow_scroll(bufnr, -1)
              end,
              ['<C-s>'] = actions.select_horizontal,
            },
            n = {
              ['<C-s>'] = actions.select_horizontal,
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
        extensions = extensions,
      })

      -- Enable telescope fzf native, if installed
      pcall(telescope.load_extension, 'fzf')

      -- Enable persisted, if installed
      pcall(telescope.load_extension, 'persisted')

      -- Enable yanky, if installed
      pcall(telescope.load_extension, 'yank_history')

      -- Enable harpoon, if installed
      if pcall(telescope.load_extension, 'harpoon') then
        vim.keymap.set('n', '<leader>hs', '<cmd>Telescope harpoon marks<CR>', { desc = '[H]arpoon [S]earch Files' })
      end

      if use_telescope then
        -- Enable telescope-ui-select, if installed
        pcall(telescope.load_extension, 'ui-select')

        -- Keymaps
        vim.keymap.set('n', '<leader>?', builtin.oldfiles, { desc = '[?] Find recently opened files' })
        vim.keymap.set('n', '<leader>/', builtin.current_buffer_fuzzy_find, { desc = '[/] Fuzzily search in current buffer' })
        vim.keymap.set('n', '<leader>sa', function()
          builtin.find_files({
            hidden = true,
            no_ignore = true,
            no_parent_ignore = true,
          })
        end, { desc = '[S]earch [A]ll Files' })
        vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
        vim.keymap.set('n', '<leader>sg', builtin.git_files, { desc = '[S]earch [G]it Files' })
        vim.keymap.set('n', '<leader>sb', builtin.buffers, { desc = '[S]earch [B]uffers' })
        vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
        vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
        vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
        vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
        vim.keymap.set('n', '<leader>sc', builtin.commands, { desc = '[S]earch [C]ommands' })

        -- Enable telescope live grep args, if installed
        if pcall(telescope.load_extension, 'live_grep_args') then
          local lga_shortcuts = require('telescope-live-grep-args.shortcuts')
          vim.keymap.set('n', '<leader>ss', telescope.extensions.live_grep_args.live_grep_args, { desc = '[S]earch [S]omething' })
          vim.keymap.set('n', '<leader>sw', lga_shortcuts.grep_word_under_cursor, { desc = '[S]earch current [W]ord' })
          vim.keymap.set('v', '<leader>sv', lga_shortcuts.grep_visual_selection, { desc = '[S]earch [V]isual selection' })
        else
          vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
          vim.keymap.set('n', '<leader>ss', builtin.live_grep, { desc = '[S]earch [S]omething' })
        end
      end
    end,
  },
}
