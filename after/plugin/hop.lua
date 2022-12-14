-- local status, hop = pcall(require, "hop")

-- if not status then
--   vim.notify("没有找到 hop")
--   return
-- end

-- hop.setup()

-- local function map(m, k, v, optional)
--   -- 可选参数
--   local _opt = optional or opt
--   vim.keymap.set(m, k, v, _opt)
-- end

-- local opt = {
--   noremap = true,
--   silent = true,
-- }

-- local jirections = require('hop.hint').HintDirection

-- map('', 'f', function()
--   hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
-- end, {remap=true})
-- map('', 'F', function()
--   hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
-- end, {remap=true})
-- map('', 't', function()
--   hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
-- end, {remap=true})
-- map('', 'T', function()
--   hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
-- end, {remap=true})

