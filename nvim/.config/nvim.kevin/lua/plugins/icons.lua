return {
  {
    'echasnovski/mini.icons',
    version = '*',
    config = function()
      local icons = require 'mini.icons'
      icons.setup { style = 'glyph', mock_nvim_web_devicons = true }
    end
  },
}
