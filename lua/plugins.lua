-- make sure packer lua install
local status, packer = pcall(require, "packer")
if (not status) then
  print("Packer is not installed")
  return
end

packer.startup(function(use)
  -- Packer 可以管理自己本身
  use 'wbthomason/packer.nvim'

  use 'nvim-lua/plenary.nvim' -- Common utilities

  ------------------- colortheme ----------------------------

  use { 'EdenEast/nightfox.nvim' }

  use { 'morhetz/gruvbox' }

  use { "catppuccin/nvim", as = "catppuccin" }

  use({
    'rose-pine/neovim',
    as = 'rose-pine',
  })


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

  use { 'romgrk/barbar.nvim', wants = 'nvim-web-devicons' }

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

  ------------------- lsp ----------------------------

  use {
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },

      -- Snippets
      { 'L3MON4D3/LuaSnip' },
      { 'rafamadriz/friendly-snippets' },
    }
  }

  use { 'glepnir/lspsaga.nvim' } -- LSP UIs

  -- prettier 格式化
  use 'MunifTanjim/prettier.nvim' -- Prettier plugin for Neovim's built-in LSP client


  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
  }

  use 'jose-elias-alvarez/null-ls.nvim' -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua


  use 'jose-elias-alvarez/typescript.nvim'

  ------------------- project ----------------------------
  ---- session manager
  use {
    'rmagatti/auto-session',
    config = function()
      require("auto-session").setup {
        log_level = "error",
        auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
      }
    end
  }

  ---- fold
  use { 'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async' }


  ---- float term
  use { "akinsho/toggleterm.nvim", tag = '*' }

  ----- git

  use { 'lewis6991/gitsigns.nvim', }

  use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }

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

end)
