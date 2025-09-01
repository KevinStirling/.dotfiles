return
{
  'stevearc/oil.nvim',
  lazy = false,
  -- Optional dependencies
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
  config = function()
    require("oil").setup {
      keymaps = {
        ["<ESC>"] = "actions.close",
      },
      override = function(conf)
        return conf
      end,
    }
    vim.keymap.set("n", "-", require("oil").open, { desc = "Open parent directory" })
  end,
}
