-- Default number of spaces a tab counts for
vim.opt_local.tabstop = 4

-- Default number of spaces to use for each step of (auto)indent
vim.opt_local.shiftwidth = 4

vim.keymap.set('n', '<leader>di', require('jdtls.dap').setup_dap_main_class_configs, { buffer = 0, desc = 'DAP + Java: Initialize class configs' })
vim.keymap.set('n', '<leader>dc', require('jdtls').test_class, { buffer = 0, desc = 'DAP + Java: Debug class' })
vim.keymap.set('n', '<leader>dt', require('jdtls').test_nearest_method, { buffer = 0, desc = 'DAP + Java: Debug nearest method' })
