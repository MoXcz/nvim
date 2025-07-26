return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  opts = {
    bigfile = { enabled = true, notify = true, size = 1.5 * 1024 * 1024 },
    animate = { enabled = false },
    notifier = { enabled = true, tiemout = 3000 },
    notify = { enabled = true },
    quickfile = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
    styles = { notification = { wo = { wrap = true } } },
    toggle = { enabled = true },
    input = { enabled = true },
    indent = { enabled = true },
    picker = { enabled = true, hidden = true },
    explorer = { enabled = true },
    rename = { enabled = true },
    gitbrowse = { enabled = true },
    git = { enabled = true },
    bufdelete = { enabled = true },
    zen = { enabled = false },
    dashboard = {
      enabled = true,
      sections = {
        { section = 'header' },
        { icon = ' ', title = 'Keymaps', section = 'keys', indent = 2, padding = 1 },
        { icon = ' ', title = 'Recent Files', section = 'recent_files', indent = 2, padding = 1 },
        { section = 'startup' },
        function()
          return {
            align = 'center',
            text = 'v' .. vim.version().major .. '.' .. vim.version().minor .. '.' .. vim.version().patch,
            padding = 1,
          }
        end,
      },
    },
  },
  -- stylua: ignore start
  keys = {
    -- Scratch
    { '<leader>R',   function() Snacks.rename.rename_file() end,                             desc = 'Rename File', },
    { '<leader>un',  function() Snacks.notifier.hide() end,                                  desc = 'Dismiss All Notifications', },
    { ']]',          function() Snacks.words.jump(vim.v.count1) end,                         desc = 'Next Reference',               mode = { 'n', 't' }, },
    { '[[',          function() Snacks.words.jump(-vim.v.count1) end,                        desc = 'Prev Reference',               mode = { 'n', 't' }, },
    -- Pickers
    { "<leader>ff",  function() Snacks.picker.files() end,                                   desc = "Find Files" },
    { "<leader>fs",  function() Snacks.picker.grep() end,                                    desc = "Grep" },
    { "<leader>fg",  function() Snacks.picker.grep_word() end,                               desc = "Visual selection or word",     mode = { "n", "x" } },
    { "<leader>fp",  function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
    { "<leader>fd",  function() Snacks.picker.diagnostics() end,                             desc = "Diagnostics" },
    { "<leader>fh",  function() Snacks.picker.help() end,                                    desc = "Help Pages" },
    { "<leader>fc",  function() Snacks.picker.colorschemes() end,                            desc = "Colorschemes" },
    { "<leader>fm",  function() Snacks.picker.man() end,                                     desc = "Man Pages" },
    { "<leader>fk",  function() Snacks.picker.keymaps() end,                                 desc = "Keymaps" },
    { "<leader>fi",  function() Snacks.picker.icons() end,                                   desc = "Icons" },
    { "<leader>fq",  function() Snacks.picker.qflist() end,                                  desc = "Quickfix List" },
    --  Symbols are things like variables, functions, types, etc.
    { "<leader>fS",  function() Snacks.picker.lsp_symbols() end,                             desc = "LSP Symbols" },
    { "<leader>fw",  function() Snacks.picker.lsp_workspace_symbols() end,                   desc = "LSP Workspace Symbols" },
    -- git
    { "<leader>gb",  function() Snacks.picker.git_branches() end,                            desc = "Git Branches" },
    { "<leader>gl",  function() Snacks.picker.git_log() end,                                 desc = "Git Log" },
    { "<leader>gL",  function() Snacks.picker.git_log_line() end,                            desc = "Git Log Line" },
    { "<leader>gf",  function() Snacks.picker.git_log_file() end,                            desc = "Git Log File" },
    { "<leader>gc",  function() Snacks.picker.git_status() end,                              desc = "Git Status" },
    { "<leader>gS",  function() Snacks.picker.git_stash() end,                               desc = "Git Stash" },
    { "<leader>gd",  function() Snacks.picker.git_diff() end,                                desc = "Git Diff (Hunks)" },
    { '<leader>gB',  function() Snacks.gitbrowse() end,                                      desc = 'Git Browse', },
    -- Lazygit
    { '<leader>lgf', function() Snacks.lazygit.log_file() end,                               desc = 'Lazygit Current File History', },
    { '<leader>lgg', function() Snacks.lazygit() end,                                        desc = 'Lazygit', },
    { '<leader>lgl', function() Snacks.lazygit.log() end,                                    desc = 'Lazygit Log (cwd)', },
    -- LSP
    { "gd",          function() Snacks.picker.lsp_definitions() end,                         desc = "Goto Definition" },
    { "gD",          function() Snacks.picker.lsp_declarations() end,                        desc = "Goto Declaration" },
    { "grr",         function() Snacks.picker.lsp_references() end,                          desc = "References" },
    { "gri",         function() Snacks.picker.lsp_implementations() end,                     desc = "Goto Implementation" },
    { "gt",          function() Snacks.picker.lsp_type_definitions() end,                    desc = "Goto T[y]pe Definition" },
    -- Top Pickers & Explorer
    { "<leader>sf",  function() Snacks.picker.smart() end,                                   desc = "Smart Find Files" },
    { "<leader>,",   function() Snacks.picker.buffers() end,                                 desc = "Buffers" },
    { "<leader>:",   function() Snacks.picker.command_history() end,                         desc = "Command History" },
    { "<leader>e",   function() Snacks.explorer() end,                                       desc = "File Explorer" },
    { '<leader>n',   function() Snacks.notifier.show_history() end,                          desc = 'Notification History', },
    -- search
    { '<leader>s"',  function() Snacks.picker.registers() end,                               desc = "Registers" },
    { '<leader>s/',  function() Snacks.picker.search_history() end,                          desc = "Search History" },
    { "<leader>sa",  function() Snacks.picker.autocmds() end,                                desc = "Autocmds" },
    { "<leader>sC",  function() Snacks.picker.commands() end,                                desc = "Commands" },
    { "<leader>sD",  function() Snacks.picker.diagnostics_buffer() end,                      desc = "Buffer Diagnostics" },
    { "<leader>sH",  function() Snacks.picker.highlights() end,                              desc = "Highlights" },
    { "<leader>sj",  function() Snacks.picker.jumps() end,                                   desc = "Jumps" },
    { "<leader>sl",  function() Snacks.picker.loclist() end,                                 desc = "Location List" },
    { "<leader>sm",  function() Snacks.picker.marks() end,                                   desc = "Marks" },
    { "<leader>sp",  function() Snacks.picker.lazy() end,                                    desc = "Search for Plugin Spec" },
    { "<leader>sR",  function() Snacks.picker.resume() end,                                  desc = "Resume" },
    n_esc = { "<esc>", { "cmp_close", "cancel" }, mode = "n", expr = true },
    i_esc = { "<esc>", { "cmp_close", "stopinsert" }, mode = "i", expr = true },
    i_cr = { "<cr>", { "cmp_accept", "confirm" }, mode = "i", expr = true },
    i_tab = { "<tab>", { "cmp_select_next", "cmp" }, mode = "i", expr = true },
    i_ctrl_w = { "<c-w>", "<c-s-w>", mode = "i", expr = true },
    i_up = { "<up>", { "hist_up" }, mode = { "i", "n" } },
    i_down = { "<down>", { "hist_down" }, mode = { "i", "n" } },
    q = "cancel",
  },
  init = function()
    vim.g.autoformat = true
    vim.api.nvim_create_autocmd('User', {
      pattern = 'VeryLazy',
      callback = function()
        -- Setup some globals for debugging (lazy-loaded)
        _G.dd = function(...)
          Snacks.debug.inspect(...)
        end
        _G.bt = function()
          Snacks.debug.backtrace()
        end
        vim.print = _G.dd              -- Override print to use snacks for `:=` command
        vim.g._zen_mode_active = false -- Ensure the variable exists at startup

        -- Create some toggle mappings

        -- From here: https://github.com/stevearc/conform.nvim/issues/192
        Snacks.toggle
            .new({
              id = "Format on Save",
              name = "Format on Save",
              get = function()
                return vim.g.autoformat
              end,
              set = function(_)
                vim.g.autoformat = not vim.g.autoformat
              end,
            })
            :map("<leader>uf")

        Snacks.toggle.option('spell', { name = 'Spelling' }):map('<leader>us')
        Snacks.toggle.option('wrap', { name = 'Wrap' }):map('<leader>uw')
        Snacks.toggle.option('relativenumber', { name = 'Relative Number' }):map('<leader>uL')
        Snacks.toggle.diagnostics():map('<leader>ud')
        Snacks.toggle.line_number():map('<leader>ul')
        Snacks.toggle
            .option('conceallevel', { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 })
            :map('<leader>uc')
        Snacks.toggle.treesitter():map('<leader>uT')
        Snacks.toggle.option('background', { off = 'light', on = 'dark', name = 'Dark Background' }):map('<leader>ub')
        Snacks.toggle.inlay_hints():map('<leader>uh')
        Snacks.toggle
            .new({
              id = "Zen mode",
              name = "Zen mode",
              get = function()
                -- There's no direct getter, but you can track it yourself.
                return vim.g._zen_mode_active
              end,
              set = function(enable)
                if enable then
                  require("zen-mode").open()
                else
                  require("zen-mode").close()
                end
                vim.g._zen_mode_active = enable
              end,
            })
            :map("<leader>uz")
      end,
    })
  end,
}
