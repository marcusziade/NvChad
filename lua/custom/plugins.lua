local plugins = {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "gopls",
        "rust_analyzer",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    ft = "go",
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },
  {
    "olexsmir/gopher.nvim",
    ft = "go",
    config = function(_, opts)
      require("gopher").setup(opts)
      require("core.utils").load_mappings("gopher")
    end,
    build = function()
      vim.cmd [[silent! GoInstallDeps]]
    end,
  },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    lazy = false,
    event = "InsertEnter",
    config = function()
      require("copilot").setup {
        auto_trigger = true,
        suggestion = {
          auto_trigger = true,
          enabled = true,
          keymap = {
            accept = "¬",
            next = "˜",
            prev = "π",
          }
        },
        debounce = 30,
        auto_refresh = true,
      }
    end,
  },
}
return plugins
