return {
	"JoosepAlviste/nvim-ts-context-commentstring",
	opts = {
		enable = true,
		enable_autocmd = false,
	},
	config = function(_, opts)
		require("ts_context_commentstring").setup(opts)
	end,
}
