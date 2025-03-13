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
        command = os.getenv("HOME") .. "/.local/share/nvim/mason/bin/debugpy-adapter",
        args = {"--port", "${port}"},
    }
}

dap.adapters.debugpy = {
    type = 'server',
    port = "${port}",
    executable = {
        command = os.getenv("HOME") .. "/.local/share/nvim/mason/bin/codelldb",
        args = {"--port", "${port}"},
    }
}

dap.adapters["pwa-node"] = {
  type = "server",
  host = "localhost",
  port = "${port}",
  executable = {
    command = "node",
    args = {os.getenv("HOME") .. "/.local/share/nvim/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js", "${port}"},
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

dap.configurations.python = {
  {
    -- The first three options are required by nvim-dap
    type = 'python'; -- the type here established the link to the adapter definition: `dap.adapters.python`
    request = 'launch';
    name = "Launch file";

    -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

    program = "${file}"; -- This configuration will launch the current file if used.
    pythonPath = function()
      -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
      -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
      -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
      local cwd = vim.fn.getcwd()
      if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
        return cwd .. '/venv/bin/python'
      elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
        return cwd .. '/.venv/bin/python'
      else
        return '/usr/bin/python'
      end
    end;
  },
}

dap.configurations.javascript = {
  {
    type = "pwa-node",
    request = "launch",
    name = "Launch file",
    program = "${file}",
    cwd = "${workspaceFolder}",
  },
}

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
