return {
  {
    "savq/melange-nvim",
    priority = 1000,
    dependencies = {
      "rktjmp/lush.nvim",
    },
    init = function()
      vim.cmd "colorscheme melange"

      vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    end,
  },
}
