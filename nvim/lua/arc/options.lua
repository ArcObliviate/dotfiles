local o = vim.opt

o.number = true
o.relativenumber = true
o.incsearch = true
o.ignorecase = true
o.smartcase = true
o.hlsearch = false
o.undofile = true
o.swapfile = false
o.showcmd = true
o.showmode = false
o.showmatch = true
o.wildmenu = true
o.wildmode = "full"
o.mouse = "a"
o.encoding = "utf-8"
o.tabstop = 2
o.softtabstop = 2
o.shiftwidth = 2
o.expandtab = true
o.scrolloff = 5
o.termguicolors = true
o.compatible = false
o.wrap = true
o.smartindent = true



vim.cmd "syntax on"
vim.cmd "filetype on"
vim.cmd "filetype plugin on"
vim.cmd "filetype indent on"

vim.cmd([[ autocmd FileType * setlocal formatoptions-=cro]])

vim.cmd 'set splitbelow'
vim.cmd 'set splitright'

vim.g.netrw_banner=0
vim.g.netrw_browse_split=0
vim.g.netrw_liststyle=0
