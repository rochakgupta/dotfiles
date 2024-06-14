return {
  'seanbreckenridge/yadm-git.vim',
  dependencies = {
    'tpope/vim-fugitive',
  },
  config = function()
    -- Git gutter via gitsigns only works locally (darwin) for some reason
    vim.g.yadm_git_enabled = 1
    vim.g.yadm_git_verbose = 0
    vim.g.yadm_git_fugitive_enabled = 1
    vim.g.yadm_git_gitgutter_enabled = 0
    vim.g.yadm_git_repo_path = '~/.local/share/yadm/repo.git'
    vim.g.yadm_git_default_git_path = 'git'
  end,
}
