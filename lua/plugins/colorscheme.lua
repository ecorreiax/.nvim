return {
	{
		"Mofiqul/vscode.nvim",
		priority = 1000,
		config = function()
			require("vscode").setup({})

			vim.cmd("colorscheme vscode")

			vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
			vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
		end,
	},
}
