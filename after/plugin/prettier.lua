local status, prettier = pcall(require, "prettier")
if (not status) then
  print ('lua prettier error')
  return 
end

prettier.setup {
  bin = 'prettierd',
  filetypes = {
    "css",
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
    "json",
    "scss",
    "less"
  }
}

