-- =====================
-- ابزارهای توسعه
-- =====================
return {

    -- formatter
    {
        "stevearc/conform.nvim",
        event = { "BufWritePre" },
        cmd = "ConformInfo",
        keys = {
            { "<leader>f", function() require("conform").format({ async = true }) end, desc = "Format File" },
        },
        config = function()
            require("conform").setup({
                formatters_by_ft = {
                    python = { "black" },
                    lua    = { "stylua" },
                    sh     = { "shfmt" },
                    bash   = { "shfmt" },
                },
                format_on_save = {
                    timeout_ms = 500,
                    lsp_fallback = true,
                },
            })
        end,
    },

    -- linter
    {
        "mfussenegger/nvim-lint",
        event = { "BufReadPost", "BufWritePost" },
        config = function()
            local lint = require("lint")
            lint.linters_by_ft = {
                python = { "flake8" },
                sh     = { "shellcheck" },
                bash   = { "shellcheck" },
            }
            vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost" }, {
                callback = function()
                    lint.try_lint()
                end,
            })
        end,
    },

    -- toggleterm -- ترمینال داخلی
    {
        "akinsho/toggleterm.nvim",
        keys = {
            { [[<C-\>]], desc = "Toggle Terminal" },
            { "<leader>tf", "<cmd>ToggleTerm direction=float<CR>",      desc = "Float Terminal" },
            { "<leader>th", "<cmd>ToggleTerm direction=horizontal<CR>", desc = "Horizontal Terminal" },
            { "<leader>tv", "<cmd>ToggleTerm direction=vertical<CR>",   desc = "Vertical Terminal" },
        },
        config = function()
            require("toggleterm").setup({
                open_mapping = [[<C-\>]],
                direction = "horizontal",
                size = 15,
                shade_terminals = false,
                persist_mode = true,
            })
        end,
    },
}
