return {
  {
    "NeogitOrg/neogit",
    dependencies = {
	"nvim-lua/plenary.nvim",
	"sindrets/diffview.nvim",
	"ibhagwan/fzf-lua"
    },
    keys = {
	{
		"<leader>gg",
		function()
			require("neogit").open()
		end,
		desc = "Open Neogit"
	}
    }
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
      vim.keymap.set("n", "<leader>ghp", ":Gitsigns preview_hunk<CR>", {})
      vim.keymap.set("n", "<leader>gbt", ":Gitsigns toggle_current_line_blame<CR>", {})
    end,
  },
}
