-- To avoid redundancy
local map = vim.keymap.set

-- Directory listing : changed to oil.nvim
-- set("n", "<leader>pd", vim.cmd.Ex)

map('v', '<leader>x', ':.lua<CR>', { desc = 'Execute highlighted' })
map('n', '<leader>x', ':.lua<CR>', { desc = 'Execute the current line' })
map('n', '<leader><leader>x', '<cmd>source %<CR>', { desc = 'Source the current file' })

-- Move between splits using vim motions
map('n', '<C-j>', '<C-w><C-j>')
map('n', '<C-k>', '<C-w><C-k>')
map('n', '<C-l>', '<C-w><C-l>')
map('n', '<C-h>', '<C-w><C-h>')

-- Move highlighted text
map('v', 'J', ":m '>+1<CR>gv=gv")
map('v', 'K', ":m '<-2<CR>gv=gv")

-- Avoid weird J spacing
map('n', 'J', 'mzJ`z')

-- Sets cursor in the middle when half-page jumping and in search terms
map('n', '<C-d>', '<C-d>zz')
map('n', '<C-u>', '<C-u>zz')
map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')

-- Buffer will not hold the deleted item
map('x', '<leader>p', [["_dP]])
map({ 'n', 'v' }, '<leader>dd', [["_d]])

-- Yanking will be saved to system clipboard
map({ 'n', 'v' }, '<leader>y', [["+y]])
map('n', '<leader>Y', [["+Y]])

-- Format code : Changed to Conform
-- vim.keymap.set("n", "<leader>af", vim.lsp.buf.format)

-- Replace current word in all file
map('n', '<leader>ss', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Creates executable file
map('n', '<leader>xc', '<cmd>!chmod +x %<CR>', { silent = true })

-- Execute current file
map('n', '<leader>xx', '<cmd>!bash %<CR>', { silent = true })

-- Create new tmux session using script to fuzzy find directory
map('n', '<C-f>', '<cmd>silent !tmux neww tmux-sessionizer.sh<CR>')

-- To create new tabs
map('n', '<leader>to', '<cmd>tabnew<CR>', { desc = 'Open new tab' })
map('n', '<leader>tx', '<cmd>tabclose<CR>', { desc = 'Close current tab' })
map('n', '<leader>tn', '<cmd>tabn<CR>', { desc = 'Go to next tab' })
map('n', '<leader>tp', '<cmd>tabp<CR>', { desc = 'Go to previous tab' })
map('n', '<leader>tf', '<cmd>tabnew %<CR>', { desc = 'Open current buffer in new tab' })

-- To control the size of splits (width/height)
map('n', '<M-,>', '<c-w>5<')
map('n', '<M-.>', '<c-w>5>')
map('n', '<M-t>', '<C-W>+')
map('n', '<M-s>', '<C-W>-')

map('n', 'Q', '<nop>')
map('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Exit terminal mode
map('t', '<Esc>', '<C-\\><C-n>')

map('n', '<leader>m', '<cmd>make<CR>', { desc = 'Run :make' })

-- local job_id = 0
-- Open a terminal at the bottom of the screen with a fixed height.
map('n', ',st', function()
  vim.cmd.new()
  vim.cmd.wincmd('J')
  vim.api.nvim_win_set_height(0, 12)
  vim.wo.winfixheight = true
  vim.cmd.term()
  vim.cmd.startinsert()

  -- job_id = vim.bo.channel
end)

-- map('n', '<space>cr', function()
--   vim.fn.chansend(job_id, { 'cargo run\r\n' })
-- end)
