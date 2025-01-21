-- Pin `jdtls` to `v1.40.0` as `v1.41.0` has deadlock problem (see https://github.com/eclipse-jdtls/eclipse.jdt.ls/issues/3336).
--
-- Mason installation via `package@v<version>` is broken for `jdtls` (see https://github.com/williamboman/mason.nvim/issues/1508).
--
-- Hack to get it to install a specific version:
-- 1. Ensure all neovim sessions with running `jdtls` are closed.
-- 2. Ensure no `jdtls` processes are running via `ps -ef | grep jdtls`.
-- 3. Ensure `jdtls` is not already installed via mason.
-- 4. Ensure `~/.jdtls` is cleaned up to remove past `jdtls` artificats.
-- 5. Go to `~/.local/share/nvim/mason/registries/github/mason-org/mason-registry/registry.json`. Look for `jdtls` and update it like:
--   5.1. Change `<version>` in `v<version>`.
--   5.2. Change timestamp in URLs to match what is here: https://download.eclipse.org/jdtls/milestones/<version>/latest.txt.
-- 6. Reopen neovim to automatically install `jdtls@v<version>`.
-- 7. Ensure this is what mason reports.
-- Note: Mason will override the changes to `~/.local/share/nvim/mason/registries/github/mason-org/mason-registry/registry.json` when
-- it checks for updates. So, take care to update packages individually going forward.
--
-- Note: https://github.com/nvim-java/mason-registry seems like a better solution to install older versions of `jdtls`.
-- As it was created recently to solve this problem, it does not have versions older than `v1.43.0`. Once the deadlock problem is
-- fixed in future versions, can switch to that.

return {
  'bashls',
  'clangd',
  'esbonio',
  'gopls',
  'jdtls',
  'jsonls',
  'lemminx',
  'lua_ls',
  'marksman',
  'pyright',
  'rust_analyzer',
  'ts_ls',
  'vimls',
  'yamlls',
}
