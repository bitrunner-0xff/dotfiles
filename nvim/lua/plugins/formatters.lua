return {
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        -- FORMATTERS
        "stylua", -- Lua
        "shfmt", -- Shell
        "black", -- Python
        "isort", -- Python import sorter
        "markdownlint-cli2", -- Markdown linter
        "clang-format", -- C/C++
      },
    },
  },

  {

    "stevearc/conform.nvim",
    opts = {
      default_format_opts = {
        timeout_ms = 3000,
        async = false, -- not recommended to change
        quiet = false, -- not recommended to change
        lsp_format = "fallback", -- not recommended to change
      },
      formatters = {
        injected = { options = { ignore_errors = true } },
      },
      formatters_by_ft = {
        lua = { "stylua" },
        sh = { "shfmt" },
        python = { "isort", "black" },
        cpp = { "clang-format" },
        markdown = { "markdownlint-cli2" },
      },
    },
  },
}
