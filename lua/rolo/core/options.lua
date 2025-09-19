-- vim.cmd("let g:netrw_liststyle = 3")
-- vim.cmd("let g:netrw_banner = 0")

local opt = vim.opt

--[[ opt.guicursor = "sm:block" ]]

opt.relativenumber = true
opt.number = true
opt.mouse= ""

-- tabs & indentation
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true

opt.wrap = false

--search settings
opt.ignorecase = true
opt.smartcase = true

opt.cursorline = true

opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

--backspace
-- opt.backspace = "indent,eol,start"

--clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard

-- split windows
opt.splitright = true
opt.splitbelow = true

opt.scrolloff = 8
opt.hlsearch = false
opt.incsearch = true

opt.updatetime = 50

opt.colorcolumn = "80"
