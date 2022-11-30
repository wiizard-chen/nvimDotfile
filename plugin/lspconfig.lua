local lspconfig = require("lspconfig")

-- 安装列表
-- { key: 服务器名， value: 配置文件 }
-- key 必须为下列网址列出的 server name，不可以随便写
-- https://github.com/williamboman/nvim-lsp-installer#available-lsps
local servers = {
  -- sumneko_lua = require("config.lua"), -- lua/lsp/config/lua.lua
  bashls = require("config.bash"),
  pyright = require("config.pyright"),
  html = require("config.html"),
  cssls = require("config.css"),
  emmet_ls = require("config.emmet"),
  jsonls = require("config.json"),
  tsserver = require("config.ts"),
  -- rust_analyzer = require("config.rust"),
  yamlls = require("config.yamlls"),
  -- remark_ls = require("config.markdown"),
}

for name, config in pairs(servers) do
  if config ~= nil and type(config) == "table" then
    -- 自定义初始化配置文件必须实现on_setup 方法
    config.on_setup(lspconfig[name])
  else
    -- 使用默认参数
    lspconfig[name].setup({})
  end
end
