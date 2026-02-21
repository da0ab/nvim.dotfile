return {

	"Mofiqul/dracula.nvim",
	-- dev = true говорит lazy.nvim, что нужно использовать локальную версию
	-- Путь должен указывать на папку, куда ты клонировал свой форк
	dev = "~/.config/nvim/colors/dracula.nvim",
	lazy = false, -- Загружаем тему сразу
	priority = 1000, -- У темы должен быть высокий приоритет
	opts = {},
}
