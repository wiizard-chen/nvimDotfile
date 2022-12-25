local opt = {
  noremap = true,
  silent = true,
}

local function map(m, k, v, optional)
  -- 可选参数
  local _opt = optional or opt
  vim.keymap.set(m, k, v, _opt)
end

-- make change just change not yank
-- make delete just delete and yank
-- x and X just delete
map('n', 'x', '"_x')
map('n', 'X', '"_X')
map('n', 'c', '"_c')

-- 在visual mode 里粘贴不要复制
map("v", "p", '"_dP', opt)

-- $跳到行尾不带空格 (交换$ 和 g_)
map("v", "$", "g_", opt)
map("v", "g_", "$", opt)
map("n", "$", "g_", opt)

-- scroll screen
-- visual模式下缩进代码
map("v", "<", "<gv")
map("v", ">", ">gv")
map("n", "<", "<<")
map("n", ">", ">>")
-- 上下移动选中文本
map("v", "J", ":move '>+1<CR>gv-gv")
map("v", "K", ":move '<-2<CR>gv-gv")


map("n", "J", "mzJ`z")
-- map("n", "<C-d>", "<C-d>zz")
-- map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map("n", "s", "")

-- from the primeagen
map("n", "Q", "<nop>")

-- print('keybings base done')
