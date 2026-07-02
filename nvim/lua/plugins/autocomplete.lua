vim.pack.add { { src = gh 'L3MON4D3/LuaSnip', version = vim.version.range '2.*' } }
require('luasnip').setup {}

vim.pack.add { { src = gh 'saghen/blink.cmp', version = vim.version.range '1.*' } }

require('blink.cmp').setup {
  keymap = {
    preset = 'enter',
  },

  appearance = {
    nerd_font_variant = 'mono',
  },

  completion = {
    accept = {
      auto_brackets = {
        enabled = true,
      },
    },

    documentation = {
      auto_show = true,
      auto_show_delay_ms = 500,
    },
  },

  sources = {
    default = { 'lsp', 'path', 'snippets', 'buffer' },
  },

  snippets = {
    preset = 'luasnip',
  },

  fuzzy = {
    implementation = 'lua',
  },

  signature = {
    enabled = true,
  },
}
