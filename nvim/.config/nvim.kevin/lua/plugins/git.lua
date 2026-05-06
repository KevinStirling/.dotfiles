vim.pack.add({
    "https://github.com/tpope/vim-fugitive",      -- git wrapper
    "https://github.com/tpope/vim-sleuth",        -- brings github powers to fugitive
    "https://github.com/lewis6991/gitsigns.nvim", -- git buffer integration
    'https://github.com/tpope/vim-rhubarb',       -- github integration
})

require("gitsigns").setup({})
