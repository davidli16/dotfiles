-- ===============================================================
-- Options
-- ===============================================================

local opt = vim.opt

-- -----------------------------------------------------------------
-- Basic behavior
-- -----------------------------------------------------------------
opt.autoindent = true
opt.autoread = true
opt.backup = false
opt.writebackup = false
opt.swapfile = false
opt.pastetoggle = "<F8>"
opt.lazyredraw = true

-- -----------------------------------------------------------------
-- UI
-- -----------------------------------------------------------------
opt.number = true
opt.relativenumber = true
opt.ruler = true
opt.showcmd = true
opt.laststatus = 2
opt.colorcolumn = "81"
opt.cursorline = false
opt.list = true
opt.listchars = {
  tab = "·-",
  trail = "-",
}
opt.matchtime = 5
opt.startofline = false
opt.scrolloff = 5
opt.sidescrolloff = 5
opt.splitbelow = true
opt.splitright = true
opt.wildmenu = true
opt.hidden = true
opt.fillchars = {
  vert = " ",
}
opt.backspace = { "indent", "eol", "start" }
opt.completeopt = { "longest", "menuone" }

-- -----------------------------------------------------------------
-- Folding
-- -----------------------------------------------------------------
opt.foldenable = false

-- -----------------------------------------------------------------
-- Searching
-- -----------------------------------------------------------------
opt.gdefault = true
opt.hlsearch = true
opt.ignorecase = true
opt.incsearch = true
opt.showmatch = true
opt.smartcase = true

-- -----------------------------------------------------------------
-- History / Undo
-- -----------------------------------------------------------------
local undo_dir = vim.fn.stdpath("state") .. "/undo"
if vim.fn.isdirectory(undo_dir) == 0 then
  vim.fn.mkdir(undo_dir, "p")
end
opt.undodir = undo_dir
opt.undofile = true

-- -----------------------------------------------------------------
-- Text formatting and layout
-- -----------------------------------------------------------------
opt.smartindent = true
opt.expandtab = true
opt.wrap = false
opt.shiftwidth = 4
opt.softtabstop = 4
opt.tabstop = 4
opt.fileencoding = "utf-8"

-- -----------------------------------------------------------------
-- Ignore patterns
-- -----------------------------------------------------------------
opt.wildignore:append({
  "*.pyc",
  "*/out/*",
  "*/build/*",
  "*/tmp/*",
  "*.so",
  "*.swp",
  "*.zip",
  "*\\\\tmp\\\\*",
  "*.exe",
  "*/node_modules/*",
})
