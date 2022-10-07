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
end)
