-- Trouble (used for document_diagnostics)
local trouble = require("trouble")

trouble.setup({
    modes = {
        diagnostics = {
            groups = {
                { "filename", format = " {filename} {basename:Title}" },
            },
        },
    },
})

vim.keymap.set("n", "<leader>tt", "<cmd>Trouble diagnostics toggle filter.severity=vim.diagnostic.severity.ERROR<CR>")
vim.keymap.set("n", "<leader>tn", function() trouble.next({jump=true}) end)
vim.keymap.set("n", "<leader>tp", function() trouble.prev({jump=true}) end)
