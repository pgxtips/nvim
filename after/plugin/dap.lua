local dap = require("dap")
local dapui = require("dapui")

-- adapter setup
dap.adapters.php = {
  type = "executable",
  command = "node",
  args = { os.getenv("HOME") .. "/vscode-php-debug/out/phpDebug.js" }
}

dap.adapters.codelldb = {
    type = 'server',
    port = "${port}",
    executable = {
        command = os.getenv("HOME") .. "/.local/share/nvim/mason/bin/codelldb",
        args = {"--port", "${port}"},
    }
}

-- adapter configurations
dap.configurations.php = {
  {
    type = "php",
    request = "launch",
    name = "Listen for XDebug",
    port = 9003,
    pathMappings = {
      ["/var/app/backend"] = "${workspaceFolder}/app/backend",
      ["/var/www"] = "${workspaceFolder}/app/frontend",
    }
  }
}

dap.configurations.c = {
    {
        name = "Launch file",
        type = "codelldb",
        request = "launch",
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
    },
}

dap.configurations.cpp = dap.configurations.c
dap.configurations.rust = dap.configurations.c

-- setup dap ui
dapui.setup({})

-- Keybinds
-- dap
vim.keymap.set("n", "<leader>dc", function() dap.continue() end)
vim.keymap.set("n", "<leader>db", function() dap.toggle_breakpoint() end)
vim.keymap.set("n", "<leader>dn", function() dap.step_over() end)
vim.keymap.set("n", "<leader>dq", function() dap.terminate() end)

-- dapui
dap.listeners.before.launch.dapui_config = function()
    vim.keymap.set("n", "K", function() dapui.eval() end, { desc = "DAP Eval" })
end

dap.listeners.before.event_exited.dapui_config = function()
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end)
end
