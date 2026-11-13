-- ~/.config/nvim/init.lua

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

vim.opt.mouse = "a"
vim.opt.clipboard = "unnamed,unnamedplus"
vim.keymap.set('v', '<LeftRelease>', '"*ygv', { desc = "Copy on mouse release" })

vim.opt.relativenumber = true
vim.opt.statuscolumn = "%#LineNr#%{v:lnum} %#CursorLineNr#%{v:relnum?v:relnum:''} "                 
vim.api.nvim_set_hl(0, "LineNr", { fg = "#4C566A" })


require("core.options")
require("core.keymaps")
require("core.html_keymaps")
require("core.html_snippets")
require("core.html_wrapper")
require("lazy").setup("plugins")
--vim.cmd("colorscheme dracula")
--vim.api.nvim_set_hl(0, "Normal", { bg = "#1e1e2e" })

-- Маппинг для русского языка
local ru_to_en_upper = "ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ"
local en_upper = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
local ru_to_en_lower = "фисвуапршолдьтщзйкыегмцчня"
local en_lower = "abcdefghijklmnopqrstuvwxyz"

vim.opt.langmap = string.format("%s;%s,%s;%s", ru_to_en_upper, en_upper, ru_to_en_lower, en_lower)
