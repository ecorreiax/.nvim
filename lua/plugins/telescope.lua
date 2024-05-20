return {
  {
    "nvim-telescope/telescope.nvim",
    event = "VimEnter",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        cond = function()
          return vim.fn.executable "make" == 1
        end,
      },
    },
    config = function()
      require("telescope").setup {}

      pcall(require("telescope").load_extension, "fzf")

      local builtin = require "telescope.builtin"
      vim.keymap.set("n", "<leader>sk", builtin.keymaps)
      vim.keymap.set("n", "<leader>ff", builtin.find_files)
      vim.keymap.set("n", "<leader>ss", builtin.builtin)
      vim.keymap.set("n", "<leader>sw", builtin.grep_string)
      vim.keymap.set("n", "<leader>sg", builtin.live_grep)
      vim.keymap.set("n", "<leader>sd", builtin.diagnostics)
      vim.keymap.set("n", "<leader>sr", builtin.resume)
      vim.keymap.set("n", "<leader>s.", builtin.oldfiles)
      vim.keymap.set("n", "<leader><leader>", builtin.buffers)

      vim.keymap.set("n", "<leader>/", function()
        builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown {
          previewer = false,
        })
      end)

      vim.keymap.set("n", "<leader>s/", function()
        builtin.live_grep {
          grep_open_files = true,
          prompt_title = "Live Grep in Open Files",
        }
      end)
    end,
  },
}
