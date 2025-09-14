return {
  "nvim-mini/mini.nvim",
  version = "*",
  config = function()
    require("mini.pick").setup()
    require("mini.surround").setup()
    require("mini.move").setup()
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
