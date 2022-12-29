local status_ok, Terminal = pcall(require, "toggleterm")

if not status_ok then
  return
end

local M = {}
local vimcmd = vim.cmd

M.lazygit_toggle = function()
  local lazygit = Terminal:new {
    cmd = "lazygit",
    hidden = true,
    direction = "float",
    float_opts = {
      border = "none",
      width = 100000,
      height = 100000,
    },
    on_open = function(_)
      vimcmd("startinsert!")
    end,
    on_close = function(_) end,
    count = 99,
  }
  lazygit:toggle()
end

return M
