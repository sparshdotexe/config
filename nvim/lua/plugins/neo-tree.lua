-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

vim.pack.add {
  { src = 'https://github.com/nvim-neo-tree/neo-tree.nvim', version = vim.version.range '*' },
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/MunifTanjim/nui.nvim',
}

vim.keymap.set('n', '<leader>e', function()
  require('neo-tree.command').execute { toggle = true, dir = vim.uv.cwd() }
end, { desc = 'Explorer NeoTree (cwd)' })

vim.keymap.set('n', '<leader>ge', function()
  require('neo-tree.command').execute { source = 'git_status', toggle = true }
end, { desc = 'Git Explorer' })

vim.keymap.set('n', '<leader>be', function()
  require('neo-tree.command').execute { source = 'buffers', toggle = true }
end, { desc = 'Buffer Explorer' })

require('neo-tree').setup {
  sources = { 'filesystem', 'buffers', 'git_status' },
  open_files_do_not_replace_types = { 'terminal', 'Trouble', 'trouble', 'qf', 'Outline' },
  filesystem = {
    bind_to_cwd = false,
    follow_current_file = { enabled = true },
    use_libuv_file_watcher = true,
  },
  window = {
  ---@diagnostic disable: assign-type-mismatch
    mappings = {
      ['l'] = 'open',
      ['h'] = 'close_node',
      ['<space>'] = 'none',
      ['Y'] = {
        function(state)
          local node = state.tree:get_node()
          local path = node:get_id()
          vim.fn.setreg('+', path, 'c')
        end,
        desc = 'Copy Path to Clipboard',
      },
      ['O'] = {
        function(state)
          vim.ui.open(state.tree:get_node().path)
        end,
        desc = 'Open with System Application',
      },
      ['P'] = { 'toggle_preview', config = { use_float = false } },
    },
    ---@diagnostic disable: assign-type-mismatch
  },
  default_component_configs = {
    indent = {
      with_expanders = true,
      expander_collapsed = '',
      expander_expanded = '',
      expander_highlight = 'NeoTreeExpander',
    },
    git_status = {
      symbols = {
        unstaged = '󰄱',
        staged = '󰱒',
      },
    },
  },
}
