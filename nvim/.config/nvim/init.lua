require("jskahl.remap")
require("jskahl.set")
require("jskahl.lazy")
require("theme")



if vim.env.NVIM_LISTEN_ADDRESS == nil or vim.env.NVIM_LISTEN_ADDRESS == "" then
  local socket = "/tmp/nvim-" .. vim.fn.getpid()
  vim.env.NVIM_LISTEN_ADDRESS = socket
end

