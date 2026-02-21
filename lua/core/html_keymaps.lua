local keymap = vim.keymap.set
local opt = { silent = true }

keymap("v", "bb", 'c<strong><C-r>"</strong><Esc>', opt)
keymap("v", "bbb", 'c<b><C-r>"</b><Esc>', opt)
keymap("v", "ii", 'c<em><C-r>"</em><Esc>', opt)
keymap("v", "iii", 'c<i><C-r>"</i><Esc>', opt)
keymap("v", "pp", 'c<p><C-r>"</p><Esc>', opt)
keymap("v", "ddd", 'c<div><CR><C-r>"<CR></div><Esc>', opt)

for i = 1, 6 do
	keymap("v", "s" .. i, "c<h" .. i .. '><C-r>"</h' .. i .. "><Esc>", opt)
end

keymap("v", "s2t", 'c<h2 class="title"><C-r>"</h2><Esc>', opt)
keymap("v", "sd", 'c<div class=""><CR><C-r>"<CR></div><Esc>', opt)
keymap("v", "si", 'c<img src="images/<C-r>"" alt="" title=""><Esc>', opt)
keymap("v", "sil", 'c<img src="images/<C-r>"" alt="" title="" class="iPop-img"><Esc>', opt)
keymap("v", "siv", 'c<img src="images/<C-r>"" alt="" title="" class="iPop-video"><Esc>', opt)
keymap("v", "sp", 'c<span><C-r>"</span><Esc>', opt)
keymap("v", "su", 'c<ul><CR><C-r>"<CR></ul><Esc>=`[', opt)
keymap("v", "sl", 'c<li><C-r>"</li><Esc>', opt)
keymap("v", "sq", "<Esc>`>a»<Esc>`<i«<Esc>", opt)
keymap("v", "se", 'c<section><CR><C-r>"<CR></section><Esc>', opt)
keymap("v", "sec", 'c<section class="main"><CR><C-r>"<CR></section><Esc>', opt)
keymap("v", "spc", 'c<span class=""><C-r>"</span><Esc>', opt)
keymap("v", "ss", 'c<!-- <C-r>" --><Esc>', opt)
keymap("v", "sc", 'c/*<C-r>"*/<Esc>', opt)
keymap("v", "sx", 'c/*-------------------- <C-r>" --------------------*/<Esc>', opt)

keymap("v", "det", 'c<details><summary>Заголовок</summary><CR><C-r>"<CR></details><Esc>', opt)
keymap("v", "sum", "c<details><summary><C-r></summary><CR></details><Esc>", opt)

keymap("v", "sa", 'c<a href=""><C-r>"</a><Esc>F"i', opt)
keymap("v", "s@", 'c<a href="mailto:<C-r>"">mailto:<C-r>"</a><Esc>', opt)

-- WEB LINKS

keymap("v", "sa", 'c<a href=""><C-r>"</a><Esc>?href<CR>f"l', opt)
keymap("v", "saa", 'c<a href="<C-r>""><C-r>"</a><Esc>', opt)
keymap("v", "sat", 'c<a href="" target="_blank" rel="nofollow"><C-r>"</a><Esc>?href<CR>f"l', opt)
keymap("v", "saat", 'c<a href="https://<C-r>"" target="_blank" rel="nofollow"><C-r>"</a><Esc>', opt)
keymap("v", "st", 'c<a href="tel:<C-r>=substitute(@", "[ -]", "", "g")<CR>"><C-r>"</a><Esc>', opt)
--
-- Это режим "i" (Insert)
keymap("i", "<C-Enter>", "<br>", opt)
keymap("i", "<C-CR>", "<br>", opt) -- дубль для надежности
keymap("i", "\\a", '<a id="" class="anchor"></a><Esc>F"i', opt)
keymap("i", "\\<Space>", "&nbsp;", opt)
keymap("i", "\\i", 'id=""<Left>', opt)
keymap("i", "\\c", 'class=""<Left>', opt)
keymap("i", "\\w", "width:;<Left>", opt)
keymap("i", "\\h", "height:;<Left>", opt)
keymap("i", "\\l", "<hr>", opt)
keymap("i", "\\v", "var(--);<Left><Left>", opt)
keymap("i", "\\-", "–", opt)
keymap("i", "\\ve", "?v=0.0.1", opt)
keymap("i", "\\ff", "color: #fff;", opt)
keymap("i", "\\b", "border: 1px solid #ddd;", opt)
keymap("i", "\\1", "!important", opt)
keymap("i", "\\fw", "font-weight: bold;", opt)
keymap("i", "\\bg", "background: transparent url(../images/) no-repeat center;", opt)

keymap("i", "\\sh", "#!/bin/bash", opt)
keymap("i", "\\py", "#!/usr/bin/env python3<CR># -*- coding: utf-8 -*-", opt)
keymap("i", "\\s", '<style type="text/css"> </style><Esc>F<i', opt)
keymap("i", "\\j", '<script type="text/javascript" src="js"> </script><Esc>F"i', opt)
keymap("i", "\\css", '<link rel="stylesheet" href="css/ProTo.min.css?v=0.0.1">', opt)
