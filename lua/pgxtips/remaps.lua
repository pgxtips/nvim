--set leader to space
vim.g.mapleader = " "

--open netrw using tab
vim.keymap.set("n", "<leader><Tab>", vim.cmd.Explore);

--centers cursor on screen when page up (c-u) or down (c-d) is pressed 
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")

--use gp to select pasted text
vim.keymap.set("n", "gp", "`[v`]")

--open tmux sessionizer
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww ~/.config/scripts/tmux-sessionizer.sh<CR>")
