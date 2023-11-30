-- nvim-cmp setup
local cmp = require 'cmp'
local luasnip = require 'luasnip'
require('luasnip.loaders.from_vscode').lazy_load()
luasnip.config.setup {}

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  completion = {
    completeopt = 'menu,menuone,noinsert',
  },
  mapping = cmp.mapping.preset.insert {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_locally_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.locally_jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  },
  sources =cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'codeium' },
    { name = 'otter' },
    { name = 'luasnip',  keyword_length = 3, max_item_count = 3 },
    { name = 'path' },
    { name = 'buffer' },
    { name = 'pandoc_references' },
    { name = 'calc' },
    { name = 'latex_symbols' },
    { name = 'emoji' },
  }),
  view = {
    entries = "native",
  },
  window = {
    documentation = {
      border = "rounded",
    },
  },
}

-- for custom snippets
require("luasnip.loaders.from_vscode").lazy_load({ paths = { vim.fn.stdpath("config") .. "/snips" } })
-- link quarto and rmarkdown to markdown snippets
luasnip.filetype_extend("quarto", { "markdown" })
luasnip.filetype_extend("rmarkdown", { "markdown" })

