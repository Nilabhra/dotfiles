vim.g.mapleader = " "
local opts = { noremap = true, silent = true }
local keymap = vim.keymap

keymap.set("i", "jj", "<Esc>", opts)
keymap.set("n", "<leader>h", ":split<Return>", opts)
keymap.set("n", "<leader>v", ":vsplit<Return>", opts)
keymap.set("n", "<leader>x", ":close<Return>", opts)
keymap.set("n", "<leader>bx", ":bdelete<Return>", opts)
keymap.set("n", "<C-d>", "<C-d>zz", opts)
keymap.set("n", "<C-u>", "<C-u>zz", opts)
