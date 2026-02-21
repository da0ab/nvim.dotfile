local keymap = vim.keymap.set
local opt = { silent = true }
-- Навигация по вкладкам
keymap("n", "<S-l>", ":tabnext<CR>", { desc = "Следующая вкладка", silent = true })
keymap("n", "<S-h>", ":tabprevious<CR>", { desc = "Предыдущая вкладка", silent = true })
-- Навигация по сплитам
keymap("n", "<C-h>", "<C-w>h", { desc = "Перейти в сплит влево", silent = true })
keymap("n", "<C-j>", "<C-w>j", { desc = "Перейти в сплит вниз", silent = true })
keymap("n", "<C-k>", "<C-w>k", { desc = "Перейти в сплит вверх", silent = true })
keymap("n", "<C-l>", "<C-w>l", { desc = "Перейти в сплит вправо", silent = true })
-- Быстрое создание сплитов
keymap(
	"n",
	"<leader>sv",
	"<cmd>vnew<cr>",
	{ desc = "Создать вертикальный сплит", silent = true }
)
keymap(
	"n",
	"<leader>sh",
	"<cmd>new<cr>",
	{ desc = "Создать горизонтальный сплит", silent = true }
)
keymap("n", "<C-d>", "yyP", { desc = "Дублировать строку", silent = true })
keymap("i", "<C-d>", "<Esc>yyPgi", { desc = "Дублировать строку (из Insert)", silent = true })
keymap("v", "<C-d>", "yP", { desc = "Дублировать выделение", silent = true })
-- Двойное нажатие на лидер (<leader><leader>) для PageDown.
keymap("n", "<leader>j", "<PageDown>", { desc = "Прокрутка вниз (PageDown)", silent = true })
keymap("n", "<leader>k", "<PageUp>", { desc = "Прокрутка вверх (PageUp)", silent = true })
--Терминал в новом сплите
keymap( "n", "<leader>st", "<cmd>vsplit | terminal<cr>", { desc = "Терминал в верт сплите", silent = true })

-- Выделить все (Ctrl+a)
keymap("n", "<C-a>", "ggVG", { desc = "Select All" })
keymap("i", "<C-a>", "<Esc>ggVG", { desc = "Select All" })

keymap("n", "<leader>2", "^vg_", opt)
keymap("i", "<leader>2", "<Esc>^vg_", opt)

--  Сохранить файл (работает во всех режимах без предварительного Esc)
keymap({ "n", "i", "v" }, "<F1>", function()
	if vim.fn.mode() == "i" then
		vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc><cmd>w!<CR>", true, false, true), "n", true)
	elseif vim.fn.mode() == "v" or vim.fn.mode() == "V" or vim.fn.mode() == "\22" then
		vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc><cmd>w!<CR>", true, false, true), "n", true)
	else
		vim.cmd("w!")
	end
end, { desc = "Сохранить файл!", silent = true })
keymap({ "n", "i", "v" }, "<leader>s", "<Esc><cmd>w!<CR>", { desc = "Сохранить файл!", silent = true })

-- F3: Выделить ВНУТРИ тега
keymap({ "n", "i", "v" }, "<leader>3", function()
	if vim.fn.mode() == "i" then
		vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-O>vit", true, false, true), "n", true)
	elseif vim.fn.mode() == "v" or vim.fn.mode() == "V" or vim.fn.mode() == "\22" then
		vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>vit", true, false, true), "n", true)
	else
		vim.api.nvim_feedkeys("vit", "n", true)
	end
end, { desc = "Выделить ВНУТРИ тега", silent = true })
-- F4: Выделить тег ПОЛНОСТЬЮ
keymap({ "n", "i", "v" }, "<leader>4", function()
	if vim.fn.mode() == "i" then
		vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-O>vat", true, false, true), "n", true)
	elseif vim.fn.mode() == "v" or vim.fn.mode() == "V" or vim.fn.mode() == "\22" then
		vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>vat", true, false, true), "n", true)
	else
		vim.api.nvim_feedkeys("vat", "n", true)
	end
end, { desc = "Выделить тег ПОЛНОСТЬЮ", silent = true })

--  Удалить все пустые строки
keymap({ "n", "i", "v" }, "<leader>5", function()
	if vim.fn.mode() == "i" then
		vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>:g/^\\s*$/d<CR>", true, false, true), "n", true)
	elseif vim.fn.mode() == "v" or vim.fn.mode() == "V" or vim.fn.mode() == "\22" then
		vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>:g/^\\s*$/d<CR>", true, false, true), "n", true)
	else
		vim.cmd("g/^\\s*$/d")
	end
end, { desc = "Удалить все пустые строки", silent = true })
--  Схлопнуть пустые строки
keymap({ "n", "i", "v" }, "<leader>6", function()
	if vim.fn.mode() == "i" then
		vim.api.nvim_feedkeys(
			vim.api.nvim_replace_termcodes("<Esc>:g/^\\n\\{2,}/d<CR>:noh<CR>", true, false, true),
			"n",
			true
		)
	elseif vim.fn.mode() == "v" or vim.fn.mode() == "V" or vim.fn.mode() == "\22" then
		vim.api.nvim_feedkeys(
			vim.api.nvim_replace_termcodes("<Esc>:g/^\\n\\{2,}/d<CR>:noh<CR>", true, false, true),
			"n",
			true
		)
	else
		vim.cmd("g/^\\n\\{2,}/d")
		vim.cmd("noh")
	end
end, { desc = "Схлопнуть пустые строки (оставить одну)", silent = true })

