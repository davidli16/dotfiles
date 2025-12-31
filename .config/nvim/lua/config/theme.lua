-- ===============================================================
-- Theme & UI tweaks
-- ===============================================================

-- -----------------------------------------------------------------
-- Colorscheme
-- -----------------------------------------------------------------
vim.cmd("colorscheme jellybeans")

-- -----------------------------------------------------------------
-- Transparent backgrounds
-- -----------------------------------------------------------------
local function clear_backgrounds()
  local groups = {
    "Normal",
    "NonText",
    "LineNr",
    "SignColumn",
    "CursorLine",
    "Folded",
    "ColorColumn",
    "VertSplit",
  }

  for _, group in ipairs(groups) do
    vim.api.nvim_set_hl(0, group, { bg = "none" })
  end

  vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#1c1c1c" })
  vim.api.nvim_set_hl(0, "VertSplit", { bg = "#3a3a3a" })
end

clear_backgrounds()
