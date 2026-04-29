---@type vim.lsp.Config
--return {
--	cmd = { "typescript-language-server", "--stdio" },
--	init_options = { hostInfo = "neovim" },
--
--	filetypes = {
--		"javascript",
--		"javascriptreact",
--		"javascript.jsx",
--		"typescript",
--		"typescriptreact",
--		"typescript.tsx",
--	},
--
--	root_markers = { "tsconfig.json", "package.json" },
--
--	single_file_support = false,
--
--	flags = {
--		debounce_text_changes = 250,
--	},
--
--	handlers = {
--		["workspace/didChangeWatchedFiles"] = function() end,
--	},
--
--	on_attach = function(client)
--		client.server_capabilities.documentFormattingProvider = false
--		client.server_capabilities.documentRangeFormattingProvider = false
--
--		-- 🔥 reduce RAM
--		client.server_capabilities.semanticTokensProvider = nil
--	end,
--
--	settings = {
--		typescript = {
--			preferences = {
--				includeCompletionsForModuleExports = false,
--				includeCompletionsWithSnippetText = false,
--			},
--			tsserver = {
--				maxTsServerMemory = 1024,
--				logDirectory = nil,
--			},
--		},
--		javascript = {
--			preferences = {
--				includeCompletionsForModuleExports = false,
--				includeCompletionsWithSnippetText = false,
--			},
--		},
--	},
--}

---@type vim.lsp.Config
return {
	cmd = { "typescript-language-server", "--stdio" },
	init_options = { hostInfo = "neovim" },
	filetypes = {
		"javascript",
		"javascriptreact",
		"javascript.jsx",
		"typescript",
		"typescriptreact",
		"typescript.tsx",
	},
	root_markers = { "tsconfig.json", "package.json" },
	single_file_support = false,
	flags = {
		debounce_text_changes = 150, -- Reducido de 250 para mejor respuesta
		allow_incremental_sync = true, -- Sync más eficiente
	},
	handlers = {
		["workspace/didChangeWatchedFiles"] = function() end,
	},
	on_attach = function(client)
		client.server_capabilities.documentFormattingProvider = false
		client.server_capabilities.documentRangeFormattingProvider = false
		-- 🔥 reduce RAM
		client.server_capabilities.semanticTokensProvider = nil

		-- Desactiva inlay hints si no los usas (ahorra más recursos)
		-- if client.server_capabilities.inlayHintProvider then
		-- 	vim.lsp.inlay_hint.enable(false, { bufnr = bufnr })
		-- end
	end,
	settings = {
		typescript = {
			inlayHints = {
				includeInlayParameterNameHints = "none",
				includeInlayEnumMemberValueHints = false,
				includeInlayFunctionLikeReturnTypeHints = false,
				includeInlayFunctionParameterTypeHints = false,
				includeInlayPropertyDeclarationTypeHints = false,
				includeInlayVariableTypeHints = false,
			},
			preferences = {
				includeCompletionsForModuleExports = false,
				includeCompletionsWithSnippetText = false,
			},
			tsserver = {
				maxTsServerMemory = 1024, -- Aumentado de 1024 para mejor estabilidad
				logDirectory = nil,
				logVerbosity = "off", -- Desactiva logs para mejor performance
			},
		},
		javascript = {
			inlayHints = {
				includeInlayParameterNameHints = "none",
				includeInlayEnumMemberValueHints = false,
				includeInlayFunctionLikeReturnTypeHints = false,
				includeInlayFunctionParameterTypeHints = false,
				includeInlayPropertyDeclarationTypeHints = false,
				includeInlayVariableTypeHints = false,
			},
			preferences = {
				includeCompletionsForModuleExports = false,
				includeCompletionsWithSnippetText = false,
			},
		},
	},
}
