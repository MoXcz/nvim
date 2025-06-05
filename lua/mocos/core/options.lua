local set = vim.opt

-- Set leader key to <space>
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

set.number = true
set.relativenumber = true

-- Set to false if there is not a nerd font installed
vim.g.have_nerd_font = true

set.mouse = 'a' -- Enable mouse mode

-- Change netrw style
-- vim.cmd("let g:netrw_liststyle = 3")

-- To share clipboard between nvim and system
-- (unnamedplus is the name of the register for the system clipboard)
-- set.clipboard = "unnamedplus";

set.expandtab = true -- Use spaces instead of tabs
set.tabstop = 2      -- set tab width (spaces)
set.softtabstop = 2  -- editing operations width
set.shiftwidth = 2   -- Indentation width

-- edit virtual space at the end of the line (useful for line block mode when editing multiple lines)
set.virtualedit = 'block'

-- Indent based on previous indentation level smartly
set.autoindent = true
set.smartindent = true

-- For notes, it allows long lines of characters to be correctly displayed on screen
set.wrap = true
set.breakindent = true
set.linebreak = true

-- Avoid backups
set.swapfile = false
set.backup = false

-- Get access to long running undoes
set.undodir = os.getenv('HOME') .. '/.vim/undodir'
set.undofile = true

-- Disable dangling highlights
set.hlsearch = false
set.incsearch = true

-- Enable 24-bit RGB colors
set.termguicolors = true

-- The screen will move with set lines of space
set.scrolloff = 10

-- To see marks (errors, linting)
set.signcolumn = 'yes'
set.isfname:append('@-@')

-- Snappier markers update (decrease update time)
set.updatetime = 250

-- Decrease mapped sequence wait time
set.timeoutlen = 500

-- Turn the guide column at 80 characters
set.colorcolumn = '80'
set.cursorline = false

-- See difference between spaces, tabs and whitespaces
set.list = true
set.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

set.path:append('**')

set.spelllang = 'en_us'

-- Deactivate default mode status
set.showmode = false

-- Case insensitive search unless it has one or more capital letters in the search term
set.ignorecase = true
set.smartcase = true
set.inccommand = 'split' -- Preview substitutions live inside a split

-- Splits now open below/right the current window
set.splitbelow = true
set.splitright = true

vim.diagnostic.config({
  virtual_text = true, -- Show diagnostics inline
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    border = "rounded",
    source = true,
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "󰅚 ",
      [vim.diagnostic.severity.WARN] = "󰀪 ",
      [vim.diagnostic.severity.INFO] = "󰋽 ",
      [vim.diagnostic.severity.HINT] = "󰌶 ",
    },
    numhl = {
      [vim.diagnostic.severity.ERROR] = "ErrorMsg",
      [vim.diagnostic.severity.WARN] = "WarningMsg",
    },
  },
})
