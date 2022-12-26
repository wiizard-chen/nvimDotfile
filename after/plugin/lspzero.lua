local status, lsp = pcall(require, "lsp-zero")
if (not status) then
  return print('no install lsp-zero')
end

local cmp = require('cmp')

local cmp_select = { behavior = cmp.SelectBehavior.Select }

local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  ["<C-Space>"] = cmp.mapping.complete(),
})

-- Use cmdline & path source for ':'.
cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = "path" },
  }, {
    { name = "cmdline" },
  }),
})

-- Use buffer source for `/`.
cmp.setup.cmdline("/", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = "buffer" },
  },
})

-- lsp.preset('recommended')

lsp.set_preferences({
  suggest_lsp_servers = true,
  setup_servers_on_start = true,
  set_lsp_keymaps = false,
  configure_diagnostics = true,
  cmp_capabilities = true,
  manage_nvim_cmp = true,
  call_servers = 'local',
})

lsp.ensure_installed({
  'tsserver',
  'eslint',
  'sumneko_lua',
})

-- Fix Undefined global 'vim'
lsp.configure('sumneko_lua', {
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      }
    }
  }
})

-- disable completion with tab
-- this helps with copilot setup
cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.nvim_workspace()
lsp.setup()

vim.diagnostic.config({
  virtual_text = true,
  update_in_insert = true,
})
