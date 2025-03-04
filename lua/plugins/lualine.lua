return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function()
      return {
        options = {
          theme = "onedark",
          globalstatus = true,
          section_separators = { left = "", right = "" },
          component_separators = { left = "", right = "" },
          disabled_filetypes = { "dashboard", "NvimTree", "alpha" },
        },
        sections = {
          lualine_a = { { "mode", icon = "", upper = true } },
          lualine_b = { { "branch", icon = "" }, "diff", "diagnostics" },
          lualine_c = { { "filename", path = 1, symbols = { modified = " ●", readonly = " " } } },
          lualine_x = { "encoding", "fileformat", "filetype" },
          lualine_y = { { "progress", separator = " ", padding = { left = 1, right = 1 } } },
          lualine_z = { { "location", icon = "" } },
        },
      }
    end,
  },
}
