vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
	callback = function(event)
		local map = function(keys, func, desc)
			vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
		end

		map("gD", vim.lsp.buf.declaration, "Goto Declaration")
		map("gd", vim.lsp.buf.definition, "Goto Definition")
		map("K", vim.lsp.buf.hover, "Hover")
		map("<leader>vws", vim.lsp.buf.workspace_symbol, "workspace_symbol")
		map("<leader>vca", vim.lsp.buf.code_action, "Code Action")
		map("<leader>vrr", vim.lsp.buf.references, "References")
		map("<leader>vrn", vim.lsp.buf.rename, "Rename")
		map("<leader>gi", vim.lsp.buf.implementation, "Implementation")
		map("<leader>si", vim.lsp.buf.signature_help, "Signature Help")
		map("<leader>vd", vim.diagnostic.open_float, "Open Float")
		map("[d", vim.diagnostic.get_prev, "Goto Prev Diagnostic")
		map("]d", vim.diagnostic.get_next, "Goto Next Diagnostic")
		map("<leader>q", vim.diagnostic.setloclist, "SetLocList")
		-- vim.keymap.set('n', '<leader>f', function()
		--     vim.lsp.buf.format { async = true }
		-- end, opts)

		local client = vim.lsp.get_client_by_id(event.data.client_id)
		if client and client.server_capabilities.documentHighlightProvider then
			local highlight_augroup = vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })
			vim.api.nvim_create_autocmd("CursorHold", {
				buffer = event.buf,
				group = highlight_augroup,
				callback = function()
					vim.lsp.buf.document_highlight()
				end,
			})

			vim.api.nvim_create_autocmd("CursorMoved", {
				buffer = event.buf,
				group = highlight_augroup,
				callback = function()
					vim.lsp.buf.clear_references()
				end,
			})

			vim.api.nvim_create_autocmd("LspDetach", {
				group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
				callback = function(event2)
					vim.lsp.buf.clear_references()
					vim.api.nvim_clear_autocmds({ group = "kickstart-lsp-highlight", buffer = event2.buf })
				end,
			})
		end

		if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
			map("<leader>th", function()
				vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
			end, "Toggle Inlay Hints")
		end
	end,
})

vim.lsp.config("*", {
	capabilities = require("blink.cmp").get_lsp_capabilities(),
})

vim.lsp.enable({
	"lua_ls",
	"ts_ls",
	"angularls",
	"bashls",
	"pylsp",
	"clangd",
	"cssls",
	"html",
	"emmet_ls",
	"prismals",
	"rust_analyzer",
	"tailwindcss",
})
