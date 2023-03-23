print('hello from somewhere else');

vim.opt.clipboard = "unnamedplus"

if vim.fn.has("wsl") then
  vim.g.clipboard = {
    name = "win32yank-wsl",
    copy = {
      ["+"] = "win32yank.exe -i --crlf",
      ["*"] = "win32yank.exe -i --crlf",
    },
    paste = {
      ["+"] = "win32yank.exe -o --lf",
      ["*"] = "win32yank.exe -o --lf",
    },
    cache_enabled = 0,
  }
end

-- require'netrw'.setup{
--   use_devicons = true,
--   mappings = {
--     ['p'] = function(payload)
--       print('testing')
--       print(vim.inspect(payload))
--     end,
--   }
-- }
