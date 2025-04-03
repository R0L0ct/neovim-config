---@type vim.lsp.Config
return {
	cmd = {
		"ngserver",
		"--stdio",
		"--tsProbeLocations",
		"",
		"--ngProbeLocations",
		"",
		"--angularCoreVersion",
		"",
	},
	filetypes = { "typescript", "html", "typescriptreact", "typescript.tsx", "htmlangular" },
	root_markers = { "angular.json" },
}
