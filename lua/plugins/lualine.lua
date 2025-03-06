return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function()
      return {
        options = {
          theme = "onedark",
          globalstatus = true,
          section_separators = { left = "", right = "" }, -- NvChad usa estos separadores
          component_separators = { left = "", right = "" },
          disabled_filetypes = { "dashboard", "NvimTree", "alpha" },
        },
        sections = {
          lualine_a = { { "mode", icon = "" } },
          lualine_b = { { "branch", icon = "" }, "diff" },
          lualine_c = { { "filename", path = 1, symbols = { modified = " ●", readonly = " " } } },
          lualine_x = { "diagnostics", "encoding", "fileformat" },
          lualine_y = { "progress" },
          lualine_z = { { "location", icon = "" } },
        },
      }
    end,
  },
}
