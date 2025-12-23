return {
  "mason-org/mason-lspconfig.nvim",
  opts = {
    -- Solo configurar LSPs que queremos usar
    ensure_installed = {
      "lua_ls",
      "pyright",
      "ts_ls",
      "jsonls",
      "yamlls",
      "html",
      "cssls",
      "eslint",
    },
  },
}

