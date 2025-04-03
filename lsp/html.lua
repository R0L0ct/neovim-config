---@type vim.lsp.Config
return {
	init_options = {
		configurationSection = { "html", "css", "javascript" },
		embeddedLanguages = {
			css = true,
			javascript = true,
		},
		provideFormatter = true,
	},
	cmd = { "vscode-html-language-server", "--stdio" },
	filetypes = { "html", "templ" },
	settings = {},
	root_markers = { "package.json", ".git" },
	single_file_support = true,
}
