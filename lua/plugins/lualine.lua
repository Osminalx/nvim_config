return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function()
      local function recording_macro()
        local reg = vim.fn.reg_recording()
        if reg ~= "" then
          return "雷 " .. reg
        end
        return ""
      end

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
          lualine_z = {
            { "location", icon = "" },
            {
              recording_macro,
              cond = function()
                return vim.fn.reg_recording() ~= ""
              end,
              color = {
                gui = "bold",
              },
            },
          },
        },
      }
    end,
  },
}
