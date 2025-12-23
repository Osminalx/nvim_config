-- Desactivar específicamente los plugins .NET de LazyVim
return {
  -- Desactivar neotest-vstest
  { "nvim-neotest/neotest-vstest", enabled = false },

  -- Desactivar omnisharp-extended-lsp
  { "Hoffs/omnisharp-extended-lsp.nvim", enabled = false },

  -- Desactivar el extra de .NET de LazyVim
  { import = "lazyvim.plugins.extras.lang.dotnet", enabled = false },
}