vim.pack.add({
    'https://github.com/nvim-mini/mini.pairs',    -- auto pairs
    'https://github.com/nvim-mini/mini.surround', -- surround selects
}, { confirm = false })

local neigh_pattern = '.[^%w_]'

require('mini.pairs').setup({
    modes = { insert = true, command = true, terminal = false },
    mappings = {
        ['('] = { action = 'open', pair = '()', neigh_pattern = neigh_pattern },
        ['['] = { action = 'open', pair = '[]', neigh_pattern = neigh_pattern },
        ['{'] = { action = 'open', pair = '{}', neigh_pattern = neigh_pattern },
        ['"'] = { action = 'open', pair = '""', neigh_pattern = neigh_pattern },
        ["'"] = { action = 'open', pair = "''", neigh_pattern = neigh_pattern },
        ['`'] = { action = 'open', pair = '``', neigh_pattern = neigh_pattern },
    },
})

require('mini.surround').setup({
    modes = { command = true },
})
