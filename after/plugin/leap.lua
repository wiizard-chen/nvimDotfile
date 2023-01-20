local status, leap = pcall(require, "leap")

if not status then
  vim.notify("没有找到 hop")
  return
end

local util = require('utils')

leap.setup({
  safe_labels = {
    "s", "f", "n",
    "j", "k", "l", "h", "o", "d", "w", "e", "m", "b",
    "u", "y", "v", "r", "g", "t", "c", "x", "/", "z",
    "S", "F", "N",
    "J", "K", "L", "H", "O", "D", "W", "E", "M", "B",
    "U", "Y", "V", "R", "G", "T", "C", "X", "?", "Z"
  }
})

-- leap.add_default_mappings()

-- util.map({'n', 'x', 'o'}, ';S', '<Plug>(leap-backward-to)')
-- util.map({'n', 'x', 'o'}, ';s', '<Plug>(leap-forward-to)')
util.map({ 'n', 'x', 'o' }, ',f', '<Plug>(leap-forward-to)')
util.map({ 'n', 'x', 'o' }, ',b', '<Plug>(leap-backward-to)')
