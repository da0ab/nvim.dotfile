return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("fzf-lua").setup()

		vim.keymap.set("n", "<leader>fz", "<cmd>FzfLua files<cr>", { silent = true, desc = "Найти файлы" })
		vim.keymap.set(
			"n",
			"<leader>fg",
			"<cmd>FzfLua live_grep<cr>",
			{ silent = true, desc = "Поиск по тексту" }
		)
		vim.keymap.set(
			"n",
			"<leader>fb",
			"<cmd>FzfLua buffers<cr>",
			{ silent = true, desc = "Открытые буферы" }
		)
		vim.keymap.set("n", "<leader>fh", "<cmd>FzfLua help_tags<cr>", { silent = true, desc = "Помощь" })
	end,
}
