local opt = {
  noremap = true,
  silent = true,
}

local function map(m, k, v, optional)
  -- 可选参数
  local _opt = optional or opt
  vim.keymap.set(m, k, v, _opt)
end


-- make insert mode like emacs
-- if you don't like emacs comment all key bind
-- solve the confict with karabiner
-- c-a go to head
-- c-e go to tail
map("i", "<C-A>", "<Esc>I")
map("i", "<C-E>", "<Esc>A")
map("n", "<C-A>", "0")
map("n", "<C-E>", "$")

-- c-d elete char
-- c-h delete char backward
map("i", "<C-d>", "<Del>")
map("i", "<C-h>", '<BS>')
-- map("n", "<C-d>", '"_x')
-- map("n", "<C-h>", '"_X')

-- c-k delete all backword
-- c-u delete all forword
-- map("i", "<C-u>", '<space><Esc>"_d0xi')
map("i", "<C-k>", '<space><Esc>"_d$a')

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
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map("n", "s", "")

-- from the primeagen
map("n", "Q", "<nop>")

map('n', '<leader>1', '<cmd>lua require("bufferline").go_to_buffer(1, true)<cr>', opt);
map('n', '<leader>2', '<cmd>lua require("bufferline").go_to_buffer(2, true)<cr>', opt);
map('n', '<leader>3', '<cmd>lua require("bufferline").go_to_buffer(3, true)<cr>', opt);
map('n', '<leader>4', '<cmd>lua require("bufferline").go_to_buffer(4, true)<cr>', opt);
map('n', '<leader>5', '<cmd>lua require("bufferline").go_to_buffer(5, true)<cr>', opt);
map('n', '<leader>6', '<cmd>lua require("bufferline").go_to_buffer(6, true)<cr>', opt);
map('n', '<leader>7', '<cmd>lua require("bufferline").go_to_buffer(7, true)<cr>', opt);
map('n', '<leader>8', '<cmd>lua require("bufferline").go_to_buffer(8, true)<cr>', opt);
map('n', '<leader>9', '<cmd>lua require("bufferline").go_to_buffer(9, true)<cr>', opt);


-- vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
-- vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
-- vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
-- vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
-- vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
-- vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
-- vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
-- vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
-- vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
-- vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)

map('n', '<C-j>', '<Cmd>Lspsaga diagnostic_jump_next<CR>', opt)
map('n', '<C-k>', '<Cmd>Lspsaga diagnostic_jump_prev<CR>', opt)


