-- Desactivar el extra de .NET de LazyVim para que no instale herramientas de .NET
return {
  -- Desactivar el extra de .NET que carga automáticamente herramientas de C# y F#
  { import = "lazyvim.plugins.extras.lang.dotnet", enabled = false },
}