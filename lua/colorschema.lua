-- local colorscheme = "rose-pine"
-- local colorscheme = "nightfox"
-- local colorscheme = "gruvbox"


-- require('nightfox').setup({
--   options = {
--     -- Compiled file's destination location
--     compile_path = vim.fn.stdpath("cache") .. "/nightfox",
--     compile_file_suffix = "_compiled", -- Compiled file suffix
--     transparent = false, -- Disable setting background
--     terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
--     dim_inactive = false, -- Non focused panes set to alternative background
--     module_default = true, -- Default enable value for modules
--     -- styles = { -- Style to be applied to different syntax groups
--     --   comments = "NONE", -- Value is any valid attr-list value `:help attr-list`
--     --   conditionals = "NONE",
--     --   constants = "NONE",
--     --   functions = "NONE",
--     --   keywords = "NONE",
--     --   numbers = "NONE",
--     --   operators = "NONE",
--     --   strings = "NONE",
--     --   types = "NONE",
--     --   variables = "NONE",
--     -- },
--     inverse = { -- Inverse highlight for different types
--       match_paren = false,
--       visual = false,
--       search = false,
--     },
--     modules = { -- List of various plugins and additional options
--       -- ...
--     },
--   },
--   palettes = {},
--   specs = {},
--   groups = {},
-- })

-- print("colorscheme", colorscheme);

-- vim.cmd("colorscheme " .. colorscheme)


require('rose-pine').setup({
  --- @usage 'main' | 'moon'
  dark_variant = 'moon',
  bold_vert_split = false,
  dim_nc_background = false,
  disable_background = true,
  disable_float_background = true,
  disable_italics = false,

  --- @usage string hex value or named color from rosepinetheme.com/palette
  groups = {
    background = 'base',
    panel = 'surface',
    border = 'highlight_med',
    comment = 'muted',
    link = 'iris',
    punctuation = 'subtle',

    error = 'love',
    hint = 'iris',
    info = 'foam',
    warn = 'gold',

    headings = {
      h1 = 'iris',
      h2 = 'foam',
      h3 = 'rose',
      h4 = 'gold',
      h5 = 'pine',
      h6 = 'foam',
    }
    -- or set all headings at once
    -- headings = 'subtle'
  },

  -- Change specific vim highlight groups
  highlight_groups = {
    ColorColumn = { bg = 'rose' }
  }
})

function ColorMyPencils(color)
  color = color or "rose-pine"
  vim.cmd.colorscheme(color)
  -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

ColorMyPencils()


-- set colorscheme after options
-- vim.cmd('colorscheme rose-pine')
