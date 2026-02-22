local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  change_detection = {
    notify = false,
    enabled = false,
  },
  ui = {
    icons = vim.g.have_nerd_font and {} or {},
  },
  spec = {
    { import = "mocos.plugins" },
    {
      "rebelot/kanagawa.nvim",
      opts = { compile = true },
      config = function()
        vim.cmd.colorscheme("kanagawa-dragon")
      end,
    },
    { "rose-pine/neovim" },
    { "sainnhe/gruvbox-material" },
    { "catppuccin/nvim",         name = "catppuccin" },

    {
      "folke/todo-comments.nvim",
      event = "VimEnter",
      dependencies = { "nvim-lua/plenary.nvim" },
      opts = { signs = false },
    },
    -- Look at that -> #0a4
    {
      "norcalli/nvim-colorizer.lua",
      config = function()
        require("colorizer").setup()
      end,
    },

    { "folke/zen-mode.nvim" },
    { "folke/twilight.nvim" },

    {
      "mbbill/undotree",
      config = function()
        vim.keymap.set("n", "<leader>fu", vim.cmd.UndotreeToggle, { desc = "Undo history" })
      end,
    },
    {
      "MeanderingProgrammer/render-markdown.nvim",
      dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
    },
    -- LSP defaults
    {
      "neovim/nvim-lspconfig",
    },
    -- LSP information
    {
      "j-hui/fidget.nvim",
      version = "1.6.1",
      opts = {},
    },

    {
      "Wansmer/treesj",
      keys = { "<space>m", "<space>j", "<space>s" },
      dependencies = { "nvim-treesitter/nvim-treesitter" },
      config = function()
        require("treesj").setup()
      end,
    },

    {
      "windwp/nvim-autopairs",
      event = "InsertEnter",
      config = true,
      -- use opts = {} for passing setup options
      -- this is equivalent to setup({}) function
    },
  },
})
