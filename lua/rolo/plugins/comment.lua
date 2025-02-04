return {
	"numToStr/Comment.nvim",
	opts = {
		pre_hook = function(ctx)
			return require("ts_context_commentstring.internal").calculate_commentstring({
				key = ctx.ctype == require("Comment.utils").ctype.line and "__default" or "__multiline",
			})
		end,
	},
	config = function(_, opts)
		require("Comment").setup(opts)
	end,
}
