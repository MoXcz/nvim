local set = vim.opt

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
})

-- Set leader key to <space>
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

set.number = true
set.relativenumber = true
-- Set to false if there is not a nerd font installed
vim.g.have_nerd_font = true
-- Enable mouse mode
set.mouse = 'a'

-- Change netrw style
-- vim.cmd("let g:netrw_liststyle = 3")

-- To share clipboard between nvim and system (not recommended, use xclip instead)
-- set.clipboard = "unnamedplus";

-- Use 2 spaces instead of tabs and respect indentation
set.tabstop = 2
set.softtabstop = 2
set.shiftwidth = 2
set.expandtab = true
set.autoindent = true
set.smartindent = true

-- For notes,it allows long lines of characters to be correctly displayed on screen
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

-- The screen will move with 8 lines of space
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

-- See difference between spaces, tabs and whitespaces
set.list = true
set.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live inside a split
set.inccommand = 'split'

set.cursorline = false

set.path:append('**')

set.spelllang = 'en_us'
set.spell = false

-- Deactivate default mode status
set.showmode = false

-- Case insensitive search unless it has one or more capital letters in the search term
set.ignorecase = true
set.smartcase = true
