local status, whichkey = pcall(require, "which-key")
if (not status) then
  return print('no install whichKey')
end

whichkey.setup({
  disable = {
    buftypes = {},
    filetypes = { "TelescopePrompt" },
  },
})
