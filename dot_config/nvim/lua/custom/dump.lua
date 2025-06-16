local function read_file_lines(filename)
  local lines = {}
  local file, err = io.open(filename, "r")
  if not file then
    return nil, err
  end

  for line in file:lines() do
    table.insert(lines, line)
  end

  file:close()
  return lines
end

local function indent_code(code, indent_level)
  indent_level = indent_level or 1
  local indent_str = string.rep(" ", indent_level * 2)
  local lines = string.gmatch(code, "[^\r\n]+") -- Split into lines
  local indented_lines = {}
  for line in lines do
    table.insert(indented_lines, indent_str .. line)
  end
  return table.concat(indented_lines, "\n")
end

local function cat_function(func)
  local info = debug.getinfo(func)
  if not info or not info.source or info.what ~= "Lua" then
    return "Source unavailable"
  end

  local filename = info.source:sub(2) -- Remove the leading '@'
  local start_line = info.linedefined
  local end_line = info.lastlinedefined

  if start_line == -1 or end_line == -1 then
    return "Line information unavailable"
  end

  local lines, err = read_file_lines(filename)
  if not lines then
    return "Error reading file: " .. err
  end

  if start_line > #lines or end_line > #lines then
    return "Function definition outside of file bounds"
  end

  local function_code = table.concat(
    { table.unpack(lines, start_line, end_line) },
    "\n"
  )

  return function_code
end

local function dump(obj, indent_level, key_prefix)
  indent_level = indent_level or 0
  key_prefix = key_prefix or ""

  local indent = string.rep(" ", indent_level * 2)

  if type(obj) == "table" then
    for k, v in pairs(obj) do
      local key_str = tostring(k)
      local prefixed_key = key_prefix .. key_str

      if type(v) == "table" then
        vim.api.nvim_echo({ { indent .. prefixed_key ..
        " = table", "Normal" } }, true, {})
        dump(v, indent_level + 1, prefixed_key .. ".")
      elseif type(v) == "function" then
        local func_code = indent_code(cat_function(v), indent_level + 1)
        vim.api.nvim_echo({ { indent .. prefixed_key .. " = \n" ..
        func_code, "Normal" } }, true, {})
      else
        local value_str = vim.inspect(v)
        vim.api.nvim_echo({ { indent .. prefixed_key .. " = " ..
        value_str, "Normal" } }, true, {})
      end
    end
  else
    local value_str = vim.inspect(obj)
    vim.api.nvim_echo({ { indent .. key_prefix .. " = " .. value_str,
      "Normal" } }, true, {})
  end
end

_G.dump = dump
