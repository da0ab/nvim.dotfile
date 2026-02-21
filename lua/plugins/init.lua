-- ~/.config/nvim/lua/plugins/init.lua

local plugins = {}

local plugins_path = vim.fn.stdpath("config") .. "/lua/plugins/"

-- 1. Получаем путь к файлам в виде одной строки
local plugin_files_str = vim.fn.globpath(plugins_path .. "*.lua", true, false)

-- 2. Надежно разделяем эту строку на список (таблицу) по символу переноса строки
for _, file_path in ipairs(vim.fn.split(plugin_files_str, "\n")) do
  -- Проверяем, что путь не пустой (на случай, если папка пуста)
  if file_path ~= "" then
    local file_name = vim.fn.fnamemodify(file_path, ":t:r")

    if file_name ~= "init" then
      local module_name = "plugins." .. file_name
      table.insert(plugins, require(module_name))
    end
  end
end

return plugins

