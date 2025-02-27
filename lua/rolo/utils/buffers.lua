local M = {}

M.close_other_buffers = function()
	local current_buf = vim.api.nvim_get_current_buf() -- Obtiene el buffer actual
	local buffers = vim.api.nvim_list_bufs() -- Obtiene la lista de todos los buffers

	for _, buf in ipairs(buffers) do
		if buf ~= current_buf and vim.api.nvim_buf_is_loaded(buf) then
			if vim.api.nvim_buf_get_option(buf, "modified") then
				local choice =
					vim.fn.confirm("Buffer " .. buf .. " tiene cambios sin guardar. ¿Cerrar?", "&Sí\n&No", 2)
				if choice == 1 then
					vim.api.nvim_buf_delete(buf, { force = true })
				end
			else
				vim.api.nvim_buf_delete(buf, { force = true })
			end
		end
	end
end

return M
