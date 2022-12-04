
local status, session = pcall(require, "auto-session")
if not status then
    -- 不显示了
    vim.notify("没有找到 auto-session")
  return
end

session.setup({
  log_level = "error"
})

local status_telescope, telescope = pcall(require, "telescope")
if not status_telescope then
  vim.notify("没有找到 telescope")
  return
end
pcall(telescope.load_extension, "session-lens")

