return {
  "ThePrimeagen/99",
  config = function()
    local _99 = require("99")

    _99.setup({
      provider = _99.Providers.OpenCodeProvider,

      -- optional
      model = "github-copilot/gpt-5.2-codex",

      logger = {
        level = _99.DEBUG,
        path = "/tmp/99.debug",
        print_on_error = true,
      },

      tmp_dir = "./tmp",

      md_files = {
        "AGENT.md",
        "CONTEXT.md",
      },
    })

    -- Keymaps
    vim.keymap.set("n", "<leader>9s", _99.search)
    vim.keymap.set("v", "<leader>9v", _99.visual)
    vim.keymap.set("n", "<leader>9x", _99.stop_all_requests)
  end,
}
