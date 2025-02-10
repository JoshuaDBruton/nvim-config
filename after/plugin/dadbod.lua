vim.g.db_ui_use_nerd_fonts = 1

-- Define commands (optional, but good practice)
-- vim.cmd [[
-- command DBUI DBUI
-- command DBUIToggle DBUIToggle
-- command DBUIAddConnection DBUIAddConnection
-- command DBUIFindBuffer DBUIFindBuffer
-- ]]

local cmp = require('cmp')

cmp.setup({
    sources = {
        { name = "lsp" },
        { name = "path" },
        { name = "snippets" },
        { name = "buffer" },
        { name = "dadbod", module = "vim_dadbod_completion.blink" }
    },
})
