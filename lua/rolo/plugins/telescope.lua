return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local builtin = require("telescope.builtin")
		local actions = require("telescope.actions")
		require("telescope").setup({
			defaults = {
				mappings = {
					n = {
						["dd"] = actions.delete_buffer,
					},
				},
			},
		})

		vim.keymap.set("n", "<leader>pf", builtin.find_files, { desc = "Telescope find_files" })
		vim.keymap.set("n", "<leader>pg", builtin.git_files, { desc = "Telescope git_files" })
		vim.keymap.set("n", "<leader>ps", function()
			builtin.grep_string({ search = vim.fn.input("Grep > ") })
		end, { desc = "Telescope grep_string Grep >" })
		vim.keymap.set("n", "<leader>pe", builtin.buffers, { desc = "Telescope buffers" })
		vim.keymap.set("n", "<leader>km", builtin.keymaps, { desc = "Telescope keymaps" })
		vim.keymap.set("n", "<leader>pws", function()
			local word = vim.fn.expand("<cword>")
			builtin.grep_string({ search = word })
		end, { desc = "Telescope grep_string word under cursor" })
		vim.keymap.set("n", "<leader>pWs", function()
			local word = vim.fn.expand("<cWORD>")
			builtin.grep_string({ search = word })
		end, { desc = "Telescope grep_string full word" })
		vim.keymap.set("n", "<leader>ph", builtin.help_tags, { desc = "Telescope help_tags" })
	end,
}
