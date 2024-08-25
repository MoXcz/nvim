return {
  "hrsh7th/nvim-cmp",
  -- To load autocompletion in insert mode
  event = "InsertEnter",
  dependencies = {
    -- Source for text in buffer
    "hrsh7th/cmp-buffer",
    -- Source for file system paths
    "hrsh7th/cmp-path",
    {
      "L3MON4D3/LuaSnip",
      version = "v2.*",
      build = "make install_jsregexp",
    },
    -- For autocompletion
    "saadparwaiz1/cmp_luasnip",
    "rafamadriz/friendly-snippets",
    -- vs-code like pictograms for autocompletions
    "onsails/lspkind.nvim",
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local lspkind = require("lspkind")

    -- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
    require("luasnip.loaders.from_vscode").lazy_load()

    cmp.setup({
      completion = {
        -- To show autocompletions with a preview and a menu
        completeopt = "menu,menuone,preview,noselect",
      },
      -- Configure how nvim-cmp interacts with snippet engine
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        -- Close autocompletions
        ["<C-e>"] = cmp.mapping.abort(),
        -- "<CR>" or "<C-y>". Enter for commodity
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
      }),

      -- configure lspkind for vs-code like pictograms in completion menu
      formatting = {
        format = lspkind.cmp_format({
          maxwidth = 50,
          ellipsis_char = "...",
        }),
      },
    })
  end,
}
