local dap = require('dap')
local utils = require('utils')
require'nvim-dap-virtual-text'.setup()

-- Adapter Definition
if utils.getOS() == 'Linux' then
  dap.adapters.cppdbg = {
    id = 'cppdbg',
    type = 'executable',
    command = '~/dev/setup/c/extension/debugAdapters/bin/OpenDebugAD7'
  }
  dap.configurations.cpp = {
    {
      name = "Launch File",
      type = "cppdbg",
      request = "launch",
      program = function()
        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '\\', 'file')
      end,
      cwd = '${workspaceFolder}',
      stopOnEntry = false,
    },
    {
      name = "Attach to gdbserver :1234",
      type = "cppdbg",
      request = "launch",
      MIMode = 'gdb',
      miDebuggerServerAddress = 'localhost:1234',
      miDebuggerPath = '/usr/bin/gdb',
      cwd = '${workspaceFolder}',
      program = function()
        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '\\', 'file')
      end,
    },
  }
elseif utils.getOS() == 'Windows' then
  dap.adapters.lldb = {
    type = 'executable',
    command = 'D:/Code/Compilers/LLVM/bin/lldb-vscode.exe',
    name = 'lldb'
  }
  dap.adapters.python = {
    type = 'executable';
    command = 'path/to/virtualenvs/debugpy/bin/python';
    args = { '-m', 'debugpy.adapter' };
  }
  dap.configurations.cpp = {
    {
      name = "Launch lldb",
      type = "lldb",
      request = "launch",
      program = function()
        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '\\', 'file')
      end,
      cwd = '${workspaceFolder}',
      stopOnEntry = false,
      args = {},
      runInTerminal = false,
    },
  }

  dap.configurations.python = {
    {
      type = 'python'; -- the type here established the link to the adapter definition: `dap.adapters.python`
      request = 'launch';
      name = "Launch file";
      program = "${file}"; -- This configuration will launch the current file if used.
      pythonPath = function()
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
end


require('dapui').setup()
