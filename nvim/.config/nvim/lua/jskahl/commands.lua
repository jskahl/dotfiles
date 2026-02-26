-- Open error in line
vim.api.nvim_create_user_command('Diagnostics',function()
  pcall(function()
    vim.fn.Preserve("exec 'lua vim.diagnostic.open_float()'")
  end)
end,{})
