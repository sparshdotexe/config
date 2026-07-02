vim.pack.add { gh 'NMAC427/guess-indent.nvim' }
require('guess-indent').setup {}

vim.pack.add { gh 'brenoprata10/nvim-highlight-colors' }
require('nvim-highlight-colors').setup {}

vim.pack.add { gh 'windwp/nvim-autopairs' }
require('nvim-autopairs').setup {}

vim.pack.add { gh 'mrcjkb/rustaceanvim' }

vim.pack.add { gh 'lukas-reineke/indent-blankline.nvim' }
require('ibl').setup {
  indent = {
    char = '│',
  },
  scope = {
    enabled = true,
    show_start = false,
    show_end = false,
  },
}

vim.pack.add { gh 'lewis6991/gitsigns.nvim' }
require('gitsigns').setup {
  signs = {
    add = { text = '+' }, ---@diagnostic disable-line: missing-fields
    change = { text = '~' }, ---@diagnostic disable-line: missing-fields
    delete = { text = '_' }, ---@diagnostic disable-line: missing-fields
    topdelete = { text = '‾' }, ---@diagnostic disable-line: missing-fields
    changedelete = { text = '~' }, ---@diagnostic disable-line: missing-fields
  },
}

vim.pack.add { gh 'folke/which-key.nvim' }
require('which-key').setup {
  delay = 0,
  icons = { mappings = vim.g.have_nerd_font },
  spec = {
    { '<leader>s', group = '[S]earch', mode = { 'n', 'v' } },
    { '<leader>t', group = '[T]oggle' },
    { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
    { 'gr', group = 'LSP Actions', mode = { 'n' } },
  },
}

vim.pack.add { gh 'folke/tokyonight.nvim' }
---@diagnostic disable-next-line: missing-fields
require('tokyonight').setup {
  styles = {
    comments = { italic = false },
  },
  on_highlights = function(hl, c)
    hl.Comment = {
      fg = "#7a88cf",
      italic = false,
    }
  end,
}

vim.pack.add { gh 'sainnhe/everforest' }
vim.g.everforest_background = 'hard'
vim.g.everforest_enable_italic = false
vim.g.everforest_disable_italic_comment = 1
vim.g.everforest_better_performance = 1

vim.cmd.colorscheme('tokyonight-night')

vim.pack.add { gh 'folke/todo-comments.nvim' }
require('todo-comments').setup { signs = false }

vim.pack.add { gh 'nvim-mini/mini.nvim' }

if vim.g.have_nerd_font then
  require('mini.icons').setup()
  MiniIcons.mock_nvim_web_devicons()
end

require('mini.ai').setup {
  mappings = {
    around_next = 'aa',
    inside_next = 'ii',
  },
  n_lines = 500,
}

require('mini.surround').setup()

local statusline = require 'mini.statusline'
statusline.setup { use_icons = vim.g.have_nerd_font }

---@diagnostic disable-next-line: duplicate-set-field
statusline.section_location = function() return '%2l:%-2v' end
