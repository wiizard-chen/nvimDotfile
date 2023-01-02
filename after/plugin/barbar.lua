local hl = require('bufferline.utils').hl

-- -- local fg_current = hl.fg_or_default({ 'Normal' }, '#efefef', 255)
local fg_current = hl.fg_or_default({ 'Normal' }, '#ff00ff', 255)
local bg_current = hl.bg_or_default({ 'Normal' }, 'none')

hl.set('BufferDefaultCurrent', bg_current, fg_current)

require('bufferline').setup({
  animation = false,
  -- Enables / disables diagnostic symbols
  -- diagnostics = {
  --   -- you can use a list
  --   { enabled = true, icon = 'ﬀ' }, -- ERROR
  --   { enabled = false }, -- WARN
  --   { enabled = false }, -- INFO
  --   { enabled = true }, -- HINT

  --   -- OR `vim.diagnostic.severity`
  --   [vim.diagnostic.severity.ERROR] = { enabled = true,},
  --   [vim.diagnostic.severity.WARN] = { enabled = false },
  --   [vim.diagnostic.severity.INFO] = { enabled = false },
  --   [vim.diagnostic.severity.HINT] = { enabled = true },
  -- },

  -- diagnostics = false,

  icon_custom_colors = false,
  -- Configure icons on the bufferline.
  icon_separator_active = '▎',
  icon_separator_inactive = '▎',
  icon_close_tab = '',
  icon_close_tab_modified = '●',
  icon_pinned = '車',
})
