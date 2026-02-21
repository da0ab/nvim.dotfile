local M = {}

-- Настройки отступов
local SHIFT = vim.fn.shiftwidth()
local INDENT_STR = string.rep(" ", SHIFT)

-- 1. Парсинг строки ввода
local function parse_input(input_str)
	if not input_str or input_str == "" then
		return nil
	end

	local parts = vim.split(input_str, " ", { trimempty = true })
	if #parts == 0 then
		return nil
	end

	local opts = {
		tag = parts[1],
		classes = {},
		id = nil,
		attrs = {},
		clean = false,
		anchor = false,
		target_blank = false,
	}

	for i = 2, #parts do
		local p = parts[i]
		if p:sub(1, 1) == "." then
			table.insert(opts.classes, p:sub(2))
		elseif p:sub(1, 1) == "#" then
			opts.id = p:sub(2)
		elseif p == "_blank" then
			opts.target_blank = true
		elseif p == "-c" then
			opts.clean = true
		elseif p == "-a" then
			opts.anchor = true
		end
	end
	return opts
end

-- Вспомогательная: очистка от HTML тегов
local function strip_tags(text)
	return text:gsub("</?[^>]+>", "")
end

-- 2. Генерация открывающего/закрывающего тега
local function build_tags(opts, content_for_href)
	local attr_str = ""

	-- Классы
	if #opts.classes > 0 then
		attr_str = attr_str .. string.format(' class="%s"', table.concat(opts.classes, " "))
	end
	-- ID
	if opts.id then
		attr_str = attr_str .. string.format(' id="%s"', opts.id)
	end
	-- Спец. логика для флага -a (href = content)
	if opts.tag == "a" then
		if opts.anchor and content_for_href then
			local href = content_for_href:gsub("^%s*", ""):gsub("%s*$", "")
			attr_str = attr_str .. string.format(' href="%s"', href)
		end
		if opts.target_blank then
			attr_str = attr_str .. ' target="_blank"'
		end
	end

	return string.format("<%s%s>", opts.tag, attr_str), string.format("</%s>", opts.tag)
end

-- 3. Обработка одного блока текста
local function process_block(block_lines, opts)
	if #block_lines == 0 then
		return {}
	end

	local base_indent = block_lines[1]:match("^%s*") or ""

	if opts.clean then
		for k, v in ipairs(block_lines) do
			block_lines[k] = strip_tags(v)
		end
	end

	local result_lines = {}

	if opts.tag == "ul" or opts.tag == "ol" then
		table.insert(result_lines, base_indent .. opts.open_tag)
		local indent_str = string.rep(" ", vim.o.shiftwidth)

		for _, line in ipairs(block_lines) do
			local content = line:match("^%s*(.-)%s*$")
			if content ~= "" then
				table.insert(result_lines, base_indent .. indent_str .. "<li>" .. content .. "</li>")
			end
		end
		table.insert(result_lines, base_indent .. opts.close_tag)
	else
		table.insert(result_lines, base_indent .. opts.open_tag)
		local indent_str = string.rep(" ", vim.o.shiftwidth)

		for _, line in ipairs(block_lines) do
			if line == "" then
				table.insert(result_lines, "")
			else
				table.insert(result_lines, indent_str .. line)
			end
		end
		table.insert(result_lines, base_indent .. opts.close_tag)
	end

	return result_lines
end

-- 4. Основная функция-обертка
local function wrap_selection()
	local start_pos = vim.fn.getpos("'<")
	local end_pos = vim.fn.getpos("'>")

	local start_row = start_pos[2] - 1
	local end_row = end_pos[2]

	local lines = vim.api.nvim_buf_get_lines(0, start_row, end_row, false)
	if #lines == 0 then
		return
	end

	vim.ui.input({ prompt = "Tag (e.g. div .class, ul -c): " }, function(input)
		if not input or input == "" then
			return
		end

		local opts = parse_input(input)
		if not opts then
			return
		end

		local new_lines = {}
		local current_block = {}

		local function flush()
			if #current_block > 0 then
				if opts.tag == "a" and opts.anchor then
					local href_content = current_block[1]:match("^%s*(.-)%s*$")
					local open_tag, close_tag = build_tags(opts, href_content)
					opts.open_tag = open_tag
					opts.close_tag = close_tag
				else
					local open_tag, close_tag = build_tags(opts, nil)
					opts.open_tag = open_tag
					opts.close_tag = close_tag
				end

				local processed = process_block(current_block, opts)
				for _, pl in ipairs(processed) do
					table.insert(new_lines, pl)
				end
				current_block = {}
			end
		end

		for _, line in ipairs(lines) do
			if line:match("^%s*$") then
				flush()
				table.insert(new_lines, line)
			else
				table.insert(current_block, line)
			end
		end
		flush()

		vim.api.nvim_buf_set_lines(0, start_row, end_row, false, new_lines)
		vim.cmd("nohlsearch")
	end)
end

vim.keymap.set("v", "<leader>m", wrap_selection, { desc = "Wrap selection with HTML tag" })

return M
