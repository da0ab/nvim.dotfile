-- Словарь сниппетов.
local my_snippets = {
	["textarea"] = '<textarea rows="3" placeholder=""></textarea>',
	["input"] = '<input type="text" placeholder="">',
	["radio"] = '<input type="radio">',
	["checkbox"] = '<input type="checkbox">',
	["media phone"] = [[/*phone*/
@media (max-width: 769px) {

}]],
	["media pad"] = [[/*pad*/
@media (min-width: 769px) and (max-width: 1024px) {

}]],
	["media pad portrait"] = [[/*pad portrait*/
@media (min-width : 768px) and (max-width: 1024px) and (orientation: portrait) {

}]],
	["media notebook"] = [[/*notebook*/
@media only screen and (max-width: 1650px) {

}]],
	["media square"] = [[/*square*/
@media screen and (min-width: 1025px) and (max-width: 1400px) {

}]],
	["text-shadow"] = "text-shadow: 0 0 10px #d1d1d1",
	["colspan"] = 'colspan="2"',
	["rowspan"] = 'rowspan="2"',
	["copy"] = "©",
	["seo"] = [[<meta name="description" content="">
<meta name="keywords" content="">
<meta name="author" content="">
<meta name="copyright" lang="ru" content="">
<meta name="robots" content="all">]],
	["html5"] = [[<!DOCTYPE html>
<html lang="ru">
<head>
 <meta charset="utf-8">
 <meta name="viewport" content="width=device-width, initial-scale=1">
 <meta name="format-detection" content="telephone=no">
 <link rel="stylesheet" href="css/ProTo.min.css?v=0.0.1">
 <title></title>
</head>
<body>

 <script type="text/javascript" src="js/vendor.min.js?v=0.0.1"></script>
 <script type="text/javascript" src="js/ProTo.min.js?v=0.0.1"></script>
</body>
</html>]],
	["html mini"] = [[<!DOCTYPE html>
<html lang="ru">
<head>
 <meta charset="utf-8">
 <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1.0, user-scalable=no">
 <title></title>
</head>
<body>

</body>
</html>]],
	["webkit"] = "-webkit-",
	["version"] = "?v=0.0.1",
	["cover"] = "background-size: cover",
}

-- Функция выбора и вставки
local function select_snippet()
	local keys = vim.tbl_keys(my_snippets)
	table.sort(keys) -- Сортируем список по алфавиту

	vim.ui.select(keys, {
		prompt = "Вставка сниппета:",
		format_item = function(item)
			-- Можно добавить описание, если нужно, но пока просто ключ
			return item
		end,
	}, function(choice)
		if not choice then
			return
		end -- Если нажали Esc

		local content = my_snippets[choice]

		-- Разбиваем текст на строки для корректной вставки
		local lines = vim.split(content, "\n")

		-- Вставляем текст (c = charwise, true = follow cursor, true = paste)
		vim.api.nvim_put(lines, "c", true, true)

		-- ЛОГИКА КУРСОРА:
		-- Если это media-запрос (многострочный блок с {}),
		-- поднимаемся на строку вверх и идем в конец (внутрь скобок)
		if choice:match("^media") then
			vim.cmd("normal! k$")
		end
	end)
end

-- В Insert режиме сначала выходим (<C-o>), чтобы меню не глючило
vim.keymap.set("n", "<leader>0", select_snippet, { desc = "Выбрать сниппет" })
vim.keymap.set(
	"i",
	"<leader>0",
	"<C-o><cmd>lua require('your_module_name').select_snippet()<CR>",
	{ callback = select_snippet, desc = "Выбрать сниппет" }
)
