local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }
local term_opts = { noremap = true }

vim.g.mapleader = ' '

keymap('n', 'dx', '"+dd', opts)
keymap('n', '<leader>y', '"+y', opts)
keymap('v', '<leader>y', '"+y', opts)
keymap('n', '<leader>p', '"+p', opts)
keymap('n', '<leader>nh', '<cmd>noh<CR>', opts)
keymap('n', '<leader>w', '<cmd> set wrap!<CR>', opts)
keymap('n', 'Q', '<Nop>', opts)
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)
keymap("n", "<leader>x", "<cmd>!chmod +x %<CR>", opts)
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)
keymap("n", "<leader>ff", ":find ", term_opts)

keymap("n", "<leader>e", "<cmd>25Lex<CR>", opts)

keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

keymap('n', "<C-h>", "<C-w>h", opts)
keymap('n', "<C-j>", "<C-w>j", opts)
keymap('n', "<C-k>", "<C-w>k", opts)
keymap('n', "<C-l>", "<C-w>l", opts)


keymap("n", "<tab>", "<cmd>bnext<CR>", opts)
keymap("n", "<S-tab>", "<cmd>bprevious<CR>", opts)

keymap("n", "<leader>fb", ":buffer ", term_opts)

keymap("n", "<leader>rs", "<cmd>w<CR><cmd>so<CR>", opts)
