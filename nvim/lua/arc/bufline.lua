local bufline = require("bufferline")

bufline.setup {
    options = {
        mode = "buffers",
        themable = true,
        numbers = "buffer_id",
        separator_style = "thick",
        always_show_bufferline = false,
    }
}
