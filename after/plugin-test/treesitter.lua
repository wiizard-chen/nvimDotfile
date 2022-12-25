local status, ts = pcall(require, "nvim-treesitter.configs")
if (not status) then return end

ts.setup {
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
    config = {
      -- javascript = {
      --   __default = '// %s',
      --   jsx_element = '{/* %s */}',
      --   jsx_fragment = '{/* %s */}',
      --   jsx_attribute = '// %s',
      --   comment = '// %s'
      -- },
      typescript = {
        -- __default = '// %s',
        tsx_element = '{/* %s */}',
        tsx_fragment = '{/* %s */}',
        tsx_attribute = '// %s',
        comment = '// %s'
      }
    }
  },
  ensure_installed = {
    "tsx",
    "typescript",
    -- "toml",
    "fish",
    -- "php",
    "json",
    "yaml",
    -- "swift",
    -- "css",
    -- "html",
    "lua"
  },
  autotag = {
    enable = false,
  },
  -- -- 启用代码高亮模块
  -- highlight = {
  --   enable = false,
  --   additional_vim_regex_highlighting = false,
  -- },
  -- 启用增量选择模块
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<CR>",
      node_incremental = "<CR>",
      node_decremental = "<BS>",
      scope_incremental = "<TAB>",
    },
  },
  -- 启用代码缩进模块 (=)
  highlight = {
    enable = true,
    -- disable = { "vim", "typescript", "tsx", },  
    disable = function(lang, buf)
        local max_filesize = 50 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
    end,
  },
  indent = {
    enable = true,
    disable = { "vim", "typescript", "tsx", },  
  },  
  -- p00f/nvim-ts-rainbow
  -- rainbow = {
    -- enable = false,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    -- disable = {"tsx"},
    -- extended_mode = false, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    -- max_file_lines = nil, -- Do not enable for files with more than n lines, int
    -- colors = {
    --   "#95ca60",
    --   "#ee6985",
    --   "#D6A760",
    --   "#7794f4",
    --   "#b38bf5",
    --   "#7cc7fe",
    -- }, -- table of hex strings
    -- termcolors = { } -- table of colour name strings
  -- },
}

-- local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
-- parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }

-- 默认不要折叠
-- https://stackoverflow.com/questions/8316139/how-to-set-the-default-to-unfolded-when-you-open-a-file
-- vim.opt.foldlevel = 99

