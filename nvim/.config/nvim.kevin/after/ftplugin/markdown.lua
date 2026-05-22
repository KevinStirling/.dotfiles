vim.opt_local.foldmethod = 'expr'
vim.opt_local.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt_local.foldlevel = 1

vim.keymap.set('n', '<CR>', 'za', { desc = "Toggle fold under cursor", buffer = true })
