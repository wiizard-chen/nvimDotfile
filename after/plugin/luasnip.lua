local status, luasnip = pcall(require, "luasnip.loaders.from_vscode")
if (not status) then
  return print('no install luasnip')
end

-- print('vim.fn.stdpath "config"', vim.fn.stdpath "config")

require("luasnip.loaders.from_vscode").lazy_load({
  paths = vim.fn.stdpath "config" .. "/mysnippets",
})


-- require("luasnip.loaders.from_vscode").lazy_load({ paths = { "./mysnippets" } })

-- lua print(require("luasnip").get_snip_env())
