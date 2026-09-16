return {
  "jay-babu/mason-nvim-dap.nvim",
  opts = {
    handlers = {
      js = function()
        local dap = require "dap"

        dap.adapters["pwa-node"] = {
          type = "server",
          host = "localhost",
          port = "${port}",
          executable = {
            command = "js-debug-adapter",
            args = { "${port}" },
          },
        }

        for _, language in ipairs { "typescript", "javascript" } do
          dap.configurations[language] = {
            {
              type = "pwa-node",
              request = "launch",
              name = "Launch",
              program = "${file}",
              cwd = "${workspaceFolder}",
            },
            {
              type = "pwa-node",
              request = "attach",
              name = "Attach",
              processId = require("dap.utils").pick_process,
              cwd = "${workspaceFolder}",
            },
          }
        end
      end,
    },
  },
}
