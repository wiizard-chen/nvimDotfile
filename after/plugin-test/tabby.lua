
local status, tabby = pcall(require, "tabby.tabline")
if not status then
    -- 不显示了
    -- vim.notify("没有找到 project_nvim")
  return
end


local theme = {
  fill = 'TabLineFill',
  -- Also you can do this: fill = { fg='#f2e9de', bg='#907aa9', style='italic' }
  head = 'TabLine',
  current_tab = 'TabLineSel',
  tab = 'TabLine',
  win = 'TabLine',
  tail = 'TabLine',
}


tabby.set(function(line)
  return {
    {
      { '  ', hl = theme.head },
      line.sep('', theme.head, theme.fill),
    },
    line.tabs().foreach(function(tab)
      local hl = tab.is_current() and theme.current_tab or theme.tab
      return {
        line.sep('', hl, theme.fill),
        tab.is_current() and '' or '',
        tab.number(),
        tab.name(),
        tab.close_btn(''),
        line.sep('', hl, theme.fill),
        hl = hl,
        margin = ' ',
      }
    end),
    line.spacer(),
    line.wins_in_tab(line.api.get_current_tab()).foreach(function(win)
      return {
        line.sep('', theme.win, theme.fill),
        win.is_current() and '' or '',
        win.buf_name(),
        line.sep('', theme.win, theme.fill),
        hl = theme.win,
        margin = ' ',
      }
    end),
    {
      line.sep('', theme.tail, theme.fill),
      { '  ', hl = theme.tail },
    },
    hl = theme.fill,
  }
end)

-- local utils = require('utils')
-- utils.map("n", "<leader>ta", ":$tabnew<CR>", { noremap = true })
-- utils.map("n", "<leader>tc", ":tabclose<CR>", { noremap = true })
-- utils.map("n", "<leader>to", ":tabonly<CR>", { noremap = true })
-- utils.map("n", "<leader>tn", ":tabn<CR>", { noremap = true })
-- utils.map("n", "<leader>tp", ":tabp<CR>", { noremap = true })
-- -- move current tab to previous position
-- utils.map("n", "<leader>tmp", ":-tabmove<CR>", { noremap = true })
-- -- move current tab to next position
-- utils.map("n", "<leader>tmn", ":+tabmove<CR>", { noremap = true })

