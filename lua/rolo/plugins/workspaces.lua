return {
	"natecraddock/workspaces.nvim",
	config = function()
		require("workspaces").setup({
			-- Directorio donde se guardará la lista de workspaces
			path = vim.fn.stdpath("data") .. "/workspaces",

			-- Hooks: Comandos que se ejecutan al abrir un workspace
			hooks = {
				open_pre = { "silent! wa", "silent! %bwipeout!" },
				open = function()
					require("auto-session").restore_session()
				end,
				--open = { "Telescope find_files" },
			},
		})
	end,
}
