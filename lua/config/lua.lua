-- -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#sumneko_lua
local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

local default_workspace = {
  library = {
    vim.fn.expand "$VIMRUNTIME",
    require("neodev.config").types(),
    "${3rd}/busted/library",
    "${3rd}/luassert/library",
  },

  maxPreload = 5000,
  preloadFileSize = 10000,
}
local opts = {
  settings = {
      Lua = {
        telemetry = { enable = false },
        runtime = {
          version = "LuaJIT",
          special = {
            reload = "require",
          },
        },
        diagnostics = {
          globals = { "vim", "lvim", "packer_plugins", "reload" },
        },
        workspace = default_workspace,
      },
    }
}



-- -- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- -- capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
-- -- opts.capabilities = capabilities

-- -- 查看目录等信息
-- -- print(vim.inspect(server))

return {
  on_setup = function(server)
    opts = require("neodev").setup(opts)
    server.setup(opts)
  end,
}
--

