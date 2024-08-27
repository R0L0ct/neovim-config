return {
  "ThePrimeagen/harpoon",
  config = function()
    local mark = require("harpoon.mark")
    local ui = require("harpoon.ui")
    local keymap = vim.keymap

    keymap.set("n", "<leader>ha", mark.add_file)
    keymap.set("n", "<leader>hh", ui.toggle_quick_menu)

    keymap.set("n", "<leader>hq", function() ui.nav_file(1) end)
    keymap.set("n", "<leader>hw", function() ui.nav_file(2) end)
    keymap.set("n", "<leader>he", function() ui.nav_file(3) end)
    keymap.set("n", "<leader>hr", function() ui.nav_file(4) end)
  end
}
