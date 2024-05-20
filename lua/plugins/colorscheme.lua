return {
  {
    "mcchrish/zenbones.nvim",
    priority = 1000,
    dependencies = {
      "rktjmp/lush.nvim",
    },
    -- init = function()
    --   vim.g.melange_enable_font_variants = 0
    --
    --   require "lush"
    --   require("melange.build").build()
    --
    --   vim.cmd "colorscheme melange"
    --
    --   vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    --   vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    -- end,
    config = function()
      vim.cmd "colorscheme zenbones"

      vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    end,
  },
}
