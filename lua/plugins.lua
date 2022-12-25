-- make sure packer lua install
local status, packer = pcall(require, "packer")
if (not status) then
  print("Packer is not installed")
  return
end

vim.cmd [[packadd packer.nvim]]

-- Autocommand that reloads neovim whenever you save the plugins.lua file

vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]


packer.startup(function(use)
  -- Packer 可以管理自己本身
  use 'wbthomason/packer.nvim'

  use 'nvim-lua/plenary.nvim' -- Common utilities

  ------------------- colortheme ----------------------------

  use { 'EdenEast/nightfox.nvim' }

  use { 'morhetz/gruvbox' }

  ------------------- telescope ----------------------------

  use { 'nvim-telescope/telescope.nvim', requires = { "nvim-lua/plenary.nvim" } }

  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  -- harpoon 定位非常好用的
  use("ThePrimeagen/harpoon")


  -- which key 所有的快捷键绑定在这
  use { "folke/which-key.nvim" }

  ------------------- nvim-tree ----------------------------
  use { "kyazdani42/nvim-tree.lua",
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icteons
    },
  }

  ------------------- buffline ----------------------------

  use { "akinsho/bufferline.nvim", requires = { "kyazdani42/nvim-web-devicons" } }

  use { 'famiu/bufdelete.nvim' }

  use { "arkav/lualine-lsp-progress" }

  use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons" } })


  ------------------- treesitter ----------------------------
  use {
    'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate'
  }

  ------------------- comment ----------------------------
  use {
    "numToStr/Comment.nvim",
  }
  use { "JoosepAlviste/nvim-ts-context-commentstring" }

  -- -- dashboard
  -- -- use("glepnir/dashboard-nvim")
  -- -- project
  -- -- use { "ahmedkhalf/project.nvim" }




  -- -- float term
  -- use {"akinsho/toggleterm.nvim", tag = '*', config = function()
  --   require("toggleterm").setup()
  -- end }

  -- -- mason
  -- use "williamboman/mason.nvim"
  -- use 'williamboman/mason-lspconfig.nvim'

  -- use "neovim/nvim-lspconfig"
  -- use 'windwp/nvim-autopairs'
  -- use 'windwp/nvim-ts-autotag'
  -- use 'norcalli/nvim-colorizer.lua'
  -- use "ray-x/lsp_signature.nvim"



  -- -- 补全引擎
  -- use("hrsh7th/nvim-cmp")

  -- -- Snippet 引擎
  -- use("hrsh7th/vim-vsnip")

  -- -- 补全源
  -- use("hrsh7th/cmp-vsnip")
  -- use("hrsh7th/cmp-nvim-lsp") -- { name = nvim_lsp }
  -- use("hrsh7th/cmp-buffer") -- { name = 'buffer' },
  -- use("hrsh7th/cmp-path") -- { name = 'path' }
  -- use("hrsh7th/cmp-cmdline") -- { name = 'cmdline' }
  -- use("hrsh7th/cmp-nvim-lsp-signature-help") -- { name = 'nvim_lsp_signature_help' }

  -- -- TypeScript 增强
  -- use({ "jose-elias-alvarez/nvim-lsp-ts-utils", requires = "nvim-lua/plenary.nvim" })

  -- -- JSON 增强
  -- use("b0o/schemastore.nvim")

  -- -- Lua 增强
  -- -- use("folke/lua-dev.nvim")
  -- use("folke/neodev.nvim")

  -- -- prettier 格式化
  -- use 'MunifTanjim/prettier.nvim' -- Prettier plugin for Neovim's built-in LSP client

  -- -- fold
  -- use {'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async'}

  -- -- session manager
  -- use {
  --   'rmagatti/auto-session',
  --   config = function()
  --     require("auto-session").setup {
  --       log_level = "error",
  --       auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/"},
  --     }
  --   end
  -- }
  -- -- tabby
  -- -- use 'nanozuki/tabby.nvim'
  -- --
  -- use 'famiu/bufdelete.nvim'

  -- use { 'lewis6991/gitsigns.nvim', }

  -- -- motion
  -- -- use {
  -- --   'phaazon/hop.nvim',
  -- --   branch = 'v2', -- optional but strongly recommended
  -- -- }
  -- -- jump
  -- use 'ggandor/leap.nvim'

  -- use({
  --   "kylechui/nvim-surround",
  --   tag = "*", -- Use for stability; omit to use `main` branch for the latest features
  --   config = function()
  --       require("nvim-surround").setup({
  --           -- Configuration here, or leave empty to use defaults
  --       })
  --   end
  -- })

  -- -- UI 增强
  -- use "onsails/lspkind-nvim"

  -- use 'glepnir/lspsaga.nvim' -- LSP UIs

  -- use 'jose-elias-alvarez/null-ls.nvim' -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
end)
