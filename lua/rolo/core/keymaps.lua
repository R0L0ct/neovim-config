vim.g.mapleader = " "

local keymap = vim.keymap

--[[ Evitar pegar algo al presionar leader + p sin querer ]]
keymap.set("n", "<leader>p", "<Nop>", { noremap = true, silent = true })

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })
--[[ keymap.set("n", "<leader>pv", vim.cmd.Ex) ]]
keymap.set("n", "<leader>pv", "<CMD>Oil<CR>", { desc = "Open parent directory" })

--[[ keymap.set( ]]
--[[ 	"n", ]]
--[[ 	"<leader>bq", ]]
--[[ 	":lua require('rolo.utils.buffers').close_other_buffers()<CR>", ]]
--[[ 	{ noremap = true, silent = true } ]]
--[[ ) ]]

-- Delete all buffers but the current one
keymap.set(
	"n",
	"<leader>bq",
	'<Esc>:%bdelete|edit #|normal`"<Return>',
	{ desc = "Delete other buffers but the current one" }
)

-- Splits

keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

keymap.set("n", "<C-h>", "<C-w>h")
keymap.set("n", "<C-j>", "<C-w>j")
keymap.set("n", "<C-k>", "<C-w>k")
keymap.set("n", "<C-l>", "<C-w>l")

keymap.set("n", "<leader>sr", "<C-w>r", { desc = "Rotate splits" })
keymap.set("n", "<leader>sV", "<C-w>t<C-w>H", { desc = "Make horizontal split vertical" })
keymap.set("n", "<leader>sH", "<C-w>t<C-w>K", { desc = "Make vertical split horizontal" })

keymap.set("n", "<A-Left>",  ":vertical resize -5<CR>", { desc = "Shrink width" })
keymap.set("n", "<A-Right>", ":vertical resize +5<CR>", { desc = "Increase width" })
keymap.set("n", "<A-Up>",    ":resize -2<CR>", { desc = "Shrink height" })
keymap.set("n", "<A-Down>",  ":resize +2<CR>", { desc = "Increase height" })

keymap.set("n", "<A-h>", "<C-w>H", { desc = "Move split to left" })
keymap.set("n", "<A-j>", "<C-w>J", { desc = "Move split to bottom" })
keymap.set("n", "<A-k>", "<C-w>K", { desc = "Move split to top" })
keymap.set("n", "<A-l>", "<C-w>L", { desc = "Move split to right" })

-- Auto-resize cuando cambia el tamaño de la ventana
vim.api.nvim_create_autocmd("VimResized", {
  command = "wincmd =",
})

-- Terminal
local opts = { noremap = true, silent = true }
keymap.set("t", "<Esc>", [[<C-\><C-n>]], { noremap = true }) -- Salir de la term

-- Moverse entre splits en modo term
keymap.set("t", "<M-h>", [[<C-\><C-n><C-w>h]], opts)
keymap.set("t", "<M-j>", [[<C-\><C-n><C-w>j]], opts)
keymap.set("t", "<M-k>", [[<C-\><C-n><C-w>k]], opts)
keymap.set("t", "<M-l>", [[<C-\><C-n><C-w>l]], opts)

-- Scroll
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")

-- DiffView
keymap.set("n", "<leader>do", "<cmd>DiffviewOpen<CR>", { desc = "Open Diffview" })
keymap.set("n", "<leader>dc", "<cmd>DiffviewClose<CR>", { desc = "Close Diffview" })

-- Open .env
vim.keymap.set("n", "<leader>oe", function()
  local root = vim.fn.system("git rev-parse --show-toplevel"):gsub("\n", "")
  vim.cmd("edit " .. root .. "/.env")
end, { desc = "Abrir .env del proyecto" })

