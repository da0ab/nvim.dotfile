return {
	"David-Kunz/gen.nvim",
	opts = {
		model = "html-worker", -- Используем нашу новую модель по умолчанию
		quit_map = "q",
		retry_map = "<c-r>",
		accept_map = "<c-cr>",
		host = "localhost",
		port = "11434",
		display_mode = "float", -- Или "float", как тебе удобнее
		show_prompt = false, -- Не показывать промпт, чтобы не мусорить
		show_model = false, -- Не показывать имя модели
	},
	config = function(_, opts)
		local gen = require("gen")
		gen.setup(opts)

		-- Наш упрощенный промпт. Вся сила теперь в Modelfile.
		gen.prompts["Fix_Ru"] = {
			prompt = "$text", -- Просто отдаем текст, модель сама знает, что делать
			replace = true,
			extract = false,
			model = "html-worker", -- Принудительно используем нашу модель
		}

		-- === БЫСТРАЯ КНОПКА ===
		-- Теперь в визуальном режиме нажми Leader + L (List), и оно сразу сработает
		vim.keymap.set("v", "<leader>l", ":Gen Fix_Ru<CR>", { noremap = true, silent = true })
	end,
}
