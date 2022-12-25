-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

require('keybindings.base');

local builtin = require("telescope.builtin")

local status, wk = pcall(require, "which-key")
if (not status) then
  return print('no install whichKey')
end

wk.register({
  s = {
    name = 'screen',
    s = { ':split<Return>', 'split screen' },
    v = { ':vsplit<Return>', 'vertical split screen' },
    h = { '<C-w>h', 'move h' },
    j = { '<C-w>j', 'move j' },
    k = { '<C-w>k', 'move k' },
    l = { '<C-w>l', 'move l' },
    ['='] = { '<C-w>=', 'resize equal' },
    c = { '<C-w>c', 'close cur screen' },
    o = { '<C-w>o', 'close other screen' },
  },
  ['<leader>'] = {
    name = 'leader other',
    qq = { ":wqa!<CR>", "save all file and quit" }
  },
  [";"] = {
    name = 'telescope',
    f = {
      function()
        builtin.git_files({
          no_ignore = false,
          hidden = true
        })
      end,
      'find file'
    },
    r = {
      function()
        builtin.grep_string({
          use_regex = false,
          grep_open_files = false,
          search = vim.fn.input("Grep > ")
        })
      end,
      'search all file'
    },
    h = {
      function()
        require("harpoon.ui").toggle_quick_menu();
      end,
      'harpoon ui'
    },
    a = {
      function()
        require("harpoon.mark").add_file();
      end,
      'harpoon add mark'
    },
    [';'] = {
      ';',
      'switch next word'
    }
  }
})
