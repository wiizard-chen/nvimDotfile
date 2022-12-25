-- https://github.com/kyazdani42/nvim-tree.lua
-- local nvim_tree = require'nvim-tree'
local status, nvim_tree = pcall(require, "nvim-tree")
if not status then
  print("没有找到 nvim-tree")
  return
end

function start_telescope(telescope_mode)
  local node = require("nvim-tree.lib").get_node_at_cursor()
  local abspath = node.link_to or node.absolute_path
  local is_folder = node.open ~= nil
  local basedir = is_folder and abspath or vim.fn.fnamemodify(abspath, ":h")
  
  if telescope_mode == 'grep_string' then
    print('live_grep', basedir)
    require("telescope.builtin").grep_string {
      cwd = basedir,
      use_regex = false,
      grep_open_files = false,
      search = vim.fn.input("Grep > ")
    }
    return
  end

  if telescope_mode == 'find_files' then
    require("telescope.builtin")[telescope_mode] {
      cwd = basedir,
    }
  end
end

local function telescope_find_files(_)
  start_telescope "find_files"
end

local function telescope_grep_string(_)
  start_telescope "grep_string"
end

nvim_tree.setup({
  
  -- 完全禁止内置netrw
  disable_netrw = true,

  ignore_ft_on_setup = {
    "startify",
    "dashboard",
    "alpha",
  },
  auto_reload_on_write = false,

  hijack_directories = {
    enable = true,
  },

  -- 不显示 git 状态图标
  git = {
    enable = true,
  },
  -- project plugin 需要这样设置
  update_cwd = false,

  update_focused_file = {
    enable = true,
    update_cwd = false,
  },

  filters = {
    -- 隐藏 .文件
    dotfiles = false,
    -- 隐藏 node_modules 文件夹
    custom = { "node_modules" },
  },
  view = {
    -- 宽度
    -- width = 60,
    adaptive_size = true,
    -- 也可以 'right'
    side = "left",
    -- 隐藏根目录
    hide_root_folder = true,
    -- 自定义列表中快捷键
    mappings = {
      -- 只用内置快捷键
      custom_only = true,
      list = {
        -- 文件操作
        { key = "a", action = "create" },
        { key = "d", action = "remove" },
        { key = "r", action = "rename" },
        { key = "x", action = "cut" },
        { key = "c", action = "copy" },
        { key = "p", action = "paste" },
        { key = "y", action = "copy_name" },
        { key = "Y", action = "copy_path" },
        { key = "gy", action = "copy_absolute_path" },
        { key = "I", action = "toggle_file_info" },
        { key = "n", action = "tabnew" },
        { key = { "l", "o" }, action = "edit", mode = "n" },
        { key = "<CR>", action = "system_open" },
        { key = "h", action = "close_node" },
        { key = "v", action = "vsplit" },
        { key = "C", action = "cd" },
        { key = "g;f", action = "telescope_find_files", action_cb = telescope_find_files },
        { key = "g;r", action = "telescope_grep_string", action_cb = telescope_grep_string },
        -- { key = "g;r", action = "telescope_live_grep", action_cb = telescope_live_grep },
      },
    },
    -- 不显示行数
    number = true,
    relativenumber = false,
    -- 显示图标
    signcolumn = "yes",
  },
  actions = {
    use_system_clipboard = true,
    change_dir = {
      enable = true,
      global = false,
      restrict_above_cwd = false,
    },
    open_file = {
      quit_on_open = true,
      resize_window = true,
      window_picker = {
        enable = true,
        chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
        exclude = {
          filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
          buftype = { "nofile", "terminal", "help" },
        },
      },
    },
  },
  renderer = {
    add_trailing = false,
    group_empty = false,
    highlight_git = false,
    full_name = false,
    highlight_opened_files = "none",
    root_folder_label = ":~:s?$?/..?",
    indent_width = 2,
    indent_markers = {
      enable = false,
      inline_arrows = true,
      icons = {
        corner = "└",
        edge = "│",
        item = "│",
        bottom = "─",
        none = " ",
      },
    },
    icons = {
      webdev_colors = true,
      git_placement = "before",
      padding = " ",
      symlink_arrow = " ➛ ",
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true,
      },
      glyphs = {
        default = "",
        symlink = "",
        bookmark = "",
        folder = {
          arrow_closed = "",
          arrow_open = "",
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
          symlink_open = "",
        },
        git = {
          unstaged = "✗",
          staged = "✓",
          unmerged = "",
          renamed = "➜",
          untracked = "★",
          deleted = "",
          ignored = "◌",
        },
      },
    },
    special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
    symlink_destination = true,
  },


  -- wsl install -g wsl-open
  -- https://github.com/4U6U57/wsl-open/
  system_open = {
    -- mac
    cmd = "open",
    -- windows
    -- cmd = "wsl-open",
  },
})
