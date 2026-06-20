-- =====================
-- ابزارهای ویرایش و ناوبری
-- =====================
return {

    -- file tree
    {
        "nvim-tree/nvim-tree.lua",
        cmd = { "NvimTreeToggle", "NvimTreeFocus" },
        keys = {
            { "<leader>t", "<cmd>NvimTreeToggle<CR>", desc = "File Tree" },
        },
        config = function()
            require("nvim-tree").setup({
                view = { width = 30 },
                filters = { dotfiles = false },
                renderer = {
                    icons = { show = { file = false, folder = false, folder_arrow = true } },
                },
            })
        end,
    },

    -- telescope
    {
        "nvim-telescope/telescope.nvim",
        cmd = "Telescope",
        dependencies = { "nvim-lua/plenary.nvim" },
        keys = {
            { "<leader>ff", "<cmd>Telescope find_files<CR>",  desc = "Find Files" },
            { "<leader>fg", "<cmd>Telescope live_grep<CR>",   desc = "Live Grep" },
            { "<leader>fb", "<cmd>Telescope buffers<CR>",     desc = "Buffers" },
            { "<leader>fh", "<cmd>Telescope help_tags<CR>",   desc = "Help Tags" },
            { "<leader>fr", "<cmd>Telescope oldfiles<CR>",    desc = "Recent Files" },
        },
        config = function()
            require("telescope").setup({
                defaults = {
                    layout_strategy = "horizontal",
                    layout_config = { preview_width = 0.55 },
                },
            })
        end,
    },

    -- flash -- پریدن سریع به هر جای صفحه
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        keys = {
            { "<leader>h", mode = { "n", "x", "o" }, function() require("flash").jump() end,         desc = "Flash Jump" },
            { "<leader>l", mode = { "n", "o" },       function() require("flash").jump({ search = { forward = false } }) end, desc = "Flash Backward" },
            { "<leader>c", mode = { "n", "o", "x" }, function() require("flash").treesitter() end,  desc = "Flash Treesitter" },
        },
    },

    -- surround
    {
        "kylechui/nvim-surround",
        event = { "BufReadPost", "BufNewFile" },
        config = function()
            require("nvim-surround").setup()
        end,
    },

    -- marks
    {
        "chentoast/marks.nvim",
        event = { "BufReadPost", "BufNewFile" },
        config = function()
            require("marks").setup()
        end,
    },

    -- autopairs
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("nvim-autopairs").setup()
        end,
    },

    -- comment
    {
        "numToStr/Comment.nvim",
        event = { "BufReadPost", "BufNewFile" },
        config = function()
            require("Comment").setup()
        end,
    },

    -- mini.ai -- textobjects قدرتمند
    {
        "echasnovski/mini.ai",
        event = "VeryLazy",
        config = function()
            require("mini.ai").setup({ n_lines = 500 })
        end,
    },

    -- gitsigns
    {
        "lewis6991/gitsigns.nvim",
        event = { "BufReadPost", "BufNewFile" },
        config = function()
            require("gitsigns").setup()
            vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>",  { desc = "Git Preview Hunk" })
            vim.keymap.set("n", "<leader>gb", ":Gitsigns blame_line<CR>",    { desc = "Git Blame Line" })
            vim.keymap.set("n", "<leader>gr", ":Gitsigns reset_hunk<CR>",    { desc = "Git Reset Hunk" })
            vim.keymap.set("n", "<leader>gs", ":Gitsigns stage_hunk<CR>",    { desc = "Git Stage Hunk" })
        end,
    },

    -- diffview
    {
        "sindrets/diffview.nvim",
        cmd = { "DiffviewOpen", "DiffviewFileHistory" },
        keys = {
            { "<leader>dv", "<cmd>DiffviewOpen<CR>",         desc = "Diffview Open" },
            { "<leader>dh", "<cmd>DiffviewFileHistory<CR>",  desc = "Diffview History" },
            { "<leader>dc", "<cmd>DiffviewClose<CR>",        desc = "Diffview Close" },
        },
        config = function()
            require("diffview").setup()
        end,
    },
}
