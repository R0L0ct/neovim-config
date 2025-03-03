return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"folke/neodev.nvim",
	},
	config = function()
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local on_attach = function(client, bufnr)
			local opts = { buffer = bufnr, noremap = true, silent = true }
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
			vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
			vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
			vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
			vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
			vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
			vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, opts)
			vim.keymap.set("n", "<leader>si", vim.lsp.buf.signature_help, opts)
			vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
			vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
			vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
			vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, opts)
			-- vim.keymap.set('n', '<leader>f', function()
			--     vim.lsp.buf.format { async = true }
			-- end, opts)

			if client.server_capabilities.documentHighlightProvider then
				vim.api.nvim_create_autocmd("CursorHold", {
					buffer = bufnr,
					callback = function()
						vim.lsp.buf.document_highlight()
					end,
				})

				vim.api.nvim_create_autocmd("CursorMoved", {
					buffer = bufnr,
					callback = function()
						vim.lsp.buf.clear_references()
					end,
				})
			end
		end

		local capabilities = cmp_nvim_lsp.default_capabilities()

		require("neodev").setup()

		-- Lua
		require("lspconfig").lua_ls.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			settings = {
				Lua = {
					telemetry = { enable = false },
					workspace = { checkThirdParty = false },
				},
			},
		})

		-- Angular

		local util = require("lspconfig/util")

		require("lspconfig").angularls.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			cmd = {
				"ngserver",
				"--stdio",
				"--tsProbeLocations",
				table.concat({
					"/home/rolo/.nvm/versions/node/v22.11.0/lib/node_modules/@angular/language-service",
				}, ","),
				"--ngProbeLocations",
				table.concat({
					"/home/rolo/.nvm/versions/node/v22.11.0/lib/node_modules/@angular/language-service",
				}, ","),
			},
			filetypes = {
				"typescript",
				"html",
				"typescriptreact",
				"typescript.tsx",
			},
			-- root_dir = util.root_pattern("angular.json", "package.json", ".git"),
			root_dir = util.root_pattern("angular.json"),
			settings = {
				angular = {
					suggest = {
						strictTemplates = true, -- Enforce strict suggestions in templates
					},
				},
			},
		})

		-- SQL
		require("lspconfig").sqlls.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			cmd = { "sql-language-server", "up", "--method", "stdio" }, -- Asegura que el server inicie correctamente
			filetypes = { "sql", "mysql", "plsql" }, -- Asegura compatibilidad con SQL y variantes
			root_dir = util.root_pattern(".sqllsrc.json", "sqlconfig.json", ".git"),
			-- settings = {
			-- 	sqlLanguageServer = {
			-- 		connections = {
			-- 			{
			-- 				driver = "sqlite",
			-- 				dataSourceName = "file:./database.sqlite3",
			-- 			},
			-- 			{
			-- 				driver = "postgresql",
			-- 				dataSourceName = "postgres://usuario:contraseña@localhost:5432/mi_basedatos",
			-- 			},
			-- 			{
			-- 				driver = "mysql",
			-- 				dataSourceName = "usuario:contraseña@tcp(127.0.0.1:3306)/mi_basedatos",
			-- 			},
			-- 		},
			-- 	},
			-- },
		})

		-- JAVA
		--[[ require("lspconfig").jdtls.setup({ ]]
		--[[ 	on_attach = on_attach, ]]
		--[[ 	capabilities = capabilities, ]]
		--[[ }) ]]

		-- TS
		require("lspconfig").ts_ls.setup({
			on_attach = on_attach,
			capabilities = capabilities,
		})

		-- CSS
		require("lspconfig").cssls.setup({
			on_attach = on_attach,
			capabilities = capabilities,
		})

		-- Tailwind
		require("lspconfig").tailwindcss.setup({
			on_attach = on_attach,
			capabilities = capabilities,
		})

		-- Html
		require("lspconfig").html.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			cmd = { "vscode-html-language-server", "--stdio" },
			filetypes = { "html", "templ" },
			init_options = {
				configurationSection = { "html", "css", "javascript" },
				embeddedLanguages = {
					css = true,
					javascript = true,
				},
				provideFormatter = true,
			},
		})

		-- Emmet
		require("lspconfig").emmet_ls.setup({
			on_attach = on_attach,
			capabilities = capabilities,
		})

		-- Prisma
		require("lspconfig").prismals.setup({
			on_attach = on_attach,
			capabilities = capabilities,
		})

		-- Bash
		require("lspconfig").bashls.setup({
			on_attach = on_attach,
			capabilities = capabilities,
		})

		-- Python
		require("lspconfig").pyright.setup({
			on_attach = on_attach,
			capabilities = capabilities,
		})

		-- Rust
		require("lspconfig").rust_analyzer.setup({
			on_attach = on_attach,
			capabilities = capabilities,
		})

		-- C
		require("lspconfig").clangd.setup({
			on_attach = on_attach,
			capabilities = capabilities,
        })
	end,
}
