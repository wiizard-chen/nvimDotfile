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
  -- 你的插件列表...
  use 'shaunsingh/solarized.nvim'

  use 'nvim-lua/plenary.nvim' -- Common utilities

  ------------------- colortheme ----------------------------
  -- https://github.com/xiyaowong/nvim-transparent

  -- use 'xiyaowong/nvim-transparent'

  use 'ishan9299/nvim-solarized-lua'

  use {'EdenEast/nightfox.nvim'}

  use { "catppuccin/nvim", as = "catppuccin" }


  ------------------- nvim-tree ----------------------------

  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icteons
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }

  -- bufferline (新增)
  use({ "akinsho/bufferline.nvim", requires = { "kyazdani42/nvim-web-devicons", "moll/vim-bbye" } })

  use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons" } })

  use("arkav/lualine-lsp-progress")

  -- telescope
  use { 'nvim-telescope/telescope.nvim', requires = { "nvim-lua/plenary.nvim" } }
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use 'nvim-telescope/telescope-file-browser.nvim'

  -- dashboard
  -- use("glepnir/dashboard-nvim")
  -- project
  -- use { "ahmedkhalf/project.nvim" }

  -- treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  -- comment
  use {
    "numToStr/Comment.nvim",
  }
  use { "JoosepAlviste/nvim-ts-context-commentstring" }


  -- float term
  use {"akinsho/toggleterm.nvim", tag = '*', config = function()
    require("toggleterm").setup()
  end }

  -- mason
  use "williamboman/mason.nvim"
  use 'williamboman/mason-lspconfig.nvim'
  use "neovim/nvim-lspconfig"

  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'
  use 'norcalli/nvim-colorizer.lua'

  -- harpoon
  use("ThePrimeagen/harpoon")

  -- session manager
  -- use { 'rmagatti/auto-session' }

  -- 补全引擎
  use("hrsh7th/nvim-cmp")

  -- Snippet 引擎
  use("hrsh7th/vim-vsnip")

  -- 补全源
  use("hrsh7th/cmp-vsnip")
  use("hrsh7th/cmp-nvim-lsp") -- { name = nvim_lsp }
  use("hrsh7th/cmp-buffer") -- { name = 'buffer' },
  use("hrsh7th/cmp-path") -- { name = 'path' }
  use("hrsh7th/cmp-cmdline") -- { name = 'cmdline' }
  use("hrsh7th/cmp-nvim-lsp-signature-help") -- { name = 'nvim_lsp_signature_help' }

  -- TypeScript 增强
  use({ "jose-elias-alvarez/nvim-lsp-ts-utils", requires = "nvim-lua/plenary.nvim" })

  -- JSON 增强
  use("b0o/schemastore.nvim")

  -- Lua 增强
  -- use("folke/lua-dev.nvim")
  use("folke/neodev.nvim")

  -- prettier 格式化
  use 'MunifTanjim/prettier.nvim' -- Prettier plugin for Neovim's built-in LSP client

  -- fold
  use {'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async'}

  -- session
  use({
    "folke/persistence.nvim",
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
    module = "persistence",
    config = function()
      require("persistence").setup({
        dir = vim.fn.expand(vim.fn.stdpath("data") .. "/sessions/"), -- directory where session files are saved
      })
    end,
  })
  use { 'lewis6991/gitsigns.nvim', }

  -- motion
  use {
    'phaazon/hop.nvim',
    branch = 'v2', -- optional but strongly recommended
  }

  -- UI 增强
  use "onsails/lspkind-nvim"
  use 'glepnir/lspsaga.nvim' -- LSP UIs

  use 'jose-elias-alvarez/null-ls.nvim' -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
end)
