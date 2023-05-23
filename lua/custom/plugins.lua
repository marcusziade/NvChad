local plugins = {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "gopls",
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
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        auto_trigger = true,
        debounce = 30,
        auto_refresh = true
      })
      require("copilot.suggestion").is_visible()
      require("copilot.suggestion").accept_word()
      require("copilot.suggestion").accept_line()
      require("copilot.suggestion").next()
      require("copilot.suggestion").prev()
      require("copilot.suggestion").dismiss()
      require("copilot.suggestion").toggle_auto_trigger()
    end,
  },
}
return plugins
