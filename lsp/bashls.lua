---@type vim.lsp.Config
return {
	cmd = { "bash-language-server", "start" },
	filetypes = { "bash", "sh" },
	settings = {
		bashIde = {
			globPattern = "*@(.sh|.inc|.bash|.command)",
		},
	},
	root_markers = { ".git" },
	single_file_support = true,
}
