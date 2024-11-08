local jdtls = require('jdtls')
local jdtls_setup = require('jdtls.setup')
local mason_registry = require('mason-registry')
local utils = require('rochakgupta.utils')

local M = {}

function M.setup(args)
  local success, err = pcall(function()
    vim.validate({
      on_attach = { args.on_attach, 'function' },
      capabilities = { args.capabilities, 'table' },
    })
  end)

  if not success then
    utils.notify_warn(err)
    return
  end

  if not mason_registry.is_installed('jdtls') then
    utils.notify_warn('Install jdtls via mason')
    return
  end

  local jdtls_install = mason_registry.get_package('jdtls'):get_install_path()
  local lombok = jdtls_install .. '/lombok.jar'

  local root_dir = jdtls_setup.find_root({ '.git' }) or vim.fn.getcwd()
  utils.notify_debug('root: ' .. root_dir)

  local data = vim.fn.expand('~/.jdtls' .. root_dir)
  utils.notify_debug('data: ' .. data)

  local extended_client_capabilities = jdtls.extendedClientCapabilities
  extended_client_capabilities.resolveAdditionalTextEditsSupport = true

  -- https://github.com/mfussenegger/nvim-jdtls?tab=readme-ov-file#debugger-via-nvim-dap
  local bundles = {
    vim.fn.glob('~/Documents/GitHub/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar', true),
  }
  vim.list_extend(bundles, vim.split(vim.fn.glob('~/Documents/GitHub/vscode-java-test/server/*.jar', true), '\n'))

  local config = {
    cmd = {
      'jdtls',
      '--jvm-arg=' .. '-javaagent:' .. lombok,
      '-data',
      data,
    },
    root_dir = root_dir,
    on_attach = args.on_attach,
    capabilities = args.capabilities,
    init_options = {
      extendedClientCapabilities = extended_client_capabilities,
      bundles = bundles,
    },
    settings = {
      java = {
        eclipse = {
          downloadSources = true,
        },
        configuration = {
          updateBuildConfiguration = 'interactive',
          runtimes = {
            {
              name = 'JavaSE-17',
              path = '/Library/Java/JavaVirtualMachines/openjdk-17.jdk/Contents/Home',
              default = true,
            },
          },
        },
        signatureHelp = {
          enabled = true,
        },
        contentProvider = {
          preferred = 'fernflower',
        },
        maven = {
          downloadSources = true,
        },
        implementationsCodeLens = {
          enabled = true,
        },
        referencesCodeLens = {
          enabled = true,
        },
        references = {
          includeDecompiledSources = true,
        },
        format = {
          settings = {
            url = vim.fn.expand('~/.config/java/eclipse-java-google-style.xml'),
            profile = 'GoogleStyle',
          },
          comments = {
            enabled = false,
          },
        },
        completion = {
          importOrder = {
            'static',
            'java',
            'javax',
            'com',
            'lombok',
            'org',
          },
          favoriteStaticMembers = {
            'org.hamcrest.CoreMatchers.*',
            'org.hamcrest.MatcherAssert.*',
            'org.hamcrest.Matchers.*',
            'org.junit.Assert.*',
            'org.junit.Assume.*',
            'org.junit.jupiter.api.Assertions.*',
            'org.junit.jupiter.api.Assumptions.*',
            'org.junit.jupiter.api.DynamicContainer.*',
            'org.junit.jupiter.api.DynamicTest.*',
            'org.mockito.Matchers.*',
            'org.mockito.Mockito.*',
          },
        },
      },
    },
  }

  jdtls.start_or_attach(config)
end

return M
