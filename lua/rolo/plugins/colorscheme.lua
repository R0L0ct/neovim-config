return {
	"rose-pine/neovim",
	priority = 1000,
    config = function()
        function ColorMyPencils()
            vim.cmd("colorscheme rose-pine")

            vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
            vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

            require("rose-pine").setup({
                disable_background = true,
            })
        end

        ColorMyPencils()
    end,
}
