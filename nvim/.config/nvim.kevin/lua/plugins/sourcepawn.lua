vim.pack.add({
    "https://github.com/nvim-treesitter/nvim-treesitter",
    "https://github.com/SparkyCloudy/sourcepawn-tools.nvim"
})

require("sourcepawn-tools").setup({
    ft = "sourcepawn",
})
