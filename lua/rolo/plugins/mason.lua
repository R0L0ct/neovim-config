return {
  "williamboman/mason.nvim",
  dependencies = "williamboman/mason-lspconfig.nvim",
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")

    mason.setup()

    mason_lspconfig.setup({
      ensure_installed = {
        "tsserver",
        "html",
        "cssls",
        "tailwindcss",
        "lua_ls",
        "emmet_ls",
        "prismals",
        "pyright",
        "bashls",
      },
      automatic_installation = true,
    })
  end,
}
