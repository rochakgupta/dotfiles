vim.keymap.set('n', '<leader>dc', require('dap-python').test_class, { buffer = 0, desc = 'Debug: Class' })
vim.keymap.set('n', '<leader>dt', require('dap-python').test_method, { buffer = 0, desc = 'Debug: Method' })
