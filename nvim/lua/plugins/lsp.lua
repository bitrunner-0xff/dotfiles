return {
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {},
    },
  },

  {
    "mason-org/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "jsonls", -- Json
          "yamlls", -- Yaml
          "clangd", -- C/C++
          "helm_ls", -- Helm
          "lua_ls", -- Lua
          "marksman", -- Something about Vim marks
          "dockerls", -- Docker
        },
        automatic_installation = true,
      })
    end,
  },
}
