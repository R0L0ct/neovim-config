return {
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
	},
	-- {
	-- 	"folke/noice.nvim",
	-- 	event = "VeryLazy",
	-- 	opts = {
	-- 		-- tu configuración aquí
	-- 	},
	-- 	dependencies = {
	-- 		"MunifTanjim/nui.nvim",
	-- 		{
	-- 			"rcarriga/nvim-notify",
	-- 			opts = {
	-- 				background_colour = "#000000", -- o el color de tu tema
	-- 			},
	-- 		},
	-- 	},
	-- },
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			"MunifTanjim/nui.nvim",
			-- Añadimos fidget como dependencia para asegurar que cargue en orden
			{
				"j-hui/fidget.nvim",
				opts = {
					notification = {
						window = {
							winblend = 0, -- Fondo sólido o transparente según tu tema
						},
					},
				},
			},
		},
		opts = {
			-- Mantiene el cmdline flotante y la búsqueda en el centro
			cmdline = { enabled = true },
			search = { enabled = true },

			-- DESACTIVAMOS las notificaciones y mensajes de Noice
			-- Esto hace que NeoVim use el sistema nativo, el cual será atrapado por Fidget
			lsp = {
				progress = { enabled = false }, -- Fidget ya maneja el progreso de LSP de forma más limpia
				override = {
					["vim.lsp.util.convert_markdown_to_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
			},
			messages = { enabled = false }, -- Evita que los mensajes grandes del sistema muten a popups
			popupmenu = { enabled = true }, -- Mantiene el menú de autocompletado flotante si lo usas

			notify = { enabled = false }, -- Apaga el formateador de notificaciones de Noice
		},
	},
	{
		"b0o/incline.nvim",
		event = "BufReadPre", -- Load this plugin before reading a buffer
		priority = 1200, -- Set the priority for loading this plugin
		config = function()
			require("incline").setup({
				window = { margin = { vertical = 0, horizontal = 1 } }, -- Set the window margin
				hide = {
					cursorline = true, -- Hide the incline window when the cursorline is active
				},
				render = function(props)
					local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t") -- Get the filename
					if vim.bo[props.buf].modified then
						filename = "[+] " .. filename -- Indicate if the file is modified
					end

					local icon, color = require("nvim-web-devicons").get_icon_color(filename) -- Get the icon and color for the file
					return { { icon, guifg = color }, { " " }, { filename } } -- Return the rendered content
				end,
			})
		end,
	},
}
