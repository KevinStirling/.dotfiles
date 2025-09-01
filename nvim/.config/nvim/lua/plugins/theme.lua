return
{
  'xiyaowong/nvim-transparent',
  -- {
  --   'sainnhe/gruvbox-material',
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     vim.g.gruvbox_material_enable_italic = true
  --     vim.g.gruvbox_material_background = 'hard'
  --     vim.g.gruvbox_material_foreground = 'material'
  --     vim.g.gruvbox_material_enable_bold = 1
  --     vim.cmd.colorscheme('gruvbox-material')
  --   end
  -- },
  {
    "wtfox/jellybeans.nvim",
    priority = 1000,
    config = function()
      require("jellybeans").setup {
        transparent = false,
        italics = true,
      }
      vim.cmd.colorscheme("jellybeans")
    end,
    opts = {
      on_highlights = function(hl, c)
        hl.Constant = { fg = "#00ff00", bold = true }
      end,
    },
  },
  {
    'echasnovski/mini.icons',
    version = '*',
    config = function()
      local icons = require 'mini.icons'
      icons.setup { style = 'glyph', mock_nvim_web_devicons = true }
    end
  },
}
