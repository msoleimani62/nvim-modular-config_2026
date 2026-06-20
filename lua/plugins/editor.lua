return {
    {
        "stevearc/oil.nvim",
        cmd = "Oil",
        keys = { { "<leader>e", "<cmd>Oil<cr>", desc = "File Explorer" } },
        opts = { delete_to_trash = true, view_options = { show_hidden = true } },
    },
    {
        "ibhagwan/fzf-lua",
        cmd = "FzfLua",
        keys = {
            { "<leader>ff", "<cmd>FzfLua files<cr>", desc = "Find Files" },
            { "<leader>fg", "<cmd>FzfLua live_grep<cr>", desc = "Live Grep" },
        },
        opts = {},
    },
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        keys = {
            { "<leader>h", mode = { "n", "x" }, function() require("flash").jump() end, desc = "Flash" },
        },
    },
}
