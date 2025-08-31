return {
  "nvim-mini/mini.nvim",
  version = "*",
    config = function()
      require("mini.pick").setup()
      require("mini.surround").setup()
    end,
}
