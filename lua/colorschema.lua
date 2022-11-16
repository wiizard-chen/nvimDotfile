vim.o.background = "dark"
-- local colorscheme = "solarized-high"
-- local colorscheme = "Nightfox"
local colorscheme = "Nordfox"
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
print ('hello', colorscheme)
if not status_ok then
  vim.notify("colorscheme: " .. colorscheme .. " 没有找到！")
  return
end


