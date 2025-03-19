-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("i", "jk", "<ESC>", { noremap = true, silent = true })

-- Nvim DAP
vim.keymap.set("n", "<Leader>dl", "<cmd>lua require'dap'.step_into()<CR>", { desc = "Debugger step into" })
vim.keymap.set("n", "<Leader>dj", "<cmd>lua require'dap'.step_over()<CR>", { desc = "Debugger step over" })
vim.keymap.set("n", "<Leader>dk", "<cmd>lua require'dap'.step_out()<CR>", { desc = "Debugger step out" })
vim.keymap.set("n", "<Leader>dc", "<cmd>lua require'dap'.continue()<CR>", { desc = "Debugger continue" })
vim.keymap.set(
  "n",
  "<Leader>db",
  "<cmd>lua require'dap'.toggle_breakpoint()<CR>",
  { desc = "Debugger toggle breakpoint" }
)
vim.keymap.set(
  "n",
  "<Leader>dd",
  "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
  { desc = "Debugger set conditional breakpoint" }
)
vim.keymap.set("n", "<Leader>de", "<cmd>lua require'dap'.terminate()<CR>", { desc = "Debugger reset" })
vim.keymap.set("n", "<Leader>dr", "<cmd>lua require'dap'.run_last()<CR>", { desc = "Debugger run last" })

-- rustaceanvim
vim.keymap.set("n", "<Leader>dt", "<cmd>lua vim.cmd('RustLsp testables')<CR>", { desc = "Debugger testables" })

-- Alt + jk para mover la línea arriba/abajo
vim.keymap.set("n", "<A-j>", ":m .+1<cr>==", { noremap = true, silent = true, desc = "Mover línea abajo" })
vim.keymap.set("n", "<A-k>", ":m .-2<cr>==", { noremap = true, silent = true, desc = "Mover línea arriba" })
vim.keymap.set(
  "i",
  "<A-j>",
  "<Esc>:m .+1<cr>==gi",
  { noremap = true, silent = true, desc = "Mover línea abajo (modo inserción)" }
)
vim.keymap.set(
  "i",
  "<A-k>",
  "<Esc>:m .-2<cr>==gi",
  { noremap = true, silent = true, desc = "Mover línea arriba (modo inserción)" }
)
vim.keymap.set("x", "<A-j>", ":m '>+1<cr>gv=gv", { noremap = true, silent = true, desc = "Mover bloque abajo" })
vim.keymap.set("x", "<A-k>", ":m '<-2<cr>gv=gv", { noremap = true, silent = true, desc = "Mover bloque arriba" })

-- nvim-quotes-rotation
vim.keymap.set("n", "<A-'>", function()
  local quotes = { ['"'] = "'", ["'"] = "`", ["`"] = '"' }
  local line = vim.api.nvim_get_current_line()
  local col = vim.api.nvim_win_get_cursor(0)[2] + 1 -- Columna del cursor (1-based)

  local start_idx, end_idx, quote_char = nil, nil, nil

  -- Buscar todos los pares de comillas y encontrar el que contiene el cursor
  for i = 1, #line do
    local char = line:sub(i, i)
    if quotes[char] then
      local current_quote = char
      local end_pos = line:find(current_quote, i + 1) -- Buscar cierre correspondiente

      if end_pos then
        -- Verificar si el cursor está dentro de este par
        if i <= col and col <= end_pos then
          start_idx = i
          end_idx = end_pos
          quote_char = current_quote
        end
      end
    end
  end

  -- Rotar si encontramos un par válido
  if start_idx and end_idx and start_idx < end_idx then
    local new_quote = quotes[quote_char]
    local new_line = line:sub(1, start_idx - 1)
      .. new_quote
      .. line:sub(start_idx + 1, end_idx - 1)
      .. new_quote
      .. line:sub(end_idx + 1)

    vim.api.nvim_set_current_line(new_line)
  end
end, { noremap = true, silent = true })
