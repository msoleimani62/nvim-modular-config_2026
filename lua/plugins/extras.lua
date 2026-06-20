-- =====================
-- پلاگین‌های پیشرفته
-- =====================
return {

    -- treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        event = { "BufReadPost", "BufNewFile" },
        dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects",
            "nvim-treesitter/nvim-treesitter-context",
        },
        config = function()
            local ok, configs = pcall(require, "nvim-treesitter.configs")
            if not ok then
                vim.notify("nvim-treesitter not ready", vim.log.levels.WARN)
                return
            end
            configs.setup({
                ensure_installed = {
                    "lua", "python", "bash", "json", "yaml",
                    "vim", "vimdoc", "markdown", "markdown_inline", "query",
                },
                sync_install = false,
                auto_install = true,
                highlight = { enable = true },
                indent = { enable = true },
                incremental_selection = { enable = true },
                textobjects = {
                    select = {
                        enable = true,
                        lookahead = true,
                        keymaps = {
                            ["af"] = "@function.outer",
                            ["if"] = "@function.inner",
                            ["ac"] = "@class.outer",
                            ["ic"] = "@class.inner",
                            ["as"] = "@scope.outer",
                        },
                    },
                    move = {
                        enable = true,
                        set_jumps = true,
                        goto_next_start     = { ["]f"] = "@function.outer", ["]c"] = "@class.outer" },
                        goto_previous_start = { ["[f"] = "@function.outer", ["[c"] = "@class.outer" },
                    },
                },
            })
        end,
    },

    -- treesitter-context -- نمایش context بالای صفحه
    {
        "nvim-treesitter/nvim-treesitter-context",
        event = "BufReadPost",
        opts = {
            enable = true,
            max_lines = 3,
            trim_scope = "outer",
        },
    },

    -- trouble -- لیست خطاها و diagnostics
    {
        "folke/trouble.nvim",
        cmd = "Trouble",
        keys = {
            { "<leader>xx", "<cmd>Trouble diagnostics toggle<CR>",       desc = "Diagnostics" },
            { "<leader>xt", "<cmd>Trouble todo toggle<CR>",              desc = "Todo List" },
            { "<leader>xr", "<cmd>Trouble lsp_references toggle<CR>",    desc = "LSP References" },
            { "<leader>xs", "<cmd>Trouble symbols toggle<CR>",           desc = "Symbols" },
        },
        config = function()
            require("trouble").setup({
                position = "bottom",
                height = 15,
                padding = false,
            })
        end,
    },

    -- todo-comments
    {
        "folke/todo-comments.nvim",
        event = "VeryLazy",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("todo-comments").setup()
            vim.keymap.set("n", "<leader>td", "<cmd>TodoTelescope<CR>", { desc = "Todo Comments" })
            vim.keymap.set("n", "]t", function() require("todo-comments").jump_next() end, { desc = "Next Todo" })
            vim.keymap.set("n", "[t", function() require("todo-comments").jump_prev() end, { desc = "Prev Todo" })
        end,
    },
}
