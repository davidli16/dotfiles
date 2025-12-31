-- ===============================================================
-- Keymaps
-- ===============================================================

local map = vim.keymap.set

-- -----------------------------------------------------------------
-- Convenience
-- -----------------------------------------------------------------
map("n", "<space>", ":", { desc = "Command line" })
map("i", "jk", "<esc>", { desc = "Exit insert mode" })
map({ "n", "v" }, "/", "/\\v", { desc = "Very magic search" })
map({ "n", "v" }, "<tab>", "%", { desc = "Match pairs" })
map("n", "<leader>W", ":%s/\\s\\+$//e<cr>:let @/='' <cr>", { desc = "Trim trailing whitespace" })
map("n", "<leader><space>", ":noh<cr>", { desc = "Clear search highlights" })

-- Disable arrow navigation outside insert mode
map("n", "<up>", "<nop>")
map("n", "<down>", "<nop>")
map("n", "<left>", "<nop>")
map("n", "<right>", "<nop>")

-- -----------------------------------------------------------------
-- Telescope
-- -----------------------------------------------------------------
map("n", "\\", function()
  require("telescope.builtin").find_files()
end, { desc = "Find files" })
map("n", "<leader>f", function()
  require("telescope.builtin").oldfiles()
end, { desc = "Recent files" })
map("n", "<leader>s", function()
  require("telescope.builtin").live_grep()
end, { desc = "Search text" })
map("n", "<leader>b", function()
  require("telescope.builtin").buffers()
end, { desc = "Buffers" })

-- -----------------------------------------------------------------
-- Undo tree
-- -----------------------------------------------------------------
map("n", "<leader>u", ":UndotreeToggle<cr>", { desc = "Toggle undo tree" })
