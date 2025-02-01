return {
  'echasnovski/mini.nvim',
  version = '*',
  config = function()
    require('mini.align').setup()

    require('mini.bracketed').setup({
      buffer = { options = { wrap = false } },
      comment = { options = { wrap = false } },
      conflict = { options = { wrap = false } },
      diagnostic = { options = { wrap = false } },
      file = { options = { wrap = false } },
      indent = { options = { wrap = false } },
      jump = { options = { wrap = false } },
      location = { options = { wrap = false } },
      oldfile = { options = { wrap = false } },
      quickfix = { options = { wrap = false } },
      treesitter = { options = { wrap = false } },
      undo = { options = { wrap = false } },
      window = { options = { wrap = false } },
      yank = { options = { wrap = false } },
    })

    require('mini.comment').setup()

    local MiniFiles = require('mini.files')
    MiniFiles.setup({
      mappings = {
        close = '',
        go_in = '',
        go_out = '',
      },
      options = {
        use_as_default_explorer = true,
      },
      windows = {
        max_number = 2,
        preview = true,
        width_focus = 30,
        width_nofocus = 30,
        width_preview = 100,
      },
      content = {
        -- Disable icons
        prefix = function() end,
      },
    })

    vim.keymap.set('n', '<leader>x', function()
      if not MiniFiles.close() then
        local buf_name = vim.api.nvim_buf_get_name(0)
        local path = vim.fn.filereadable(buf_name) == 1 and buf_name or vim.fn.getcwd()
        MiniFiles.open(path)
        MiniFiles.reveal_cwd()
      end
    end, { desc = 'MiniFiles: Open' })

    local map_split = function(buf_id, lhs, direction)
      local rhs = function()
        -- Make new window and set it as target
        local new_target_window
        vim.api.nvim_win_call(MiniFiles.get_explorer_state().target_window, function()
          vim.cmd(direction .. ' split')
          new_target_window = vim.api.nvim_get_current_win()
        end)

        MiniFiles.set_target_window(new_target_window)
        MiniFiles.close()
      end

      -- Adding `desc` will result into `show_help` entries
      local desc = 'Split ' .. direction
      vim.keymap.set('n', lhs, rhs, { buffer = buf_id, desc = desc })
    end

    vim.api.nvim_create_autocmd('User', {
      pattern = 'MiniFilesBufferCreate',
      callback = function(args)
        local buf_id = args.data.buf_id
        map_split(buf_id, '<C-s>', 'horizontal')
        map_split(buf_id, '<C-\\>', 'vertical')
      end,
    })

    vim.api.nvim_create_autocmd('User', {
      pattern = 'MiniFilesBufferCreate',
      callback = function(args)
        vim.keymap.set('n', '<C-w>', function(path)
          -- Works only if cursor is on the valid file system entry
          local cur_entry_path = MiniFiles.get_fs_entry().path
          local cur_directory = vim.fs.dirname(cur_entry_path)
          vim.fn.chdir(cur_directory)
        end, { buffer = args.data.buf_id })
      end,
    })

    require('mini.move').setup()

    require('mini.operators').setup({
      evaluate = {
        prefix = '',
      },
      exchange = {
        prefix = '<leader>e',
      },
      multiply = {
        prefix = '',
      },
      replace = {
        prefix = '<leader>r',
      },
      sort = {
        prefix = '',
      },
    })
  end,
}
