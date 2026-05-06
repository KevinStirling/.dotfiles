-- INFO: souring / running lua code
vim.keymap.set("n", "<space><space>l", "<cmd>source %<CR>")
vim.keymap.set("n", "<space>l", ":.lua<CR>")
vim.keymap.set("v", "<space>l", ":lua<CR>")

vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- INFO: Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- INFO: Diagnostic keymaps
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- INFO: visual que for yank
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Hightlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
    callback = function()
        vim.hl.on_yank()
    end,
})

-- INFO: format json
vim.keymap.set('n', '<leader>jf', ":%!jq .<CR>", { silent = true })

-- INFO: Toggle a persisting terminal pane
vim.keymap.set('n', '<esc>t', ':lua ToggleTerm()<CR>',
    { noremap = true, silent = true, desc = "Toggle terminal" })
vim.keymap.set('t', '<esc><esc>', '<c-\\><c-n>')
vim.keymap.set('t', '<esc>t', function()
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-\\><C-n>", true, false, true), "n", true)
    ToggleTerm()
end, { noremap = true, silent = true })
