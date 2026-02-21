-- mik-theme.lua

-- 1. Защита от повторной загрузки (стандартная практика)
if vim.g.colors_name then
	vim.cmd.hi("clear")
end

-- 2. Установка имени темы (обязательно!)
vim.g.colors_name = "mik-theme"

-- 3. Палитра: все наши "банки с краской" в одном месте
local p = {
	black = "#1e1e2e",
	white = "#cdd6f4",
	red = "#f38ba8",
	green = "#a6e3a1",
	yellow = "#f9e2af",
	blue = "#89b4fa",
	magenta = "#cba6f7",
	cyan = "#89dceb",
	gray = "#585b70",
	light_gray = "#6c7086",
	bg = "#1e1e2e", -- Фон
	fg = "#cdd6f4", -- Передний план (текст)
	surface = "#313244", -- <-- НАШ НОВЫY ЦВЕТ ДЛЯ ФОНА СТРОКИ
}

-- 4. Удобная функция-помощник, чтобы не писать много кода
-- Она просто вызывает стандартную функцию Neovim для установки подсветки
local function hl(group, opts)
	vim.api.nvim_set_hl(0, group, opts)
end

-- 5. Самое главное: Группы подсветки
-- Мы говорим Neovim, какую "банку" для чего использовать
hl("CursorLine", { bg = p.surface, fg = "NONE" }) -- Фон для всей строки курсора
hl("CursorLineNr", { fg = p.yellow, bg = p.surface, bold = true }) -- Яркий номер на строке курсора
-- Основы интерфейса
hl("Normal", { fg = p.fg, bg = p.bg })
hl("LineNr", { fg = p.gray })
hl("CursorLine", { bg = p.light_gray, fg = "NONE" }) -- NONE значит не менять
hl("SignColumn", { fg = p.gray, bg = p.bg })

-- Основы синтаксиса
hl("Comment", { fg = p.gray, italic = true })
hl("Constant", { fg = p.magenta })
hl("String", { fg = p.green })
hl("Number", { fg = p.yellow })
hl("Function", { fg = p.blue })
hl("Keyword", { fg = p.red, bold = true })
hl("Type", { fg = p.cyan })
hl("Variable", { fg = p.white })

-- Поддержка Treesitter (современный парсер)
-- Названия групп часто начинаются с @
hl("@keyword", { fg = p.red })
hl("@function", { fg = p.blue })
hl("@string", { fg = p.green })
hl("@comment", { fg = p.gray, italic = true })
hl("@variable", { fg = p.white })
hl("@parameter", { fg = p.yellow, italic = true })
hl("@tag", { fg = p.cyan })

-- И так далее...
