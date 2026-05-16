vim.pack.add({
    'https://github.com/nvim-mini/mini.statusline',
    'https://github.com/nvim-lualine/lualine.nvim',
    'https://github.com/nvim-mini/mini.cmdline',
    'https://github.com/nvim-treesitter/nvim-treesitter', -- syntax
    'https://github.com/nvim-treesitter/nvim-treesitter-context',
    'https://github.com/saghen/blink.cmp',                -- completion
    'https://github.com/rafamadriz/friendly-snippets',
    'https://github.com/stevearc/oil.nvim'                -- filesystem browser
}, { confirm = false })

require('mini.statusline').setup({
    modes = { command = true },
})

-- require('lualine').setup({
--     options = {
--         icons_enabled = true,
--         component_separators = '|',
--         section_separators = '',
--         globalstatus = false,
--     },
-- })

require('mini.cmdline').setup({
    modes = { command = true },
    autocomplete = {
        delay = 500,
    },
    autopeek = {
        enable = false,
    }
})

require("oil").setup {
    view_options = {
        show_hidden = true,
    },
    keymaps = {
        ["<ESC>"] = "actions.close",
    },
    override = function(conf)
        return conf
    end,
}
vim.keymap.set("n", "-", require("oil").open, { desc = "Open parent directory" })

require("nvim-treesitter").setup()

-- equivalent to :TSUpdate
require("nvim-treesitter.install").update("all")

-- require("nvim-treesitter.configs").setup({
--     auto_install = true, -- autoinstall languages that are not installed yet
-- })

require("treesitter-context").setup({
    opts = { mode = "cursor", max_lines = 3 },
})
require("blink.cmp").setup({
    sources = {
        providers = {
            snippets = {
                opts = {
                    friendly_snippets = true, -- default

                    -- see the list of frameworks in: https://github.com/rafamadriz/friendly-snippets/tree/main/snippets/frameworks
                    -- and search for possible languages in: https://github.com/rafamadriz/friendly-snippets/blob/main/package.json
                    -- the following is just an example, you should only enable the frameworks that you use
                    extended_filetypes = {
                    }
                }
            }
        }
    },
    completion = {
        documentation = {
            auto_show = true,
            auto_show_delay_ms = 1000,
        },
    },

    -- default blink keymaps
    keymap = {
        ['<C-p>'] = { 'select_prev', 'fallback_to_mappings' },
        ['<C-n>'] = { 'select_next', 'fallback_to_mappings' },

        ['<C-y>'] = { 'select_and_accept', 'fallback' },
        ['<C-e>'] = { 'cancel', 'fallback' },
        ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },

        ['<Tab>'] = { 'snippet_forward', 'fallback' },
        ['<S-Tab>'] = { 'snippet_backward', 'fallback' },

        ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
        ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },

        ['<C-k>'] = { 'show_signature', 'hide_signature', 'fallback' },
    },

    fuzzy = {
        implementation = "lua",
    },
})
