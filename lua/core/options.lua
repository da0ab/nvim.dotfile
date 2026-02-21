vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = true
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.clipboard = "unnamedplus"

vim.g.mapleader = " " -- Устанавливаем <leader> на Пробел
vim.g.maplocalleader = " " -- Локальный лидер тоже на Пробел

-- -----------------------------------------------------------
-- Пробелы
-- -----------------------------------------------------------

vim.opt.expandtab = true

-- Сколько пробелов в одном отступе (для команд >>, <<)
vim.opt.shiftwidth = 2

-- Сколько пробелов отображается вместо символа таба
vim.opt.tabstop = 2

-- Сколько пробелов вставляется при нажатии Tab в режиме вставки
vim.opt.softtabstop = 4

-- -----------------------------------------------------------
-- История команд и постоянная история изменений (Undo Tree)
-- -----------------------------------------------------------

-- Увеличим историю командной строки
vim.opt.history = 1000

-- Включаем постоянную историю отмен
vim.opt.undofile = true
vim.opt.undolevels = 1000
vim.opt.undoreload = 10000

-- Указываем место для хранения файлов истории
local undodir = vim.fn.stdpath("data") .. "/undodir"
vim.opt.undodir = undodir

-- Автоматически создаем эту директорию, если ее нет
if vim.fn.isdirectory(undodir) == 0 then
	vim.fn.mkdir(undodir, "p")
end
