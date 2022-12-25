-- https://github.com/kyazdani42/nvim-tree.lua
-- local nvim_tree = require'nvim-tree'
local status, nvim_tree = pcall(require, "nvim-tree")
if not status then
  print("没有找到 nvim-tree")
  return
end

-- 列表操作快捷键
local list_keys = require("keybindings").nvimTreeList

function start_telescope(telescope_mode)
  local node = require("nvim-tree.lib").get_node_at_cursor()
  local abspath = node.link_to or node.absolute_path
  local is_folder = node.open ~= nil
  local basedir = is_folder and abspath or vim.fn.fnamemodify(abspath, ":h")
  require("telescope.builtin")[telescope_mode] {
    cwd = basedir,
  }
end

local function telescope_find_files(_)
  start_telescope "find_files"
end

local function telescope_live_grep(_)
  start_telescope "live_grep"
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
    enable = false,
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
    width = 50,
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
        { key = "g;r", action = "telescope_live_grep", action_cb = telescope_live_grep },
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
      quit_on_open = false,
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

  -- wsl install -g wsl-open
  -- https://github.com/4U6U57/wsl-open/
  system_open = {
    -- mac
    cmd = "open",
    -- windows
    -- cmd = "wsl-open",
  },
})
