return {
	"MagicDuck/grug-far.nvim",
	-- Указываем, для каких типов файлов мы хотим активировать этот плагин
	-- и его горячие клавиши. Добавь сюда те типы, с которыми ты работаешь.
	ft = { "htm", "html", "css", "markdown" },
	-- Убираем секцию `keys` и вместо нее добавляем `config`
	config = function()
		-- Создаем назначения клавиш с помощью стандартной функции Neovim
		local keymap = vim.keymap.set

		-- Назначение для нормального режима
		keymap("n", "<leader>sr", function()
			require("grug-far").open()
		end, {
			noremap = true,
			silent = true,
			buffer = true, -- <-- Вот она, магия! Клавиши только для текущего буфера.
			desc = "Найти и Заменить (GrugFar)",
		})

		-- Назначение для визуального режима
		keymap("v", "<leader>sR", function()
			require("grug-far").open_visual()
		end, {
			noremap = true,
			silent = true,
			buffer = true, -- <-- И здесь тоже.
			desc = "Найти и Заменить выделенное (GrugFar)",
		})
	end,
}
