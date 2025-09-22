return {
  "vim-test/vim-test",
  dependencies = {
    "preservim/vimux",
  },
  init = function()
    vim.g["test#strategy"] = "dispatch"
    vim.g["test#csharp#runner"] = "dotnettest"
  end,
  keys = {
    { "<leader>t", desc = "Run Tests" },
    { "<leader>tt", "<cmd>TestNearest | copen<CR>", desc = "Test Nearest" },
    { "<leader>tT", "<cmd>TestFile | copen<CR>", desc = "Test File" },
    { "<leader>ta", "<cmd>TestSuite<CR>", desc = "Test Suite" },
    { "<leader>tl", "<cmd>TestLast<CR>", desc = "Test Last" },
    { "<leader>tg", "<cmd>TestVisit<CR>", desc = "Test Visit" },
  },
}
