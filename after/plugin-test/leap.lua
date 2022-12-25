local status, leap = pcall(require, "leap")

if not status then
  vim.notify("没有找到 hop")
  return
end

local util = require('utils')

-- leap.add_default_mappings() 

-- util.map({'n', 'x', 'o'}, ';S', '<Plug>(leap-backward-to)')
-- util.map({'n', 'x', 'o'}, ';s', '<Plug>(leap-forward-to)')
util.map({'n', 'x', 'o'}, '<leader>s', '<Plug>(leap-forward-to)')
util.map({'n', 'x', 'o'}, '<leader>S', '<Plug>(leap-backward-to)')
