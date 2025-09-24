return {
  "nvim-mini/mini.nvim",
  version = "*",
  config = function()
    require("mini.pick").setup()
    require("mini.extra").setup()
    require("mini.statusline").setup()
    require("mini.surround").setup()
    require("mini.move").setup()
    require("mini.starter").setup()
    require('mini.bufremove').setup()
    require("mini.files").setup({
      options = {
        use_as_default_explorer = true,
      },
      windows = {
        preview = true,
      },
    })
  end,
}
