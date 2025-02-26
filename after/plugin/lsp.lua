require("mason").setup()
require("mason-lspconfig").setup()

require("mason-lspconfig").setup_handlers {
    -- The first entry (without a key) will be the default handler
    -- and will be called for each installed server that doesn't have
    -- a dedicated handler.
    function (server_name) -- default handler (optional)
        require("lspconfig")[server_name].setup {}
    end,

    -- Next, you can provide a dedicated handler for specific servers.
    -- For example, a handler override for the `lua_ls`:
    ["lua_ls"] = function ()
        require('lspconfig').lua_ls.setup({
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { 'vim' }
                    }
                }
            }
        })
    end,

    -- ["clangd"] = function ()
    --     require('lspconfig').clangd.setup({
    --         cmd = { "clangd", "--compile-commands-dir=build" },
    --     })
    -- end,
}

-- Note: 
-- If you use this approach, make sure you don't also manually set up servers
-- directly via `lspconfig` as this will cause servers to be set up more than
-- once.

-- change border of documentation hover window, See https://github.com/neovim/neovim/pull/13998.
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
})

-- binds 
vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end)
vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end)
vim.keymap.set("n", "gl", function() vim.diagnostic.open_float({border="rounded"}) end)
vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end)
vim.keymap.set("n", "gD", function() vim.lsp.buf.declaration() end)
vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end)

