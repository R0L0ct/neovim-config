return {
	"ThePrimeagen/harpoon",
	config = function()
		local mark = require("harpoon.mark")
		local ui = require("harpoon.ui")
		local keymap = vim.keymap

		keymap.set("n", "<leader>ha", mark.add_file, { desc = "Harpoon add file" })
		keymap.set("n", "<leader>hh", ui.toggle_quick_menu, { desc = "Harpoon toggle quick menu" })

		keymap.set("n", "<leader>hq", function()
			ui.nav_file(1)
		end, { desc = "Harpoon nav file 1" })
		keymap.set("n", "<leader>hw", function()
			ui.nav_file(2)
		end, { desc = "Harpoon nav file 2" })
		keymap.set("n", "<leader>he", function()
			ui.nav_file(3)
		end, { desc = "Harpoon nav file 3" })
		keymap.set("n", "<leader>hr", function()
			ui.nav_file(4)
		end, { desc = "Harpoon nav file 4" })
	end,
}
