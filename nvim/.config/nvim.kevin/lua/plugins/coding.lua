vim.pack.add({
    'https://github.com/nvim-mini/mini.pairs', -- auto pairs
    'https://github.com/nvim-mini/mini.surround', -- surround selects
}, {confirm = false })

require('mini.pairs').setup({
    modes = { command = true },
})

require('mini.surround').setup({
    modes = { command = true },
})
