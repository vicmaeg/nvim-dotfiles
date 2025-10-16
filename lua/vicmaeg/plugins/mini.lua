return {
  "nvim-mini/mini.nvim",
  version = false,
  config = function()

    vim.cmd('colorscheme miniwinter')

    require("mini.extra").setup()
    require("mini.pick").setup()
    require("mini.statusline").setup()
    require("mini.surround").setup()
    require("mini.move").setup()
    require("mini.starter").setup()
    require('mini.bufremove').setup()
    require("mini.files").setup({ windows = { preview = true } })
  end,
}
