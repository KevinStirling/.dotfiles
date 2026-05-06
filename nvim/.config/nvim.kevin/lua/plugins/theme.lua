vim.pack.add({
    'https://github.com/xiyaowong/nvim-transparent', -- transparent bg
    'https://github.com/nvim-mini/mini.icons',       -- icons

    -- themes
    'https://github.com/TheNiteCoder/mountaineer.vim',
    'https://github.com/sainnhe/gruvbox-material',
})
require("mini.icons").setup()

vim.g.gruvbox_material_enable_italic = true
vim.g.gruvbox_material_transparent_background = 2
vim.g.gruvbox_material_foreground = 'material'
vim.g.gruvbox_material_enable_bold = 1

vim.api.nvim_set_hl(0, 'SignColumn', { bg = 'none' })
vim.cmd.colorscheme('gruvbox-material')
