function get_mode()
    local mode = vim.fn.mode()
    return string.upper(mode)
end

-- Define highlight groups
vim.cmd('hi User1 guifg=#eea040 guibg=#222222')
vim.cmd('hi User2 guifg=#dd3333 guibg=#222222')
vim.cmd('hi User3 guifg=#ff66ff guibg=#222222')
vim.cmd('hi User4 guifg=#a0ee40 guibg=#222222')
vim.cmd('hi User5 guifg=#eeee40 guibg=#222222')
vim.cmd('hi white guifg=#ffffff guibg=#222222')

vim.opt.statusline =
"%1*%{v:lua.get_mode()}" -- get the current mode
.. " | "
.. "%4*%t "    -- file name
.. "%2*%m"       -- modified flag
.. "%=" -- after this stuff is to the right
.. "%1*%l"     -- current line
.. "%2*/%L"      -- total lines

    
vim.opt.laststatus = 3
