local telescope = require('telescope')

local actions = require('telescope.actions')
telescope.setup({
    defaults = {
        path_display = {"truncate"},
        layout_config = {
            preview_cutoff = 10,
        },
        file_ignore_patterns = {
            "node_modules",
            "dist",
            "target",
            "vendor",
            "yarn.lock",
            "package-lock.json",
        },
    },
})

local builtin = require('telescope.builtin')
vim.keymap.set('n',  '<leader>ff',  builtin.find_files,      {})
vim.keymap.set('n',  '<leader>fg',  builtin.live_grep,       {})
vim.keymap.set('n',  '<leader>fb',  builtin.buffers,         {})
vim.keymap.set('n',  '<leader>fr',  builtin.lsp_references,  {})

