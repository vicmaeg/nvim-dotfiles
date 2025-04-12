return {
  'zk-org/zk-nvim',
  config = function()
    require('zk').setup({
      -- can be 'telescope', 'fzf', 'fzf_lua', 'minipick', or 'select'
      -- it's recommended to use 'telescope', 'fzf', 'fzf_lua', or 'minipick'
      picker = 'snacks_picker',

      lsp = {
        -- `config` is passed to `vim.lsp.start_client(config)`
        config = {
          cmd = { 'zk', 'lsp' },
          name = 'zk',
          -- on_attach = ...
          -- etc, see `:h vim.lsp.start_client()`
        },

        -- automatically attach buffers in a zk notebook that match the given filetypes
        auto_attach = {
          enabled = true,
          filetypes = { 'markdown' },
        },
      },
    })
  end,
  keys = {
    { '<leader>zn',
      function()
	require('zk').new( { title = vim.fn.input('Title: ') })
      end,
      desc = 'zk new'
    },
    { '<leader>zo',
      function()
	require("zk").edit({ sort = {'modified'} })
      end,
      desc = 'zk open'
    }
  },
}
