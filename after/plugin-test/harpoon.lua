
local status, harpoon = pcall(require, "harpoon")

if not status then
  vim.notify("没有找到 harpoon")
  return
end

local function map(m, k, v, optional)
  -- 可选参数
  local _opt = optional or opt
  vim.keymap.set(m, k, v, _opt)
end

local opt = {
  noremap = true,
  silent = true,
}

harpoon.setup({
  menu={
    width = 100
  }
  -- width = vim.api.nvim_win_get_width(0),
})
-- map('n', "gh", '<Cmd>Telescope harpoon marks<CR>', opt)
-- map('n', ";h", function() 
--   require("harpoon.ui").toggle_quick_menu() 
-- end, opt)

map('n', "gh", function() require("harpoon.ui").toggle_quick_menu() end, opt)
map('n', ";a", function() require("harpoon.mark").add_file() end, opt)


