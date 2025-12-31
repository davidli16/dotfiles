-- ===============================================================
-- Plugins (lazy.nvim)
-- ===============================================================

require("lazy").setup({
  -- -----------------------------------------------------------------
  -- UI / Appearance
  -- -----------------------------------------------------------------
  { "nanotech/jellybeans.vim", lazy = false, priority = 1000 },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        theme = "auto",
        section_separators = "",
        component_separators = "",
      },
    },
  },
  { "sitiom/nvim-numbertoggle" },

  -- -----------------------------------------------------------------
  -- Editing helpers
  -- -----------------------------------------------------------------
  { "tpope/vim-dispatch" },
  { "tpope/vim-repeat" },
  { "tpope/vim-surround" },
  { "tpope/vim-fugitive" },
  { "tpope/vim-rhubarb" },
  { "mbbill/undotree" },
  { "windwp/nvim-autopairs", event = "InsertEnter", opts = {} },
  { "numToStr/Comment.nvim", opts = {} },
  {
    "klen/nvim-config-local",
    opts = {
      config_files = { ".nvim.lua", ".nvimrc", ".vimrc" },
    },
  },

  -- -----------------------------------------------------------------
  -- Search / Navigation
  -- -----------------------------------------------------------------
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    config = function()
      local telescope = require("telescope")
      telescope.setup({
        defaults = {
          layout_strategy = "horizontal",
          layout_config = { prompt_position = "top" },
          sorting_strategy = "ascending",
        },
      })
      telescope.load_extension("fzf")
    end,
  },

  -- -----------------------------------------------------------------
  -- Treesitter
  -- -----------------------------------------------------------------
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      highlight = { enable = true },
      indent = { enable = true },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },

  -- -----------------------------------------------------------------
  -- LSP
  -- -----------------------------------------------------------------
  { "neovim/nvim-lspconfig" },
  { "williamboman/mason.nvim", build = ":MasonUpdate", opts = {} },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    opts = {
      automatic_installation = true,
    },
  },

  -- -----------------------------------------------------------------
  -- Copilot
  -- -----------------------------------------------------------------
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
      suggestion = { enabled = true },
      panel = { enabled = true },
    },
  },
})
