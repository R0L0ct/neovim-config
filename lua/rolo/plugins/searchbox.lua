return {
	{
		"VonHeikemen/searchbox.nvim",
		dependencies = {
			"MunifTanjim/nui.nvim", -- Requisito obligatorio
		},
		opts = {
			popup = {
				position = {
					row = "50%",
					col = "50%",
				},
				size = {
					width = 50,
				},
			},
		},
		keys = {
			-- 1. Reemplazar la palabra actual en TODO el archivo
			{
				"<leader>rp",
				function()
					require("searchbox").replace({
						default_value = vim.fn.expand("<cword>"),
						exact = true,
					})
				end,
				desc = "Reemplazar palabra bajo el cursor",
			},
			-- 2. Abrir la caja de búsqueda simple
			{
				"<leader>ss",
				function()
					require("searchbox").incsearch()
				end,
				desc = "Buscar con Searchbox",
			},
			-- 3. Reemplazar la selección activa en MODO VISUAL
			{
				"<leader>rp",
				":SearchBoxReplace --visual-mode<CR>",
				mode = "v",
				desc = "Reemplazar selección visual",
			},
		},
	},
}
