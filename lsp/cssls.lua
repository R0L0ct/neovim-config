---@type vim.lsp.Config
return {
	init_options = {
		provideFormatter = true,
	},
	cmd = { "vscode-css-language-server", "--stdio" },
	filetypes = { "css", "scss", "less" },
	settings = {
		css = {
			validate = true,
		},
		less = {
			validate = true,
		},
		scss = {
			validate = true,
		},
	},
	root_markers = { "package.json", ".git" },
	single_file_support = true,
}
