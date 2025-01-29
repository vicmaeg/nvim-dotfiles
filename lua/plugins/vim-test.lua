return {
  "vim-test/vim-test",
  dependencies = {
    "preservim/vimux",
  },
  init = function()
    vim.g["test#csharp#runner"] = "dotnettest"
    vim.g["test#strategy"] = "vimux"
  end,
  keys = {
    { "<leader>t", desc = "Run Tests" },
    { "<leader>tt", "<cmd>TestNearest<CR>", desc = "Test Nearest" },
    { "<leader>tT", "<cmd>TestFile<CR>", desc = "Test File" },
    { "<leader>ta", "<cmd>TestSuite<CR>", desc = "Test Suite" },
    { "<leader>tl", "<cmd>TestLast<CR>", desc = "Test Last" },
    { "<leader>tg", "<cmd>TestVisit<CR>", desc = "Test Visit" },
  },
}
