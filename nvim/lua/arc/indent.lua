local ibl = require("ibl")


local hooks = require "ibl.hooks"


ibl.setup {
    indent = {
        smart_indent_cap = true,
    },
    scope = {
        enabled = true,
        show_start = true,
        show_end = false,
        injected_languages = false,

    },
}
