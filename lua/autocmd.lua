local myAutoGroup = vim.api.nvim_create_augroup("myAutoGroup", {
  clear = true,
})

local autocmd = vim.api.nvim_create_autocmd
local vimcmd = vim.cmd

-- Highlight on yank
autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = myAutoGroup,
  pattern = "*",
})

-- 用o换行不要延续注释
autocmd("BufEnter", {
  group = myAutoGroup,
  pattern = "*",
  callback = function()
    vim.opt.formatoptions = vim.opt.formatoptions
        - "o" -- O and o, don't continue comments
        + "r" -- But do continue when pressing enter.
  end,
})
vimcmd("packadd packer.nvim")

-- Undercurl
vimcmd([[let &t_Cs = "\e[4:3m"]])
vimcmd([[let &t_Ce = "\e[4:0m"]])

-- Autocommand that reloads neovim whenever you save the plugins.lua file

vimcmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

vimcmd ("set whichwrap+=<,>,[,],h,l")
vimcmd ([[set iskeyword+=-]])
vimcmd ([[set formatoptions-=cro]]) -- TODO: this doesn't seem to work



-- terminal
-- function _G.set_terminal_keymaps()
--   local opts = { buffer = 0 }
--   -- vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
--   -- vim.keymap.set('t', '<C-w>', [[<C-\><C-n>0<cmd>lua _LAZYGIT_TOGGLE()<CR>]], opts)
--   vim.keymap.set('t', '<C-w>', [[<C-\><C-n>0]], opts)
--   vim.keymap.set('t', '<C-q>', [[<C-\><C-n>]], opts)
--   -- vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
--   -- vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
--   -- vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
--   -- vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
--   -- vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
-- end
-- if you only want these mappings for toggle term use term://*toggleterm#* instead
-- vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

