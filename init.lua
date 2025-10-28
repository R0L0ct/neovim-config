require("rolo.core")
require("rolo.lazy")
require("rolo.config.lsp")

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local yank_group = augroup("HighlightYank", {})

autocmd("TextYankPost", {
	group = yank_group,
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 40,
		})
	end,
})

-- 🔁 Refrescar automáticamente archivos modificados fuera de Neovim
vim.o.autoread = true

vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
  command = "if mode() != 'c' | checktime | endif",
})

vim.api.nvim_create_autocmd("FileChangedShellPost", {
  callback = function()
    vim.notify("📂 Archivo recargado desde disco", vim.log.levels.INFO, { title = "AutoReload" })
  end,
})

vim.api.nvim_create_autocmd("TermLeave", {
  command = "checktime",
})
