return {
  'tpope/vim-fugitive',
  init = function()
    if not vim.g.rg_gitlinker then
      local set_keymaps = function(key, copy, desc)
        local cmd = copy and 'GBrowse!' or 'GBrowse'
        vim.keymap.set('n', key, '<cmd>' .. cmd .. '<CR>', { desc = desc, noremap = false })
        -- Using ':' instead of `<cmd>' because we need to run the command on the selected range in visual mode
        vim.keymap.set('v', key, ':' .. cmd .. '<CR>', { desc = desc, noremap = false })
      end

      set_keymaps('gy', true, 'Fugitive: Copy remote url of file to clipboard')
      set_keymaps('gY', false, 'Fugitive: Open remote url of file in browser')
    end
  end,
}
