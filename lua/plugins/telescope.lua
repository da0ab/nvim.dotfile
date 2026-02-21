return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.6",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local builtin = require("telescope.builtin")
		-- Назначаем клавиши
		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Найти файлы" })
		vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Поиск по содержимому" })

		-- А вот и то, что тебе нужно!
		vim.keymap.set("n", "<leader>fo", builtin.oldfiles, { desc = "Найти в недавних файлах" })
	end,
}
