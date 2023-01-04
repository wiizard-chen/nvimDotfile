local status, ufo = pcall(require, "ufo")

if (not status) then
  -- test
  print('ufo not installed')
  return
end

-- fold
-- vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
-- 开启 Folding 模块
vim.o.foldcolumn = '1' -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true


local function hateRepeatFold(char)
  local function setScrollOff(val)
    local view = vim.fn.winsaveview()
    vim.wo.so = val
    vim.fn.winrestview(view)
  end

  local event = require('ufo.lib.event')
  event:emit('setOpenFoldHl')
  vim.keymap.set('n', 'h', function()
    local shouldClose = vim.fn.foldlevel('.') ~= 0
    if shouldClose then
      event:emit('setOpenFoldHl', false)
      setScrollOff(10)
    end
    return shouldClose and 'zc' or 'h'
  end, { buffer = 0, expr = true })
  vim.keymap.set('n', 'l', function()
    local shouldOpen = vim.fn.foldclosed('.') ~= -1
    if shouldOpen then
      event:emit('setOpenFoldHl', false)
      setScrollOff(10)
    end
    return shouldOpen and 'zo' or 'l'
  end, { buffer = 0, expr = true })
  vim.api.nvim_create_autocmd('CursorMoved', {
    group = vim.api.nvim_create_augroup('HateRepeatFoldAug', {}),
    buffer = 0,
    once = true,
    callback = function()
      pcall(vim.keymap.del, 'n', 'h', { buffer = 0 })
      pcall(vim.keymap.del, 'n', 'l', { buffer = 0 })
      setScrollOff(0)
      event:emit('setOpenFoldHl')
    end
  })
  return 'mzz' .. char
end

for _, c in ipairs({ 'c', 'o', 'a', 'C', 'O', 'A', 'v' }) do
  vim.keymap.set('n', 'z' .. c, function() return hateRepeatFold(c) end, { expr = true })
end

ufo.setup({
  provider_selector = function(bufnr, filetype, buftype)
    return { 'treesitter', 'indent' }
  end
})
