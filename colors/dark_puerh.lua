-- ======================
-- DARK PUERH FOR NEOVIM - Pure Lua version
-- ======================
local colors = {
	bg_main = "#1e1e2e",
	my_black = "#000000",
	my_white = "#ffffff",
	my_gray_darker = "#2c313c",
	my_gray_dark = "#4d4d4d",
	my_gray = "#666666",
	my_gray_light = "#7f7f8c",
	my_gray_lighter = "#a8a8a8",
	my_gray_lightest = "#c6c6c6",
	my_purple = "#af5faf",
	my_green = "#6b8e24",
	my_green_light = "#89fb98",
	my_pale = "#A6E3A1",
	my_khaki = "#bdb76b",
	my_blue_steel = "#5f87af",
	my_blue_sky = "#75a0ff",
	my_blue = "#70b3c7",
	my_marine = "#94e2d5",
	my_red = "#ff0000",
	my_red_indian = "#cd5c5c",
	my_coral = "#ffa0a0",
	my_orange = "#FFA500",
	my_peru = "#cd853f",
	my_peach = "#fab387",
	my_gold = "#ffde9b",
	my_yellow_light = "#f0e68c",
	my_yellow = "#eeee00",
}

local function setup()
	vim.opt.termguicolors = true
	vim.opt.background = "dark"
	vim.cmd("hi clear")
	vim.g.colors_name = "dark_puerh"

	-- Основные элементы
	vim.api.nvim_set_hl(0, "Normal", { fg = colors.my_white, bg = colors.bg_main })

	-- Связи между группами
	vim.api.nvim_set_hl(0, "Terminal", { link = "Normal" })
	vim.api.nvim_set_hl(0, "LineNrAbove", { link = "LineNr" })
	vim.api.nvim_set_hl(0, "LineNrBelow", { link = "LineNr" })
	vim.api.nvim_set_hl(0, "CurSearch", { link = "Search" })
	vim.api.nvim_set_hl(0, "CursorLineFold", { link = "CursorLine" })
	vim.api.nvim_set_hl(0, "CursorLineSign", { link = "CursorLine" })
	vim.api.nvim_set_hl(0, "EndOfBuffer", { link = "NonText" })

	-- Окна/Статус
	vim.api.nvim_set_hl(0, "StatusLine", { fg = colors.my_gray_darker, bg = colors.my_gray_lightest })
	vim.api.nvim_set_hl(0, "StatusLineNC", { fg = colors.my_gray_light, bg = colors.my_gray_lightest })
	vim.api.nvim_set_hl(0, "StatusLineTerm", { fg = colors.my_gray_darker, bg = colors.my_gray_lightest })
	vim.api.nvim_set_hl(0, "StatusLineTermNC", { fg = colors.my_white, bg = colors.my_black })
	vim.api.nvim_set_hl(0, "VertSplit", { fg = colors.my_gray_darker, bg = colors.bg_main })

	-- Меню/Вкладки
	vim.api.nvim_set_hl(0, "Pmenu", { fg = colors.my_white, bg = colors.my_gray })
	vim.api.nvim_set_hl(0, "PmenuSel", { fg = colors.my_gray_darker, bg = colors.my_yellow_light })
	vim.api.nvim_set_hl(0, "PmenuSbar", { bg = colors.bg_main })
	vim.api.nvim_set_hl(0, "PmenuThumb", { bg = colors.my_gray_lightest })
	vim.api.nvim_set_hl(0, "TabLine", { fg = colors.my_gray_darker, bg = colors.my_gray_lightest })
	vim.api.nvim_set_hl(0, "TabLineFill", { bg = colors.my_gray_lightest })
	vim.api.nvim_set_hl(0, "TabLineSel", { fg = colors.my_gray_darker, bg = colors.my_yellow_light })

	-- Панели инструментов
	vim.api.nvim_set_hl(0, "ToolbarLine", { bg = colors.my_gray })
	vim.api.nvim_set_hl(0, "ToolbarButton", { fg = colors.my_gray_darker, bg = colors.my_gold, bold = true })

	-- Текст/Символы
	vim.api.nvim_set_hl(0, "NonText", { fg = colors.my_blue })
	vim.api.nvim_set_hl(0, "SpecialKey", { fg = colors.my_green_light })
	vim.api.nvim_set_hl(0, "Folded", { fg = colors.my_yellow, bg = colors.my_gray_dark })

	-- Выделение
	vim.api.nvim_set_hl(0, "Visual", { fg = colors.my_yellow_light, bg = colors.my_green })
	vim.api.nvim_set_hl(0, "VisualNOS", { fg = colors.my_yellow_light, bg = colors.my_blue })

	-- Номера строк
	vim.api.nvim_set_hl(0, "LineNr", { fg = colors.my_gray_dark })
	vim.api.nvim_set_hl(0, "FoldColumn", { fg = colors.my_gray_lighter, bg = colors.bg_main })

	-- Курсор
	vim.api.nvim_set_hl(0, "CursorLine", { bg = colors.my_gray_darker })
	vim.api.nvim_set_hl(0, "CursorColumn", { bg = colors.my_gray })
	vim.api.nvim_set_hl(0, "CursorLineNr", { fg = colors.my_orange, bg = colors.my_gray_darker, bold = true })

	-- Быстрое исправление
	vim.api.nvim_set_hl(0, "QuickFixLine", { fg = colors.my_gray_darker, bg = colors.my_yellow_light })

	-- Колонка знаков
	vim.api.nvim_set_hl(0, "SignColumn", {})

	-- Специальные стили
	vim.api.nvim_set_hl(0, "Underlined", { fg = colors.my_blue_sky, underline = true })

	-- Ошибки/Предупреждения
	vim.api.nvim_set_hl(0, "Error", { fg = colors.my_red, bg = colors.my_white, reverse = true })
	vim.api.nvim_set_hl(0, "ErrorMsg", { fg = colors.my_red, bg = colors.my_white, reverse = true })
	vim.api.nvim_set_hl(0, "ModeMsg", { fg = colors.my_gold, bold = true })
	vim.api.nvim_set_hl(0, "WarningMsg", { fg = colors.my_red_indian, bold = true })
	vim.api.nvim_set_hl(0, "MoreMsg", { fg = colors.my_green_light, bold = true })
	vim.api.nvim_set_hl(0, "Question", { fg = colors.my_pale, bold = true })
	vim.api.nvim_set_hl(0, "Todo", { fg = colors.my_red, bg = colors.my_yellow })

	-- Поиск/Совпадения
	vim.api.nvim_set_hl(0, "MatchParen", { fg = colors.my_gray_light, bg = colors.my_khaki })
	vim.api.nvim_set_hl(0, "Search", { fg = colors.my_yellow_light, bg = colors.my_gray_light })
	vim.api.nvim_set_hl(0, "IncSearch", { fg = colors.my_yellow_light, bg = colors.my_peru })
	vim.api.nvim_set_hl(0, "WildMenu", { fg = colors.my_gray_darker, bg = colors.my_yellow })

	-- Колонки
	vim.api.nvim_set_hl(0, "ColorColumn", { fg = colors.my_white, bg = colors.my_red_indian })

	-- Курсоры
	vim.api.nvim_set_hl(0, "Cursor", { fg = colors.my_gray_darker, bg = colors.my_yellow_light })
	vim.api.nvim_set_hl(0, "lCursor", { fg = colors.my_gray_darker, bg = colors.my_red })

	-- Отладка
	vim.api.nvim_set_hl(0, "debugPC", { fg = colors.my_gray, reverse = true })
	vim.api.nvim_set_hl(0, "debugBreakpoint", { fg = colors.my_coral, reverse = true })

	-- Проверка орфографии
	vim.api.nvim_set_hl(0, "SpellBad", { fg = colors.my_red_indian, undercurl = true })
	vim.api.nvim_set_hl(0, "SpellCap", { fg = colors.my_blue_sky, undercurl = true })
	vim.api.nvim_set_hl(0, "SpellLocal", { fg = colors.my_gold, undercurl = true })
	vim.api.nvim_set_hl(0, "SpellRare", { fg = colors.my_green_light, undercurl = true })

	-- Синтаксис
	vim.api.nvim_set_hl(0, "Comment", { fg = colors.my_blue })
	vim.api.nvim_set_hl(0, "Identifier", { fg = colors.my_pale })
	vim.api.nvim_set_hl(0, "Statement", { fg = colors.my_yellow_light, bold = true })
	vim.api.nvim_set_hl(0, "Constant", { fg = colors.my_coral })
	vim.api.nvim_set_hl(0, "PreProc", { fg = colors.my_red_indian })
	vim.api.nvim_set_hl(0, "Type", { fg = colors.my_khaki, bold = true })
	vim.api.nvim_set_hl(0, "Special", { fg = colors.my_gold })
	vim.api.nvim_set_hl(0, "Directory", { fg = colors.my_blue })
	vim.api.nvim_set_hl(0, "Conceal", { fg = colors.my_gray })
	vim.api.nvim_set_hl(0, "Ignore", {})
	vim.api.nvim_set_hl(0, "Title", { fg = colors.my_red_indian, bold = true })

	-- Diff
	vim.api.nvim_set_hl(0, "DiffAdd", { fg = colors.my_white, bg = colors.my_green })
	vim.api.nvim_set_hl(0, "DiffChange", { fg = colors.my_white, bg = colors.my_blue_steel })
	vim.api.nvim_set_hl(0, "DiffText", { fg = colors.my_black, bg = colors.my_gray_lightest })
	vim.api.nvim_set_hl(0, "DiffDelete", { fg = colors.my_white, bg = colors.my_purple })

	-- Tree-sitter группы
	vim.api.nvim_set_hl(0, "@comment", { link = "Comment" })
	vim.api.nvim_set_hl(0, "@variable", { link = "Identifier" })
	vim.api.nvim_set_hl(0, "@variable.builtin", { link = "PreProc" })
	vim.api.nvim_set_hl(0, "@constant", { link = "Constant" })
	vim.api.nvim_set_hl(0, "@constant.builtin", { link = "Constant" })
	vim.api.nvim_set_hl(0, "@constant.macro", { link = "PreProc" })
	vim.api.nvim_set_hl(0, "@string", { link = "Constant" })
	vim.api.nvim_set_hl(0, "@string.regex", { link = "Special" })
	vim.api.nvim_set_hl(0, "@string.escape", { link = "Special" })
	vim.api.nvim_set_hl(0, "@number", { link = "Constant" })
	vim.api.nvim_set_hl(0, "@boolean", { link = "Constant" })
	vim.api.nvim_set_hl(0, "@float", { link = "Constant" })
	vim.api.nvim_set_hl(0, "@function", { link = "Identifier" })
	vim.api.nvim_set_hl(0, "@function.builtin", { link = "PreProc" })
	vim.api.nvim_set_hl(0, "@function.macro", { link = "PreProc" })
	vim.api.nvim_set_hl(0, "@parameter", { link = "Identifier" })
	vim.api.nvim_set_hl(0, "@method", { link = "Identifier" })
	vim.api.nvim_set_hl(0, "@field", { link = "Identifier" })
	vim.api.nvim_set_hl(0, "@property", { link = "Identifier" })
	vim.api.nvim_set_hl(0, "@constructor", { link = "Type" })
	vim.api.nvim_set_hl(0, "@conditional", { link = "Statement" })
	vim.api.nvim_set_hl(0, "@repeat", { link = "Statement" })
	vim.api.nvim_set_hl(0, "@label", { link = "Statement" })
	vim.api.nvim_set_hl(0, "@operator", { link = "Statement" })
	vim.api.nvim_set_hl(0, "@keyword", { link = "Statement" })
	vim.api.nvim_set_hl(0, "@exception", { link = "Statement" })
	vim.api.nvim_set_hl(0, "@type", { link = "Type" })
	vim.api.nvim_set_hl(0, "@type.builtin", { link = "Type" })
	vim.api.nvim_set_hl(0, "@structure", { link = "Type" })
	vim.api.nvim_set_hl(0, "@include", { link = "PreProc" })
	vim.api.nvim_set_hl(0, "@annotation", { link = "PreProc" })
	vim.api.nvim_set_hl(0, "@attribute", { link = "PreProc" })
	vim.api.nvim_set_hl(0, "@namespace", { link = "Identifier" })

	vim.api.nvim_set_hl(0, "@text.title", { link = "Title" })
	vim.api.nvim_set_hl(0, "@text.literal", { link = "Constant" })
	vim.api.nvim_set_hl(0, "@text.uri", { link = "Underlined" })
	vim.api.nvim_set_hl(0, "@text.reference", { link = "Underlined" })
	vim.api.nvim_set_hl(0, "@text.strong", { link = "Statement" })
	vim.api.nvim_set_hl(0, "@text.emphasis", { link = "Comment" })
	vim.api.nvim_set_hl(0, "@text.underline", { link = "Underlined" })
	vim.api.nvim_set_hl(0, "@text.strike", { link = "Comment" })
	vim.api.nvim_set_hl(0, "@text.danger", { link = "Error" })
	vim.api.nvim_set_hl(0, "@text.warning", { link = "Todo" })
	vim.api.nvim_set_hl(0, "@text.note", { link = "Comment" })
	vim.api.nvim_set_hl(0, "@text.todo", { link = "Todo" })

	vim.api.nvim_set_hl(0, "@diff.plus", { link = "DiffAdd" })
	vim.api.nvim_set_hl(0, "@diff.minus", { link = "DiffDelete" })
	vim.api.nvim_set_hl(0, "@diff.delta", { link = "DiffChange" })

	-- LSP диагностика
	vim.api.nvim_set_hl(0, "DiagnosticError", { link = "Error" })
	vim.api.nvim_set_hl(0, "DiagnosticWarn", { link = "WarningMsg" })
	vim.api.nvim_set_hl(0, "DiagnosticInfo", { link = "Comment" })
	vim.api.nvim_set_hl(0, "DiagnosticHint", { link = "Comment" })
	vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", { link = "SpellBad" })
	vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", { link = "SpellLocal" })
	vim.api.nvim_set_hl(0, "DiagnosticUnderlineInfo", { link = "SpellCap" })
	vim.api.nvim_set_hl(0, "DiagnosticUnderlineHint", { link = "SpellRare" })

	-- LSP ссылки
	vim.api.nvim_set_hl(0, "LspReferenceText", { link = "Visual" })
	vim.api.nvim_set_hl(0, "LspReferenceRead", { link = "Visual" })
	vim.api.nvim_set_hl(0, "LspReferenceWrite", { link = "Visual" })

	-- Telescope
	vim.api.nvim_set_hl(0, "TelescopeBorder", { link = "VertSplit" })
	vim.api.nvim_set_hl(0, "TelescopeSelection", { link = "PmenuSel" })
	vim.api.nvim_set_hl(0, "TelescopeSelectionCaret", { link = "PmenuSel" })
	vim.api.nvim_set_hl(0, "TelescopeMatching", { link = "Search" })
end

return { setup = setup }
