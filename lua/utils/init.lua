local M = {}

local opt = {
  noremap = true,
  silent = true,
}

local vimcmd = vim.cmd

local clock = os.clock

function M.sleep(n) -- seconds
  local t0 = clock()
  while clock() - t0 <= n do end
end

function M.map(m, k, v, optional)
  -- 可选参数
  local _opt = optional or opt
  vim.keymap.set(m, k, v, _opt)
end

function M.get_capabilities()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true
  }
  local res = require("cmp_nvim_lsp").default_capabilities(capabilities)
  return res
end

function M.smart_quit()
  -- save all file
  vimcmd('wa!')
  -- M.sleep(1)
  vimcmd('qa!')
end

function M.changed_on_branch()
  local previewers = require('telescope.previewers')
  local pickers = require('telescope.pickers')
  local sorters = require('telescope.sorters')
  local finders = require('telescope.finders')
  local shellPath = vim.fn.stdpath "config" .. "/shell/telescope.sh"

  pickers.new {
    results_title = 'Modified on current branch',
    -- finder = finders.new_oneshot_job({ shellPath, 'list' }),
    finder = finders.new_oneshot_job({ 'git status --porcelain' }),
    sorter = sorters.get_fuzzy_file(),
    -- previewer = previewers.new_termopen_previewer {
    --   get_command = function(entry)
    --     return { shellPath, 'diff', entry.value }
    --   end
    -- },
  }:find()

  -- picker.find()
  -- gcc:find()
end

function M.get_reg(char)
  return vim.fn.getreg(char)
  -- return vim.api.nvim_exec([[echo getreg(']]..char..[[')]], true):gsub("[\n\r]", "^J")
end

return M
