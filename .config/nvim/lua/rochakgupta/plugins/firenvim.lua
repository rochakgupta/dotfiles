return {
  {
    -- Use neovim as editor in browsers
    -- Extra setup:
    --   1. Set cond = true
    --   2. Run 'nvim --headless "+call firenvim#install(0) | q"' from terminal
    --   3. Reset cond
    'glacambre/firenvim',
    -- Lazy load firenvim
    -- Explanation: https://github.com/folke/lazy.nvim/discussions/463#discussioncomment-4819297
    cond = not not vim.g.started_by_firenvim,
    init = function()
      local filename = function(ext)
        return '/tmp/{hostname}_{pathname%10}' .. '.' .. ext
      end

      vim.g.firenvim_config = {
        localSettings = {
          ['.*'] = {
            priority = 0,
            filename = filename('{extension}'),
            takeover = 'never',
            cmdline = 'neovim',
          },
          ['leetcode*'] = {
            priority = 1,
            filename = filename('java'),
          },
          ['slack*'] = {
            priority = 1,
            filename = filename('md'),
          },
        },
      }
    end,
    build = function()
      require('lazy').load({
        { plugins = 'firenvim' },
        { wait = true },
      })
      vim.fn['firenvim#install'](0)
    end,
    config = function()
      vim.api.nvim_create_autocmd('UIEnter', {
        callback = function(_)
          local client = vim.api.nvim_get_chan_info(vim.v.event.chan).client
          if client ~= nil and client.name == 'Firenvim' then
            -- Disable lualine
            require('lualine').hide()
            -- Disable tabline
            vim.o.showtabline = 0
            -- Disable indent-blankline
            if require('rochakgupta.settings').indent_blankline then
              require('ibl').update({ enabled = false })
            end
            -- Disable nvim-cmp
            -- require('cmp').setup({ enabled = false })
            -- Firefox only: Manually set the font size as default is too big
            vim.o.guifont = 'JetbrainsMono_Nerd_Font_Mono:h18'
          end
        end,
      })
    end,
  },
}
