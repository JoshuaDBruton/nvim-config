local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<C-h>", mark.add_file)
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

vim.keymap.set("n", "<leader>a", function() ui.nav_file(1) end)
vim.keymap.set("n", "<leader>b", function() ui.nav_file(2) end)
vim.keymap.set("n", "<leader>c", function() ui.nav_file(3) end)
