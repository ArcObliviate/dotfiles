local status_ok, autopairs = pcall(require, "nvim-autopairs")
if not status_ok then
    return
end

autopairs.setup{
    enable_check_bracket_line = true,
    check_ts = true,
}
