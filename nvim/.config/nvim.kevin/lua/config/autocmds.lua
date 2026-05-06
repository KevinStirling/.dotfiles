-- INFO: auto format on save
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("lsp", { clear = true }),
    callback = function(args)
        vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = args.buf,
            callback = function()
                if not vim.g.format_is_enabled then
                    return
                end
                vim.lsp.buf.format { async = false, id = args.data.client_id }
            end,
        })
    end
})
