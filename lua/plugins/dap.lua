return {
  -- 1. Configuración base de DAP (compartida)
  {
    "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      -- Configuración común para Rust
      dap.adapters.codelldb = {
        type = "server",
        port = "${port}",
        executable = {
          command = vim.fn.stdpath("data") .. "/mason/bin/codelldb",
          args = { "--port", "${port}" },
        },
      }

      dap.configurations.rust = {
        {
          name = "Launch",
          type = "codelldb",
          request = "launch",
          program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/target/debug/", "file")
          end,
          cwd = "${workspaceFolder}",
          stopOnEntry = false,
        },
      }

      -- Configuración para Dart/Flutter (se agrega sin sobrescribir)
      dap.adapters.dart = {
        type = "executable",
        command = vim.fn.stdpath("data") .. "/mason/bin/dart-debug-adapter",
        args = { "flutter" },
      }

      dap.configurations.dart = {
        {
          type = "dart",
          request = "launch",
          name = "Launch Flutter",
          -- TODO Fix flutter routes
          dartSdkPath = os.getenv("FLUTTER_HOME") .. "/bin/cache/dart-sdk/", -- Ajusta esta ruta
          flutterSdkPath = os.getenv("FLUTTER_HOME") .. "/bin", -- Ajusta esta ruta
          program = "${workspaceFolder}/lib/main.dart",
          cwd = "${workspaceFolder}",
        },
      }

      -- Configuración común de UI
      dap.listeners.before.attach.dapui_config = dapui.open
      dap.listeners.before.launch.dapui_config = dapui.open
      dap.listeners.before.event_terminated.dapui_config = dapui.close
      dap.listeners.before.event_exited.dapui_config = dapui.close
    end,
  },

  -- 2. DAP UI (sin cambios)
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap" },
    config = function()
      require("dapui").setup()
    end,
  },

  -- 3. Flutter Tools (nueva configuración)
  {
    "akinsho/flutter-tools.nvim",
    ft = "dart",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim",
    },
    config = function()
      require("flutter-tools").setup({
        widget_guides = {
          enabled = true,
        },
        dev_log = {
          enabled = true,
          open_cmd = "tabedit",
        },
        lsp = {
          on_attach = require("lvim.lsp").common_on_attach,
          capabilities = require("lvim.lsp").default_capabilities,
        },
      })
    end,
  },

  -- 4. Dart Syntax (nuevo plugin)
  {
    "dart-lang/dart-vim-plugin",
    ft = "dart",
  },

  -- 5. Configuración de Crates (existente)
  {
    "saecki/crates.nvim",
    ft = { "toml" },
    dependencies = { "hrsh7th/nvim-cmp" },
    config = function()
      require("crates").setup({
        completion = {
          cmp = {
            enabled = true,
          },
        },
      })
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "toml",
        callback = function()
          require("cmp").setup({
            sources = {
              { name = "crates" },
            },
          })
        end,
      })
    end,
  },
}
