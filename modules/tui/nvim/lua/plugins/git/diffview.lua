return {
	"diffview.nvim",

	enabled = function()
		return nixCats.cats.git
	end,

	cmd = {
		"DiffviewOpen",
		"DiffviewClose",
		"DiffviewToggleFiles",
		"DiffviewFocusFiles",
		"DiffviewRefresh",
		"DiffviewFileHistory",
	},
	-- keys = {
	--   { "<leader>dv", "<cmd>DiffviewOpen<CR>", desc = "Open diffview" },
	--   { "<leader>dc", "<cmd>DiffviewClose<CR>", desc = "Close diffview" },
	--   { "<leader>dh", "<cmd>DiffviewFileHistory %<CR>", desc = "File history (current file)" },
	--   { "<leader>dH", "<cmd>DiffviewFileHistory<CR>", desc = "File history (all)" },
	-- },
	after = function()
		require("diffview").setup()
	end,
}
