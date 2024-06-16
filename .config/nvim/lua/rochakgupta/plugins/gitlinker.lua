return {
  'ruifm/gitlinker.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  cond = vim.g.rg_gitlinker,
  config = function()
    local gitlinker = require('gitlinker')
    local actions = require('gitlinker.actions')

    gitlinker.setup({
      opts = {
        add_current_line_on_normal_mode = false,
        print_url = false,
      },
      callbacks = {},
      mappings = nil,
    })

    local set_keymaps = function(key, action, desc)
      vim.keymap.set('n', key, function()
        gitlinker.get_buf_range_url('n', {
          action_callback = action,
        })
      end, { desc = desc, silent = true })

      vim.keymap.set('v', key, function()
        gitlinker.get_buf_range_url('v', {
          action_callback = action,
        })
      end, { desc = desc })
    end

    set_keymaps('gy', actions.copy_to_clipboard, 'Copy [R]emote url of file to clipboard')
    set_keymaps('gY', actions.open_in_browser, 'Open [R]emote url of file in browser')
  end,
}
