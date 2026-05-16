vim.pack.add({
    'https://github.com/j-hui/fidget.nvim',                         -- notifications
    'https://github.com/nvim-mini/mini.indentscope',                -- scope visualization
    'https://github.com/nvim-mini/mini.clue',                       -- shortcut hints
    'https://github.com/MeanderingProgrammer/render-markdown.nvim', -- markdown rendering & styling
})
require('render-markdown').setup()
require("fidget").setup({
    opts = {
        notification = {
            override_vim_notify = true,
            window = {
                winblend = 0,
                border = "solid"
            },
        },
    },
})

require("mini.indentscope").setup({
    symbol = "│",
})

local miniclue = require('mini.clue')
miniclue.setup({
    triggers = {
        -- Leader triggers
        { mode = 'n', keys = '<Leader>' },
        { mode = 'x', keys = '<Leader>' },

        -- Built-in completion
        { mode = 'i', keys = '<C-x>' },

        -- `g` key
        { mode = 'n', keys = 'g' },
        { mode = 'x', keys = 'g' },

        -- Marks
        { mode = 'n', keys = "'" },
        { mode = 'n', keys = '`' },
        { mode = 'x', keys = "'" },
        { mode = 'x', keys = '`' },

        -- Registers
        { mode = 'n', keys = '"' },
        { mode = 'x', keys = '"' },
        { mode = 'i', keys = '<C-r>' },
        { mode = 'c', keys = '<C-r>' },

        -- Window commands
        { mode = 'n', keys = '<C-w>' },

        -- `z` key
        { mode = 'n', keys = 'z' },
        { mode = 'x', keys = 'z' },
    },

    window = {
        delay = 200,
        config = {
            width = "auto",
        }
    },

    clues = {
        -- Enhance this by adding descriptions for <Leader> mapping groups
        miniclue.gen_clues.builtin_completion(),
        miniclue.gen_clues.g(),
        miniclue.gen_clues.marks(),
        miniclue.gen_clues.registers(),
        miniclue.gen_clues.windows(),
        miniclue.gen_clues.z(),
    },
})
