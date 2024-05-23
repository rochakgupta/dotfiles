-- Default number of spaces a tab counts for
vim.opt_local.tabstop = 4

-- Default number of spaces to use for each step of (auto)indent
vim.opt_local.shiftwidth = 4

vim.keymap.set('n', '<space>di', require('jdtls.dap').setup_dap_main_class_configs, { buffer = 0, desc = 'Debug: Initialize' })
vim.keymap.set('n', '<space>dc', require('jdtls').test_class, { buffer = 0, desc = 'Debug: Class' })
vim.keymap.set('n', '<space>dt', require('jdtls').test_nearest_method, { buffer = 0, desc = 'Debug: Method' })
