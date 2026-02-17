return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    initial_mode = "normal",
    dependencies = {
        { "nvim-lua/plenary.nvim" },
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },

    config = function()
        local builtin = require("telescope.builtin")
        local telescope = require("telescope")

        -- Keymaps
        vim.keymap.set("n", "<leader>ff", builtin.find_files, {}) -- Lists files inside dir
        vim.keymap.set("n", "<leader>fg", builtin.git_files, {}) -- Lists only git files inside dir
        vim.keymap.set("n", "<leader><leader>", builtin.buffers, {}) -- Lists current opened buffers
        vim.keymap.set("n", "<leader>fc", function()
            builtin.find_files({ cwd = vim.fn.stdpath("config") }) -- Lists NeoVim config's files
        end)
        vim.keymap.set("n", "<leader>fw", function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") }) -- Lists files by string inside file
        end)

        telescope.setup({
            defaults = {
                -- Visual
                borderchars = {
                    prompt = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
                    results = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
                    preview = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
                },
                initial_mode = "normal",
            },
        })
    end,
}
