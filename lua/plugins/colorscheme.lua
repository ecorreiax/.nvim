return {
	{
		"metalelf0/jellybeans-nvim",
		priority = 1000,
		dependencies = {
			"rktjmp/lush.nvim",
		},
		init = function()
			vim.cmd("colorscheme jellybeans-nvim")

			vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
			vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
		end,
		-- config = function()
		-- 	-- require("vscode").setup({})
		--
		-- end,
	},
}
