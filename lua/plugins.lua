-- make sure packer lua install
local status, packer = pcall(require, "packer")
if (not status) then
  print("Packer is not installed")
  return
end

vim.cmd [[packadd packer.nvim]]


packer.startup(function(use)
    -- Packer 可以管理自己本身
    use 'wbthomason/packer.nvim'
    -- 你的插件列表...
    use 'shaunsingh/solarized.nvim'

    ------------------- colortheme ----------------------------
    -- https://github.com/xiyaowong/nvim-transparent
    use 'xiyaowong/nvim-transparent'
    use 'ishan9299/nvim-solarized-lua'
    use 'EdenEast/nightfox.nvim'
    ------------------- nvim-tree ----------------------------
    use {
      'kyazdani42/nvim-tree.lua',
      requires = {
        'kyazdani42/nvim-web-devicons', -- optional, for file icons
      },
      tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }
    -- bufferline (新增)
    use({ "akinsho/bufferline.nvim", requires = { "kyazdani42/nvim-web-devicons", "moll/vim-bbye" }})

    use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons" } })

    use("arkav/lualine-lsp-progress")
end)
