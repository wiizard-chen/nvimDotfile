local status, transparent = pcall(require, "transparent")
if not status then
  vim.notify("没有找到 transparent")
  return
end

transparent.setup({
  enable = true,
  extra_groups = {
    "BufferLineTabClose",
    "BufferLineFill",
    "BufferLineBackground",
    "BufferLineSeparator",
    "BufferLineIndicatorSelected",
  },
})

-- Autocmd for nvim-tree
vim.cmd("autocmd Colorscheme * highlight NvimTreeNormal guibg=none guifg=#9da5b3")
