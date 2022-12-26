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
  ------------------------------------------
  ['<leader>'] = {
    name = 'leader other',
    qq = { ":wqa!<CR>", "save all file and quit" },
    b = {
      ":NvimTreeToggle<CR>",
      "open nvim tree"
    },
    w = {
      "<cmd>lua require('bufdelete').bufdelete(0, true)<CR>",
      "close buffer"
    },
    r = {
      ":edit<CR>",
      "refresh buffer",
    },
    n = {
      ":enew<CR>",
      "new buffer",
    },
    f = {
      s = {
        ":wa!<CR>",
        "save all buffer"
      },
      f = {
        vim.lsp.buf.format,
        "format"
      }
    },
    v = {
      ['ws'] = {
        vim.lsp.buf.workspace_symbol,
        'work space symbol warning'
      },
      ['d'] = {
        vim.diagnostic.open_float,
        'diagnostic open float'
      },
      ['r'] = {
        vim.lsp.buf.references,
        'all references',
      },
      ['h'] = {
        vim.lsp.buf.signature_help,
        'sign help'
      }
    },
    t = {
      l = {
        '<cmd>TroubleToggle loclist<cr>',
        'show diagnostic list'
      },
      w = {
        '<cmd>TroubleToggle workspace_diagnostics<cr>',
        'show all workspace diagnostic',
      },

    }
  },
  ----------------------- lsp -------------------
  g = {
    name = 'lsp',
    d = {
      vim.lsp.buf.definition,
      'go to definition',
    },
    k = {
      vim.lsp.buf.hover,
      'show type hover',
    },
    n = {
      vim.lsp.buf.rename, 'rename var',
    },
    ['.'] = {
      '<Cmd>Lspsaga code_action<CR>',
      'code action'
    },
    p = {
      '<Cmd>Lspsaga lsp_finder<CR>',
      'all code info'
    },
    h = {
      '<Cmd>Lspsaga hover_doc<CR>',
      'lspsaga hover_doc',
    },
    l = {
      '<Cmd>Lspsaga outline<CR>',
      'open outline (amazing feature)'
    },
    i = {
      ':TSLspOrganize',
      'install file',
    },

  -- mapbuf("n", "gR", ":TSLspRenameFile<CR>", opt)
  -- mapbuf("n", "gi", ":TSLspImportAll<CR>", opt)
  -- mapbuf("n", "go", ":TSLspOrganize<CR>", opt)
  },
  ------------------------------------------
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
