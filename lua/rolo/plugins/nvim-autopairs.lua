return {
	"windwp/nvim-autopairs",
	event = "InsertEnter",
	config = function()
		require("nvim-autopairs").setup({
			check_ts = true, -- Habilita soporte para Treesitter
			ts_config = {
				javascript = { "string", "template_string" },
				typescript = { "string", "template_string" },
			},
			disable_filetype = { "TelescopePrompt", "spectre_panel" },
			fast_wrap = {},
		})
	end,
}
