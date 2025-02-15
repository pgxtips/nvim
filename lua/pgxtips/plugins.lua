return {
    -- the colorscheme should be available when starting Neovim
    {
        "rebelot/kanagawa.nvim",
        name = "kanagawa",
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
    },

    -- picker 
    {
        "nvim-telescope/telescope.nvim",
        lazy = false,
        priority = 100,
        dependencies = {
            "nvim-lua/plenary.nvim",
        }
    },

    -- syntax highlighting 
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        priority = 100,
        build = ":TSUpdate",
    },

    -- language server plugins
    {
        "neovim/nvim-lspconfig",

        lazy = false,
        priority = 100,
        dependencies = {
            -- mason used for installing and managing language servers
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
        },
    },

    -- for auto completion
    -- so this is an interesting one, so the sources of the completion 
    -- are from various places, nvim-cmp (neovim auto complete) is able
    -- to select from things like: nvim-lsp, path and words from the buffer.
    -- It is required to have in-editor autocomplete pop up, it is 
    -- the interface that provides the completion.
    {
        'hrsh7th/nvim-cmp',
        priority = 100,
        dependencies = {
            "neovim/nvim-lspconfig", -- neovims lsp is required (duh)
            "hrsh7th/cmp-nvim-lsp", -- lsp completion interface
            "hrsh7th/cmp-buffer",  -- words from buffer interface
            "hrsh7th/cmp-path",  -- path finder interface 
        },
    },

    -- diagonstics interface (avoid using telescope for diagonistcs)
    {
        "folke/trouble.nvim",
        priority = 100,
        lazy = false,
        opts = {}, -- for default options, refer to the configuration section for custom setup.
        cmd = "Trouble",
    },

    -- git integration (create commits, resolve conflicts, etc.)
    {
        "tpope/vim-fugitive",
        priority = 100,
        lazy=false,
    },

    -- debug adapter (focus point of the year, want to mainly debug via debuggers)
    -- obviously cant forget about println debugging though xD
    {
        "mfussenegger/nvim-dap",
        priority = 100,
        lazy=false,
        dependencies={
            "nvim-neotest/nvim-nio",
            "rcarriga/nvim-dap-ui"
        }
    },

}
