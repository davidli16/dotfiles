vim.g.mapleader = ","
vim.g.maplocalleader = ","

local opt = vim.opt

opt.autoindent = true
opt.autoread = true
opt.backup = false
opt.writebackup = false
opt.swapfile = false
opt.number = true
opt.relativenumber = true
opt.ruler = true
opt.pastetoggle = "<F8>"
opt.lazyredraw = true
opt.backspace = { "indent", "eol", "start" }
opt.colorcolumn = "81"
opt.completeopt = { "menuone", "noselect" }
opt.laststatus = 3
opt.list = true
opt.listchars = { tab = "·-", trail = "-" }
opt.matchtime = 5
opt.startofline = false
opt.scrolloff = 5
opt.showcmd = true
opt.sidescrolloff = 5
opt.splitbelow = true
opt.splitright = true
opt.wildmenu = true
opt.hidden = true
opt.foldenable = false
opt.gdefault = true
opt.hlsearch = true
opt.ignorecase = true
opt.incsearch = true
opt.showmatch = true
opt.smartcase = true
opt.undodir = "/tmp"
opt.undofile = true
opt.smartindent = true
opt.expandtab = true
opt.wrap = false
opt.shiftwidth = 4
opt.softtabstop = 4
opt.tabstop = 4
opt.encoding = "utf-8"
opt.wildignore:append({ "*.pyc", "*/out/*", "*/build/*", "*/tmp/*", "*.so", "*.swp", "*.zip", "*\\tmp\\*", "*.exe", "*/node_modules/*" })
opt.fillchars:append({ vert = " " })
opt.termguicolors = true
opt.signcolumn = "yes"

vim.keymap.set("n", "<space>", ":", { noremap = true, silent = false })
vim.keymap.set("i", "jk", "<Esc>", { noremap = true })
vim.keymap.set("n", "/", "/\\v", { noremap = true })
vim.keymap.set("v", "/", "/\\v", { noremap = true })
vim.keymap.set({ "n", "v" }, "<tab>", "%", { noremap = true })
vim.keymap.set("n", "<leader>W", ":%s/\\s\\+$//<cr>:let @/=''<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader><space>", ":noh<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<up>", "<nop>", { noremap = true })
vim.keymap.set("n", "<down>", "<nop>", { noremap = true })
vim.keymap.set("n", "<left>", "<nop>", { noremap = true })
vim.keymap.set("n", "<right>", "<nop>", { noremap = true })

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {
    "nanotech/jellybeans.vim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("jellybeans")
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          theme = "auto",
          section_separators = "",
          component_separators = "",
        },
      })
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup({
        defaults = {
          layout_strategy = "horizontal",
          layout_config = { prompt_position = "bottom" },
          sorting_strategy = "ascending",
        },
      })
    end,
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    config = function()
      require("telescope").load_extension("fzf")
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end,
  },
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup()
    end,
  },
  {
    "kylechui/nvim-surround",
    version = "*",
    config = function()
      require("nvim-surround").setup()
    end,
  },
  { "mbbill/undotree" },
  { "sitiom/nvim-numbertoggle" },
  {
    "klen/nvim-config-local",
    config = function()
      require("config-local").setup()
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "rafamadriz/friendly-snippets",
      "zbirenbaum/copilot-cmp",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        sources = {
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "copilot" },
          { name = "buffer" },
          { name = "path" },
        },
      })
    end,
  },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    config = function()
      require("copilot").setup({
        suggestion = { enabled = true },
        panel = { enabled = false },
      })
    end,
  },
  {
    "zbirenbaum/copilot-cmp",
    config = function()
      require("copilot_cmp").setup()
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      require("mason").setup()
      require("mason-lspconfig").setup({
        automatic_installation = true,
      })

      require("mason-lspconfig").setup_handlers({
        function(server_name)
          lspconfig[server_name].setup({
            capabilities = capabilities,
          })
        end,
      })
    end,
  },
})

vim.keymap.set("n", "\\", require("telescope.builtin").find_files, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>f", require("telescope.builtin").oldfiles, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>s", require("telescope.builtin").live_grep, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>b", require("telescope.builtin").buffers, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { noremap = true, silent = true })

vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NonText", { bg = "none" })
vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })
vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
vim.api.nvim_set_hl(0, "CursorLine", { bg = "none" })
vim.api.nvim_set_hl(0, "Folded", { bg = "none" })
vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#1c1c1c" })
vim.api.nvim_set_hl(0, "VertSplit", { bg = "#3a3a3a" })
