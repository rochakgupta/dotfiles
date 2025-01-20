return {
  'echasnovski/mini.nvim',
  version = '*',
  config = function()
    require('mini.align').setup()

    require('mini.bracketed').setup()

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
        max_number = 3,
        preview = true,
        width_focus = 30,
        width_nofocus = 30,
        width_preview = 100,
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
