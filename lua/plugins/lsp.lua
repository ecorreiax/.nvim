return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "williamboman/mason.nvim", config = true },
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",

      { "j-hui/fidget.nvim", opts = {} },

      { "folke/neodev.nvim", opts = {} },
    },
    config = function()
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
        callback = function(e)
          local opts = { buffer = e.buf }
          vim.keymap.set("n", "gd", function()
            vim.lsp.buf.definition()
          end, opts)
          vim.keymap.set("n", "K", function()
            vim.lsp.buf.hover()
          end, opts)
          vim.keymap.set("n", "[d", function()
            vim.diagnostic.goto_next()
          end, opts)
          vim.keymap.set("n", "]d", function()
            vim.diagnostic.goto_prev()
          end, opts)
          vim.keymap.set("n", "<leader>ca", function()
            vim.lsp.buf.code_action()
          end, opts)
          vim.keymap.set("n", "<leader>rr", function()
            vim.lsp.buf.references()
          end, opts)
          vim.keymap.set("n", "<leader>rn", function()
            vim.lsp.buf.rename()
          end, opts)
        end,
      })

      vim.api.nvim_create_autocmd("LspDetach", {
        group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
        callback = function(event)
          vim.lsp.buf.clear_references()
          vim.api.nvim_clear_autocmds { group = "kickstart-lsp-highlight", buffer = event.buf }
        end,
      })

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

      local servers = {
        gopls = {},
        stylua = {},
        tsserver = {},
        solargraph = {},
        rubocop = {},
        emmet_language_server = {},
        tailwindcss = {},

        lua_ls = {
          settings = {
            Lua = {
              completion = {
                callSnippet = "Replace",
              },
              diagnostics = {
                globals = { "vim" },
                disable = { "missing-fields" },
              },
            },
          },
        },
      }

      require("mason").setup()

      local ensure_installed = vim.tbl_keys(servers or {})
      vim.list_extend(ensure_installed, {
        "stylua",
      })
      require("mason-tool-installer").setup { ensure_installed = ensure_installed }

      require("mason-lspconfig").setup {
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}
            server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
            require("lspconfig")[server_name].setup(server)
          end,
        },
      }
    end,
  },
}
