--uses system clipboard
vim.o.clipboard = "unnamedplus"

--set tab spacing to 4 spaces
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

vim.o.smartindent = true

-- ignore case when searching
vim.o.ignorecase = true

--remove line wrap
vim.o.wrap = false

--set line numbers
vim.o.number = true

--set relative line numbers
vim.o.relativenumber = true

--allows me to insert at the beginning of multiple visual lines
vim.o.virtualedit = "block"

--remove highlight on search
vim.o.hlsearch = false

--incremental search
vim.o.incsearch = true

--highlights on yank
vim.cmd[[
    au TextYankPost * silent! lua vim.highlight.on_yank {higroup="IncSearch", timeout=80}
]]

-- stops auto comments on newline below comment
vim.cmd([[autocmd FileType * set formatoptions-=ro]])

--sets update time of how long vim waits to run plugins
vim.o.updatetime = 80

--set 80 wide column
vim.o.colorcolumn = "80"

-- provides a guranteed line number column width
-- avoids auto changing width of vim when errors or 
-- warning occur
vim.o.signcolumn  = "yes:1"
