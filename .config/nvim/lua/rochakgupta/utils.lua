local M = {}

function M.get_project_root()
  local dir = vim.fs.dirname(vim.fs.find({ '.git' }, { path = vim.fn.expand('%:p:h'), upward = true })[1])
  if not dir then
    M.notify_warn('Project root not found')
    return
  end

  return dir
end

function M.get_project_name()
  local dir = M.get_project_root()
  if not dir then
    return
  end

  local path = vim.split(dir, '/', { trimempty = true })
  local name = path[#path]

  return name
end

function M.is_table_value(tbl, value)
  for _, v in ipairs(tbl) do
    if v == value then
      return true
    end
  end
  return false
end

function M.split(string, separator)
  local tbl = {}
  for str in string.gmatch(string, '[^' .. separator .. ']+') do
    table.insert(tbl, str)
  end
  return tbl
end

function M.has_prefix(str, prefix)
  return str:sub(1, #prefix) == prefix
end

function M.has_suffix(str, suffix)
  return str:sub(-#suffix) == suffix
end

function M.notify_warn(message)
  M.notify(message, vim.log.levels.WARN)
end

function M.notify_debug(message)
  M.notify(message, vim.log.levels.DEBUG)
end

function M.notify(message, level)
  if level >= vim.g.rg_log_level then
    vim.notify(message, level)
  end
end

return M
