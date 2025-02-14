return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  cond = vim.g.rg_telescope,
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
      cond = vim.fn.executable('make') == 1,
    },
    'nvim-telescope/telescope-live-grep-args.nvim',
    'nvim-telescope/telescope-ui-select.nvim',
  },
  config = function()
    local telescope = require('telescope')
    local actions = require('telescope.actions')
    local builtin = require('telescope.builtin')
    local pickers = require('telescope.pickers')
    local finders = require('telescope.finders')
    local config = require('telescope.config').values
    local state = require('telescope.state')
    local actions_state = require('telescope.actions.state')

    -- Scroll preview one line at a time
    -- https://github.com/nvim-telescope/telescope.nvim/issues/2602#issuecomment-1636809235
    local slow_scroll = function(prompt_bufnr, direction)
      local previewer = actions_state.get_current_picker(prompt_bufnr).previewer
      local status = state.get_status(prompt_bufnr)

      -- Check if we actually have a previewer and a preview window
      if type(previewer) ~= 'table' or previewer.scroll_fn == nil or status.preview_win == nil then
        return
      end

      previewer:scroll_fn(1 * direction)
    end

    telescope.setup({
      defaults = {
        border = vim.g.rg_border ~= 'none',
        borderchars = vim.g.rg_border == 'single' and { '─', '│', '─', '│', '┌', '┐', '┘', '└' } or nil,
        layout_strategy = 'vertical',
        layout_config = {
          width = 0.9,
          prompt_position = 'top',
          horizontal = {
            preview_width = 0.5,
          },
          vertical = {
            preview_height = 0.5,
          },
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
            ['<C-q>'] = actions.smart_send_to_qflist + actions.open_qflist,
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
        git_status = {
          layout_strategy = 'horizontal',
        },
        git_commits = {
          layout_strategy = 'horizontal',
        },
        git_bcommits = {
          layout_strategy = 'horizontal',
        },
      },
      extensions = {
        live_grep_args = {
          auto_quoting = true,
          mappings = {
            i = {
              ['<C-g>'] = require('telescope-live-grep-args.actions').quote_prompt(),
            },
          },
        },
      },
    })

    -- Enable telescope fzf native, if installed
    pcall(telescope.load_extension, 'fzf')

    -- Enable persisted, if installed
    pcall(telescope.load_extension, 'persisted')

    -- Enable yanky, if installed
    pcall(telescope.load_extension, 'yank_history')

    -- Enable telescope-ui-select, if installed
    pcall(telescope.load_extension, 'ui-select')

    -- Keymaps
    vim.keymap.set('n', '<leader>?', builtin.oldfiles, { desc = 'Telescope: Search recently opened files' })
    vim.keymap.set('n', '<leader>/', builtin.current_buffer_fuzzy_find, { desc = 'Telescope: Search in current buffer' })
    vim.keymap.set('n', '<leader>sa', function()
      builtin.find_files({
        hidden = true,
        no_ignore = true,
        no_parent_ignore = true,
      })
    end, { desc = 'Telescope: Search all files' })
    vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = 'Telescope: Search files' })
    vim.keymap.set('n', '<leader>sg', builtin.git_files, { desc = 'Telescope: Search git Files' })
    vim.keymap.set('n', '<leader>sb', builtin.buffers, { desc = 'Telescope: Search buffers' })
    vim.keymap.set('n', '<leader>sq', builtin.quickfix, { desc = 'Telescope: Search quickfix' })
    vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = 'Telescope: Search help' })
    vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = 'Telescope: Search diagnostics' })
    vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = 'Telescope: Search resume' })
    vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = 'Telescope: Search keymaps' })
    vim.keymap.set('n', '<leader>sc', builtin.commands, { desc = 'Telescope: Search commands' })

    -- Enable telescope live grep args, if installed
    if pcall(telescope.load_extension, 'live_grep_args') then
      local lga_shortcuts = require('telescope-live-grep-args.shortcuts')
      vim.keymap.set('n', '<leader>ss', telescope.extensions.live_grep_args.live_grep_args, { desc = 'Telescope: Search something' })
      vim.keymap.set('n', '<leader>sw', lga_shortcuts.grep_word_under_cursor, { desc = 'Telescope: Search current word' })
      vim.keymap.set('v', '<leader>sv', lga_shortcuts.grep_visual_selection, { desc = 'Telescope: Search visual selection' })
    else
      vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = 'Telescope: Search current word' })
      vim.keymap.set('n', '<leader>ss', builtin.live_grep, { desc = 'Telescope: Search something' })
    end

    vim.keymap.set('n', '<leader>gs', builtin.git_status, { desc = 'Telescope: Git status' })
    vim.keymap.set('n', '<leader>gc', builtin.git_commits, { desc = 'Telescope: Git commits' })
    vim.keymap.set('n', '<leader>gg', builtin.git_bcommits, { desc = 'Telescope: Git buffer commits' })

    -- Harpoon
    vim.keymap.set('n', '<leader>hs', function()
      local harpoon_files = require('harpoon'):list()
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end

      pickers
        .new({}, {
          prompt_title = 'Harpoon',
          finder = finders.new_table({
            results = file_paths,
          }),
          previewer = config.file_previewer({}),
          sorter = config.generic_sorter({}),
        })
        :find()
    end, { desc = 'Telescope + Harpoon: Search files' })
  end,
}
