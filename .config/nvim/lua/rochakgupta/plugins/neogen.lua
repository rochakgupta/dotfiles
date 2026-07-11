return {
  'danymat/neogen',
  -- Only stable versions
  version = '*',
  opts = {
    snippet_engine = 'snippy',
  },
  keys = {
    {
      '<leader>dd',
      function()
        require('neogen').generate()
      end,
      desc = 'Neogen: Generate doc',
      mode = { 'n' },
    },
  },
}
