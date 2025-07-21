local M = {}

M.non_filetypes = {
  'Navbuddy',
  'NvimTree',
  'floaterm',
  'oil',
  'qf',
  'snacks_layout_box',
  'snacks_picker_list',
}

function M.delete_non_filetypes_buffers()
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if M.is_table_value(M.non_filetypes, vim.bo[buf].filetype) then
      vim.api.nvim_buf_delete(buf, { force = true })
    end
  end
end

function M.delete_buffers_without_files()
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if not M.is_table_value(M.non_filetypes, vim.bo[buf].filetype) then
      local filename = vim.api.nvim_buf_get_name(buf)
      if filename == '' or vim.fn.filereadable(filename) == 0 then
        vim.api.nvim_buf_delete(buf, { force = true })
      end
    end
  end
end

function M.delete_buffers_outside_cwd()
  local cwd = vim.fn.getcwd()
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if not M.is_table_value(M.non_filetypes, vim.bo[buf].filetype) then
      local bufname = vim.api.nvim_buf_get_name(buf)
      local bufpath = vim.fn.fnamemodify(bufname, ':p:h')
      if not vim.startswith(bufpath, cwd) then
        vim.api.nvim_buf_delete(buf, { force = true })
      end
    end
  end
end

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

function M.get_table_keys(tbl)
  keys = {}
  for k, _ in pairs(tbl) do
    table.insert(keys, k)
  end
  return keys
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
