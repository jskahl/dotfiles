-- Java ftplugin: starts jdtls for each Java buffer ---------------------------

-- Load jdtls (plugin must be installed: mfussenegger/nvim-jdtls)
local ok, jdtls = pcall(require, "jdtls")
if not ok then
  vim.notify("nvim-jdtls plugin not found. Install 'mfussenegger/nvim-jdtls'.", vim.log.levels.ERROR)
  return
end

-- Completion capabilities (blink.cmp or default)
local capabilities =
  (pcall(require, "blink.cmp") and require("blink.cmp").get_lsp_capabilities())
  or vim.lsp.protocol.make_client_capabilities()

-- Project root ----------------------------------------------------------------
local root_markers = { "mvnw", "gradlew", "pom.xml", "build.gradle", ".git" }
local root_dir = jdtls.setup.find_root(root_markers) or vim.fn.getcwd()

-- Per-project workspace dir ---------------------------------------------------
local home = vim.fn.expand("~")
local project_name = vim.fn.fnamemodify(root_dir, ":p:h:t")
local workspace_dir = home .. "/.local/share/eclipse/" .. project_name

-- Find jdtls binary -----------------------------------------------------------
local mason_jdtls = vim.fn.stdpath("data") .. "/mason/bin/jdtls"
local cmd = nil

if vim.fn.executable(mason_jdtls) == 1 then
  cmd = mason_jdtls
elseif vim.fn.executable("jdtls") == 1 then
  cmd = "jdtls"
else
  vim.notify("jdtls binary not found (install via Mason: :Mason → jdtls).", vim.log.levels.ERROR)
  return
end

-- Optional debug bundles (empty by default) ----------------------------------
local bundles = {}

-- Config ----------------------------------------------------------------------
local config = {
  cmd = { cmd, "-data", workspace_dir },
  root_dir = root_dir,
  capabilities = capabilities,

  init_options = {
    bundles = bundles,
  },

  settings = {
    java = {
      format = { enabled = true },
      errors = { incompleteClasspath = { severity = "warning" } },
    },
  },

  on_attach = function(client, bufnr)
    -- Enable formatting only if the server supports it
    if client.server_capabilities.documentFormattingProvider then
      vim.api.nvim_buf_set_option(bufnr, "formatexpr", "v:lua.vim.lsp.formatexpr()")
    end

    -- Keymaps -----------------------------------------------------------------
    local map = function(mode, lhs, rhs)
      vim.keymap.set(mode, lhs, rhs, { buffer = bufnr })
    end

    map("n", "K", vim.lsp.buf.hover)
    map("n", "<leader>gd", vim.lsp.buf.definition)
    map("n", "<leader>gr", vim.lsp.buf.references)
    map("n", "<leader>gi", vim.lsp.buf.implementation)
    map("n", "<leader>rn", vim.lsp.buf.rename)
    map("n", "<leader>ca", vim.lsp.buf.code_action)
    map("n", "<leader>fm", function() vim.lsp.buf.format({ async = true }) end)

    -- JDTLS-specific actions ---------------------------------------------------
    map("n", "<leader>oi", jdtls.organize_imports)
    map("n", "<leader>tc", jdtls.test_class)
    map("n", "<leader>tn", jdtls.test_nearest_method)
  end,
}

-- Start or attach -------------------------------------------------------------
jdtls.start_or_attach(config)

