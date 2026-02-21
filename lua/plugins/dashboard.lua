-- lua/plugins/dashboard.lua (ПОДХОД "С ЧИСТОГО ЛИСТА")

return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	config = function()
		local alpha = require("alpha")
		-- Мы все еще используем dashboard, но только для одной удобной функции
		-- которая создает кнопку: dashboard.button(...)
		local dashboard = require("alpha.themes.dashboard")

		-- Создаем нашу конфигурацию с нуля. Это просто таблица.
		local config = {
			-- layout - это массив "виджетов", которые мы хотим отобразить
			layout = {},
			-- opts - это общие настройки
			opts = {
				-- Убираем сообщение "No information available" внизу
				-- Это эквивалент `set shortmess+=I` для буфера alpha
				nx = 200,
			},
		}

		-- 1. Определяем виджет ШАПКИ (HEADER)
		-- Это виджет типа 'text'. Он просто отображает строки текста.
		local header = {
			type = "text",
			val = {
				"       /██ /████████ /██      ",
				"      | ██|_____ ██ | ██      ",
				"  /███████     /██/ | ███████ ",
				" /██__  ██    /██/  | ██__  ██",
				"| ██  | ██   /██/   | ██  \\ ██",
				"| ██  | ██  /██/    | ██  | ██",
				"|  ███████ /████████| ███████/",
				" \\_______/|________/|_______/",
			},
			opts = {
				hl = "Type", -- Группа подсветки
				position = "center", -- Расположение
			},
		}

		-- 2. Определяем виджет КНОПОК (BUTTONS)
		-- Это виджет типа 'group', он группирует другие элементы.
		local buttons = {
			type = "group",
			val = {
				-- А вот здесь мы используем удобную функцию из темы dashboard
				dashboard.button("e", "  Новый файл", ":ene <BAR> startinsert <CR>"),
				dashboard.button("f", "  Найти файл", ":Telescope find_files <CR>"),
				dashboard.button("r", "  Недавние файлы", ":Telescope oldfiles <CR>"),
				dashboard.button("c", "  Конфигурация", ":e $MYVIMRC <CR>"),
				dashboard.button("q", "  Выход", ":qa<CR>"),
			},
			opts = {
				spacing = 1, -- Добавим немного "воздуха" между кнопками
			},
		}

		-- 3. Определяем виджет ПОДВАЛА (FOOTER)
		local footer = {
			type = "text",
			val = require("alpha.fortune")(), -- Сразу вызываем функцию, чтобы получить текст
			opts = {
				hl = "Comment",
				position = "center",
			},
		}

		-- 4. Собираем наш layout из готовых виджетов
		-- Просто перечисляем их в том порядке, в котором хотим видеть
		config.layout = {
			{ type = "padding", val = 5 }, -- Виджет "отступ" для красоты
			header,
			{ type = "padding", val = 2 },
			buttons,
			{ type = "padding", val = 2 },
			footer,
		}

		-- 5. Запускаем alpha с нашей новой, чистой и правильной конфигурацией
		alpha.setup(config)
	end,
	dependencies = { "nvim-tree/nvim-web-devicons" },
}
