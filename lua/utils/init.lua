local M = {}

local opt = {
  noremap = true,
  silent = true,
}

local vimcmd = vim.cmd

local clock = os.clock

function M.sleep(n) -- seconds
  local t0 = clock()
  while clock() - t0 <= n do end
end

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

function M.smart_quit()
  -- local bufnr = vim.api.nvim_get_current_buf()

  -- local modified = vim.api.nvim_buf_get_option(bufnr, "modified")

  -- if modified then
  --   vim.ui.input({
  --     prompt = "You have unsaved changes. Quit anyway? (y/n) ",
  --   }, function(input)
  --     if input == "y" then
  --       vimcmd("q!")
  --     end
  --   end)
  -- else
  --   vimcmd("q!")
  -- end

  -- save all file
  vimcmd('wa!')

  M.sleep(1)

  vimcmd('qa!')
end

return M
