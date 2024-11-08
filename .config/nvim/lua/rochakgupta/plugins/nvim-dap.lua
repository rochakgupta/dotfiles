return {
  'mfussenegger/nvim-dap',
  dependencies = {
    'rcarriga/nvim-dap-ui',
    'theHamsta/nvim-dap-virtual-text',
    'nvim-neotest/nvim-nio',
    'williamboman/mason.nvim', -- Configured in mason.lua
    'jay-babu/mason-nvim-dap.nvim',
    'leoluz/nvim-dap-go',
    'mfussenegger/nvim-dap-python',
  },
  config = function()
    local dap = require('dap')
    local dapui = require('dapui')

    require('mason-nvim-dap').setup({
      automatic_installation = true,
      handlers = {},
      ensure_installed = {
        'delve', -- Go
        'python', -- Python
      },
    })

    require('nvim-dap-virtual-text').setup()

    dapui.setup({
      layouts = {
        {
          elements = {
            {
              id = 'scopes',
              size = 0.33,
            },
            {
              id = 'breakpoints',
              size = 0.33,
            },
            {
              id = 'stacks',
              size = 0.33,
            },
            -- {
            --   id = 'watches',
            --   size = 0.25,
            -- },
          },
          position = 'left',
          size = 50,
        },
        {
          elements = {
            {
              id = 'repl',
              size = 1,
            },
            -- {
            --   id = 'console',
            --   size = 0.5,
            -- },
          },
          position = 'bottom',
          size = 15,
        },
      },
      floating = {
        border = vim.g.rg_border,
      },
    })

    dap.listeners.before.attach['dapui_config'] = dapui.open
    dap.listeners.before.launch['dapui_config'] = dapui.open
    dap.listeners.before.event_terminated['dapui_config'] = dapui.close
    dap.listeners.before.event_exited['dapui_config'] = dapui.close

    vim.keymap.set('n', '<leader>bt', dap.toggle_breakpoint, { desc = 'DAP: Toggle breakpoint' })
    vim.keymap.set('n', '<leader>dr', dap.run_to_cursor, { desc = 'DAP: Run to cursor' })

    -- Eval var under cursor
    vim.keymap.set('n', '<leader>de', function()
      dapui.eval(nil, { enter = true })
    end, { desc = 'DAP: Evaluate under cursor' })

    vim.keymap.set('n', '<F1>', dap.continue, { desc = 'DAP: Continue' })
    vim.keymap.set('n', '<F2>', dap.step_over, { desc = 'DAP: Step over' })
    vim.keymap.set('n', '<F3>', dap.step_into, { desc = 'DAP: Step into' })
    vim.keymap.set('n', '<F4>', dap.step_out, { desc = 'DAP: Step out' })
    vim.keymap.set('n', '<F5>', dap.restart, { desc = 'DAP: Restart' })
    vim.keymap.set('n', '<F6>', dap.clear_breakpoints, { desc = 'DAP: Clear breakpoints' })
    vim.keymap.set('n', '<F7>', dap.close, { desc = 'DAP: Close' })
    -- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
    vim.keymap.set('n', '<F8>', dapui.toggle, { desc = 'DAP: See last session result' })

    -- Install Go specific config
    require('dap-go').setup()

    -- Install Python specific config
    local mason_registry = require('mason-registry')
    if mason_registry.is_installed('debugpy') then
      local debugpy_install = mason_registry.get_package('debugpy'):get_install_path()
      local python_install = debugpy_install .. '/venv/bin/python'
      require('dap-python').setup(python_install)
    else
      require('rochakgupta.utils').notify_warn('Install debugpy via mason')
    end
  end,
}
