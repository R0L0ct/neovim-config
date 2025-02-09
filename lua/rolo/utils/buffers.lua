local M = {}

M.close_other_buffers = function()
    local current_buf = vim.api.nvim_get_current_buf() -- Obtiene el buffer actual
    local buffers = vim.api.nvim_list_bufs() -- Obtiene la lista de todos los buffers

    for _, buf in ipairs(buffers) do
        if buf ~= current_buf and vim.api.nvim_buf_is_loaded(buf) then
            vim.api.nvim_buf_delete(buf, { force = true }) -- Cierra el buffer si está cargado
        end
    end
end

return M
