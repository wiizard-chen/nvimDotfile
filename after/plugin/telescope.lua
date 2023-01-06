local status, telescope = pcall(require, "telescope")
if (not status) then
  return print('no install telescope')
end

local actions = require('telescope.actions')

local builtin = require("telescope.builtin")

local function get_pickers(actions)
  return {
    find_files = {
      -- theme = "dropdown",
      hidden = true,
      previewer = false,
    },
    live_grep = {
      --@usage don't include the filename in the search results
      only_sort_text = true,
      -- theme = "dropdown",
    },
    grep_string = {
      only_sort_text = true,
      -- theme = "dropdown",
    },
    buffers = {
      -- theme = "dropdown",
      previewer = true,
      initial_mode = "normal",
      mappings = {
        i = {
          ["<C-d>"] = actions.delete_buffer,
        },
        n = {
          ["dd"] = actions.delete_buffer,
        },
      },
    },
    planets = {
      show_pluto = true,
      show_moon = true,
    },
    git_files = {
      theme = "dropdown",
      hidden = true,
      previewer = false,
      show_untracked = true,
    },
    lsp_references = {
      theme = "dropdown",
      initial_mode = "normal",
    },
    lsp_definitions = {
      theme = "dropdown",
      initial_mode = "normal",
      -- file_ignore_patterns = {
      --   ".git/", "^node_modules/"
      -- }
    },
    lsp_declarations = {
      theme = "dropdown",
      initial_mode = "normal",
    },
    lsp_implementations = {
      theme = "dropdown",
      initial_mode = "normal",
    },
    marks = {
      theme = "dropdown",
      initial_mode = "normal",
    },
  }
end

telescope.setup {
  defaults = {
    mappings = {
      n = {
        ["q"] = actions.close,
        ["<C-w>"] = actions.close
      },
      i = {
        ["<C-w>"] = actions.close
      }
    },
    file_ignore_patterns = {
      ".git/", 
      "^node_modules/",
      -- "node_modules/.*"
    }
  },
  pickers = get_pickers(actions),
  extensions = {
    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = "smart_case", -- or "ignore_case" or "respect_case"
    },
  },
}

telescope.load_extension("fzf")
telescope.load_extension("harpoon")

--------- telescope -----------------

-- vim.keymap.set('n', ';f',
--   function()
--     builtin.find_files({
--       no_ignore = false,
--       hidden = true
--     })
--   end)
-- vim.keymap.set('n', ';r', function()
--   builtin.live_grep()
-- end)
-- vim.keymap.set('n', '\\\\', function()
--   builtin.buffers()
-- end)
-- vim.keymap.set('n', ';t', function()
--   builtin.help_tags()
-- end)
-- vim.keymap.set('n', ';;', function()
--   builtin.resume()
-- end)
-- vim.keymap.set('n', ';e', function()
--   builtin.diagnostics()
-- end)
