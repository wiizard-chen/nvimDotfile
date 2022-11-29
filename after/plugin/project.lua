local status, project = pcall(require, "project_nvim")
if not status then
    vim.notify("没有找到 project_nvim")
  return
end

-- nvim-tree 支持
vim.g.nvim_tree_respect_buf_cwd = 0

project.setup({
  -- detection_methods = { "pattern" },
  detection_methods = { "lsp" },
  patterns = {
    "README.md",
    "Cargo.toml",
    "package.json",
    ".sln",
    ".git",
    "_darcs",
    ".hg",
    ".bzr",
    ".svn",
    "Makefile",
  },
  sync_root_with_cwd = false,

  respect_buf_cwd = false,

  update_focused_file = {
    enable = true,
    update_root = false
  },
})

local status_telescope, telescope = pcall(require, "telescope")
if not status_telescope then
  vim.notify("没有找到 telescope")
  return
end
pcall(telescope.load_extension, "projects")

