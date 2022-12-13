local M = {}

local opt = {
  noremap = true,
  silent = true,
}

function M.map(m, k, v, optional)
  -- 可选参数
  local _opt = optional or opt
  vim.keymap.set(m, k, v, _opt)
end

function M.get_capabilities()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.foldingRange = {
      dynamicRegistration = false,
      lineFoldingOnly = true
  }
  local res = require("cmp_nvim_lsp").default_capabilities(capabilities)
  return res
end


return M
