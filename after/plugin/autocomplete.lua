vim.opt.completeopt = { "menu", "menuone", "noinsert", "noselect" }
local cmp = require('cmp')

cmp.setup({
    preselect = 'none',
    sources = {
        {name = 'nvim_lsp'}, -- hrsh7th/cmp-nvim-lsp (completion by lsp) 
        {name = 'buffer'}, -- hrsh7th/cmp-buffer (completion by words in buffer)
        {name = 'path'}, -- hrsh7th/cmp-path (completion by file paths)
    },
    mapping = {
        ['<C-y>'] = cmp.mapping.confirm({select = false}),
        ['<C-p>'] = cmp.mapping.select_prev_item({behavior = 'select'}),
        ['<C-n>'] = cmp.mapping.select_next_item({behavior = 'select'}),
    },
})
