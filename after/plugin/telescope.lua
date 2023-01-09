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



local function changed_on_branch()
  local previewers = require('telescope.previewers')
  local pickers = require('telescope.pickers')
  local sorters = require('telescope.sorters')
  local finders = require('telescope.finders')
  local shellPath = vim.fn.stdpath "config" .. "/shell/telescope.sh"

  local picker = pickers.new {
    results_title = 'Modified on current branch',
    finder = finders.new_oneshot_job({ shellPath, 'list' }),
    sorter = sorters.get_fuzzy_file(),
    previewer = previewers.new_termopen_previewer {
      get_command = function(entry)
        return { shellPath, 'diff', entry.value }
      end
    },
  }

  picker.find()
  -- gcc:find()
end
