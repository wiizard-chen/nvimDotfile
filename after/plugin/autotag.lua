require('nvim-ts-autotag').setup()

require'nvim-treesitter.configs'.setup {
  autotag = {
    enable = true,
  }
}
