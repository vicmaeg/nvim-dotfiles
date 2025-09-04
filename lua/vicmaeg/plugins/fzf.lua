return {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  dependencies = { "echasnovski/mini.icons" },
  opts = {},
  keys = {
    {
      "<leader>fz",
      function()
        require("fzf-lua").builtin()
      end,
      desc = "Fzf lua builtin commands",
    },
  },
}
