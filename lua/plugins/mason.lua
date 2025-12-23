return {
  "mason-org/mason.nvim",
  opts = {
    -- Solo instalar herramientas que realmente usamos
    ensure_installed = {
      "stylua", -- Lua formatter
      "shellcheck", -- Shell script linter
      "shfmt", -- Shell script formatter
      "flake8", -- Python linter
      "black", -- Python formatter
      "pylint", -- Python linter
      "prettier", -- Web/formatter general
      "eslint_d", -- JavaScript/TypeScript linter
    },
    -- Desactivar instalación automática para tener control total
    automatic_installation = false,
  },
}