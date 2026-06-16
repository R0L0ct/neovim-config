--function ColorMyPencils(color)
--	--[[ color = color or "tokyonight" ]]
--	color = color or "rose-pine"
--	--[[ color = color or "kanagawa-dragon" ]]
--	vim.cmd.colorscheme(color)
--
--	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
--	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
--end

function ColorMyPencils()
	local groups = {
		"Normal",
		"NormalFloat",
		"TelescopeNormal",
		"TelescopeBorder",
		"TelescopePromptBorder",
		"SagaBorder",
		"FloatBorder",
	}

	for _, group in ipairs(groups) do
		vim.api.nvim_set_hl(0, group, { bg = "none", ctermbg = "none" })
	end
end

return {
	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			require("rose-pine").setup({
				disable_background = true,
			})

			-- vim.cmd("colorscheme rose-pine")
			-- ColorMyPencils()
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

			vim.cmd("colorscheme kanagawa-dragon")
			ColorMyPencils()
		end,
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("tokyonight").setup({
				transparent = true,
			})
			--[[ vim.cmd("colorscheme tokyonight") ]]
			--[[ ColorMyPencils() ]]
		end,
	},
	{
		"EdenEast/nightfox.nvim",
		priority = 1000,
		config = function()
			require("nightfox").setup({
				options = {
					transparent = true, -- Activa transparencia global
					terminal_colors = true,
					styles = {
						comments = "italic",
						keywords = "bold",
						types = "italic,bold",
					},
				},
				-- Aquí forzamos que Telescope y otros elementos sean invisibles
				specs = {
					all = {
						ui = {
							bg_gutter = "none", -- Quita el fondo de la columna de números
						},
					},
				},
				groups = {
					all = {
						-- Forzamos transparencia en Telescope
						TelescopeBorder = { fg = "fg0", bg = "none" },
						TelescopeNormal = { bg = "none" },
						TelescopePromptNormal = { bg = "none" },
						TelescopeResultsNormal = { bg = "none" },
						TelescopePreviewNormal = { bg = "none" },
						-- Menús flotantes (LSP, Autocompletado)
						NormalFloat = { bg = "none" },
						FloatBorder = { bg = "none" },
					},
				},
			})

			-- vim.cmd("colorscheme nightfox")
			-- ColorMyPencils()
		end,
	},
	{
		"Mofiqul/dracula.nvim",
		priority = 1000,
		config = function()
			local dracula = require("dracula")

			dracula.setup({
				transparent_bg = true, -- Activa transparencia global
				italic_comment = true,

				-- En esta versión, las personalizaciones van en 'overrides'
				overrides = {
					-- Transparencia para Telescope
					TelescopeBorder = { fg = "#f8f8f2", bg = "NONE" },
					TelescopeNormal = { bg = "NONE" },
					TelescopePromptNormal = { bg = "NONE" },
					TelescopeResultsNormal = { bg = "NONE" },
					TelescopePreviewNormal = { bg = "NONE" },

					-- Menús flotantes (LSP, Diagnósticos)
					NormalFloat = { bg = "NONE" },
					FloatBorder = { bg = "NONE" },

					-- Columna de números
					SignColumn = { bg = "NONE" },
					LineNr = { bg = "NONE" },

					-- Estilos de sintaxis solicitados
					-- Nota: Aquí usamos 'italic = true' en lugar de 'fmt'
					Keyword = { fg = "#ff79c6", bold = true },
					Type = { fg = "#8be9fd", italic = true, bold = true },
					Comment = { fg = "#6272a4", italic = true },
				},
			})

			--[[ vim.cmd.colorscheme("dracula") ]]
			--[[]]
			--[[ if ColorMyPencils then ]]
			--[[ 	ColorMyPencils() ]]
			--[[ end ]]
		end,
	},
}
