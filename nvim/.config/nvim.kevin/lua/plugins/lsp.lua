vim.pack.add({
    "https://github.com/neovim/nvim-lspconfig",                     -- default configs for lsps
    "https://github.com/mason-org/mason.nvim",                      -- package manager
    "https://github.com/mason-org/mason-lspconfig.nvim",            -- lspconfig bridge
    "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim", -- auto installer

}, { confirm = false })

local lsp_servers = {
    lua_ls = {
        -- https://luals.github.io/wiki/settings/ | `:h nvim_get_runtime_file`
        Lua = { workspace = { library = vim.api.nvim_get_runtime_file("lua", true) }, },
    },
    gopls = {},
    ts_ls = {},
    markdown_oxide = {},
}

require("mason").setup()
require("mason-lspconfig").setup()
require("mason-tool-installer").setup({
    ensure_installed = vim.tbl_keys(lsp_servers),
})

vim.lsp.config('markdown_oxide', {
    config = function()
        local capabilities = require('blink.cmp').get_lsp_capabilities()
        vim.lsp._enabled_configs.setup({ capabilities = capabilities })
    end
})

-- enable formatting for attached lsp servers
vim.g.format_is_enabled = true
for server, config in pairs(lsp_servers) do
    vim.lsp.config(server, {
        settings = config,

        -- only create the keymaps if the server attaches successfully
        on_attach = function(_, bufnr)
            -- Setup autoformatting
            vim.api.nvim_create_user_command('FormatToggle', function()
                vim.g.format_is_enabled = not vim.g.format_is_enabled
                print('Setting autoformatting to: ' .. tostring(vim.g.format_is_enabled))
            end, {})

            -- Basic LSP keymaps
            vim.keymap.set("n", "grd", vim.lsp.buf.definition,
                { buffer = bufnr, desc = "vim.lsp.buf.definition()", })

            vim.keymap.set("n", "grf", vim.lsp.buf.format,
                { buffer = bufnr, desc = "vim.lsp.buf.format()", })

            -- Create a command `:Format` local to the LSP buffer
            vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
                vim.lsp.buf.format()
            end, { desc = 'Format current buffer with LSP' })
        end,
    })
end

vim.lsp.enable(vim.tbl_keys(lsp_servers))
