return {
  {
    -- REPL
    'metakirby5/codi.vim',
    cmd = { 'Codi', 'CodiNew', 'CodiSelect' },
    lazy = true,
    init = function()
      -- vim.cmd([[let g:codi#virtual_text_pos = "right_align"]])
    end,
  },
}
