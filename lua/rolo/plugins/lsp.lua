return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "folke/neodev.nvim",
    },
    config = function()
        vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
        vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
        vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
        vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)
        local on_attach = function(_, bufnr)
            local opts = { buffer = bufnr, noremap = true, silent = true }
            vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
            vim.keymap.set('n', '<leader>vca', vim.lsp.buf.code_action, opts)
            vim.keymap.set('n', '<leader>vrr', vim.lsp.buf.references, opts)
            vim.keymap.set('n', '<leader>vrn', vim.lsp.buf.rename, opts)
            vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
            vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
            vim.keymap.set('n', '<leader>f', function()
                vim.lsp.buf.format { async = true }
            end, opts)

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
        require("neodev").setup()

        -- Lua
        require("lspconfig").lua_ls.setup({
            on_attach = on_attach,
            settings = {
                Lua = {
                    telemetry = { enable = false },
                    workspace = { checkThirdParty = false },

                }
            }
        })

        -- TS
        require("lspconfig").tsserver.setup({
            on_attach = on_attach,
        })

        -- CSS
        require("lspconfig").cssls.setup({
            on_attach = on_attach,
        })

        -- Tailwind
        require("lspconfig").tailwindcss.setup({
            on_attach = on_attach,
        })

        -- Html
        require("lspconfig").html.setup({
            on_attach = on_attach,
        })

        -- Emmet
        require("lspconfig").emmet_ls.setup({
            on_attach = on_attach,
        })

        -- Prisma
        require("lspconfig").prismals.setup({
            on_attach = on_attach,
        })

        -- Bash
        require("lspconfig").bashls.setup({
            on_attach = on_attach,
        })

        -- Python
        require("lspconfig").pyright.setup({
            on_attach = on_attach,
        })
    end
}
