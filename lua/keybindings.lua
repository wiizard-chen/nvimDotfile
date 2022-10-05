-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- leader key 为空, 很重要的
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = {
  noremap = true,
  silent = true,
}

local function map (m, k, v, optional) 
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
map("n", "g_", "$", opt)

-- make insert mode like emacs
-- if you don't like emacs comment all key bind
-- solve the confict with karabiner
-- c-a go to head
-- c-e go to tail
map("n", "<C-a>", "0")
map("n", "<C-e>", "$")
map("i", "<C-a>", "<Esc>I")
map("i", "<C-e>", "<Esc>A")

-- c-d elete char
-- c-h delete char backward
map("i", "<C-d>", "<Del>")
map("i", "<C-h>", '<BS>')
-- map("n", "<C-d>", '"_x')
-- map("n", "<C-h>", '"_X')

-- c-k delete all backword
-- c-u delete all forword
map("i", "<C-u>", '<space><Esc>"_d0xi')
map("i", "<C-k>", '<Esc>l"_d$a')


-- go back and reback
-- c-o, go back
-- c-i, reback
map("i", "<C-o>", "<Esc><C-o>i")
map("i", "<C-i>", "<Esc><C-i>i")


-- create a new tab
map('n', 'te', ':tabedit<CR>')

-- close all window
map("n", "qq", ":wqa!<CR>")
map("n", "<leader>fs", ":wa!<CR>")
map("n", "<leader>q", ":wqa!<CR>")
-- switch background thread
map("n", "<leader>z", ":sus<CR>")


-- scroll screen
-- visual模式下缩进代码
map("v", "<", "<gv")
map("v", ">", ">gv")
-- 上下移动选中文本
map("v", "J", ":move '>+1<CR>gv-gv")
map("v", "K", ":move '<-2<CR>gv-gv")


-- Split window
map("n", "s", "")
map('n', 'ss', ':split<Return><C-w>w')
map('n', 'sv', ':vsplit<Return><C-w>w')
-- Close current window
map("n", "sc", "<C-w>c")
-- Close other window
map("n", "so", "<C-w>o") 
-- Move window
map('n', '<Space>', '<C-w>w')
map('', 'sh', '<C-w>h')
map('', 'sk', '<C-w>k')
map('', 'sj', '<C-w>j')
map('', 'sl', '<C-w>l')
-- Resize window
map("n", "<C-Left>", ":vertical resize -2<CR>")
map("n", "<C-Right>", ":vertical resize +2<CR>")
map("n", "<C-Down>", ":resize +2<CR>")
map("n", "<C-Up>", ":resize -2<CR>")
-- 相等比例
map("n", "s=", "<C-w>=")
