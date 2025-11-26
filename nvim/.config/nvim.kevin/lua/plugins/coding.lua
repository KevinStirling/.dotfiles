return
{
  {
    'echasnovski/mini.pairs',
    version = false,
    config = function()
      require('mini.pairs').setup({
        opts = {}
      })
    end
  },
  {
    'echasnovski/mini.ai',
    version = false,
    config = function()
      require('mini.ai').setup()
    end
  },
  {
    'echasnovski/mini.surround',
    verison = false,
    config = function()
      require('mini.surround').setup()
    end
  }
}
