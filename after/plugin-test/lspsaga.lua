local status, saga = pcall(require, "lspsaga")
if (not status) then return end

saga.init_lsp_saga {
  server_filetype_map = {
    typescript = 'typescript'
  }
}

local opts = { noremap = true, silent = true }

vim.keymap.set('n', '<C-j>', '<Cmd>Lspsaga diagnostic_jump_next<CR>', opts)
vim.keymap.set('n', '<C-k>', '<Cmd>Lspsaga diagnostic_jump_prev<CR>', opts)
vim.keymap.set('n', 'g.', '<cmd>Lspsaga code_action<CR>', opts)
vim.keymap.set('n', 'gp', '<Cmd>Lspsaga lsp_finder<CR>', opts)
-- vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
vim.keymap.set('n', 'gd', "<cmd>lua require'telescope.builtin'.lsp_definitions({ initial_mode = 'normal', theme='dropdown' })<CR>", opts)
-- vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
vim.keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', opts)
-- vim.keymap.set('n', 'gp', '<Cmd>Lspsaga peek_definition<CR>', opts)
vim.keymap.set('n', 'gr', '<Cmd>Lspsaga rename<CR>', opts)
-- vim.keymap.set({"n","v"}, "<C-.>", "<Cmd>Lspsaga code_action<CR>", opts)

