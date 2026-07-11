return {
  'folke/sidekick.nvim',
  dependencies = {
    'folke/snacks.nvim',
  },
  opts = {
    nes = {
      enabled = false,
    },
    cli = {
      mux = {
        backend = 'tmux',
        enabled = false,
      },
      tools = {
        agy = {
          cmd = { 'agy' },
        },
      },
      win = {
        wo = {
          number = true,
          relativenumber = true,
        },
        layout = 'float',
        float = {
          width = 0.9,
          height = 0.85,
          border = vim.g.rg_border,
        },
        split = {
          width = 0,
          height = 0,
        },
        keys = {
          prompt = { '<c-z>', 'prompt', mode = 't', desc = 'insert prompt or context' },
        },
      },
    },
    copilot = {
      status = {
        enabled = false,
      },
    },
  },
  config = function(_, opts)
    require('sidekick').setup(opts)

    local tools = require('rochakgupta.utils').get_table_keys(opts.cli.tools)
    local all_tools = require('sidekick.config').cli.tools
    for name in pairs(all_tools) do
      if not vim.list_contains(tools, name) then
        all_tools[name] = nil
      end
    end
  end,
  keys = {
    {
      '<c-x>',
      function()
        local is_open = false
        for _, term in pairs(require('sidekick.cli.terminal').terminals) do
          if term:is_open() then
            is_open = true
            break
          end
        end

        if is_open then
          require('sidekick.cli').hide({ all = true })
        else
          require('sidekick.cli').show()
        end
      end,
      desc = 'Sidekick: Toggle',
      mode = { 'n', 't', 'i', 'x' },
    },
    {
      '<leader>kc',
      function()
        require('sidekick.cli').close()
      end,
      desc = 'Sidekick: Close CLI',
    },
    {
      '<leader>ka',
      function()
        require('sidekick.cli').send({ msg = '{this}' })
      end,
      mode = { 'x', 'n' },
      desc = 'Sidekick: Send This',
    },
    {
      '<leader>kf',
      function()
        require('sidekick.cli').send({ msg = '{file}' })
      end,
      desc = 'Sidekick: Send File',
    },
    {
      '<leader>kv',
      function()
        require('sidekick.cli').send({ msg = '{selection}' })
      end,
      mode = { 'x' },
      desc = 'Sidekick: Send Visual Selection',
    },
    {
      '<leader>kp',
      function()
        require('sidekick.cli').prompt()
      end,
      mode = { 'n', 'x' },
      desc = 'Sidekick: Sidekick Select Prompt',
    },
  },
}
