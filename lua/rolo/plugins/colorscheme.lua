function ColorMyPencils(color)
	--[[ color = color or "rose-pine" ]]
	color = color or "kanagawa-dragon"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {
	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			require("rose-pine").setup({
				disable_background = true,
			})

			--[[ vim.cmd("colorscheme rose-pine") ]]
			--[[]]
			--[[ ColorMyPencils() ]]
		end,
	},
	{
		"rebelot/kanagawa.nvim",
		name = "kanagawa",
		priority = 1000, -- High priority to ensure it loads early
		config = function()
			require("kanagawa").setup({
				transparent = true,
				colors = {
					theme = {
						all = {
							ui = {
								bg_gutter = "none",
							},
						},
					},
				},
			})

			--[[ vim.cmd("colorscheme kanagawa-dragon") ]]

			ColorMyPencils()
		end,
	},
}
