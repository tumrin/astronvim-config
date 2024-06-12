-- AstroLSP allows you to customize the features in AstroNvim's LSP configuration engine
-- Configuration documentation can be found with `:h astrolsp`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrolsp",
  ---@type AstroLSPOpts
  opts = {
    features = {
      autoformat = true, -- enable or disable auto formatting on start
      inlay_hints = true, -- enable/disable inlay hints on start
    },
    formatting = {
      timeout_ms = 2000, -- default format timeout
    },
    mappings = {
      n = {
        grr = {
          function() require("telescope.builtin").lsp_references() end,
        },
      },
    },
    ---@diagnostic disable: missing-fields
    config = {
      ------RUST------
      rust_analyzer = {
        settings = {
          ["rust-analyzer"] = {
            check = {
              allFeatures = true,
              command = "clippy",
              extraArgs = { "--no-deps" },
            },
            cargo = {
              extraEnv = { CARGO_PROFILE_RUST_ANALYZER_INHERITS = "dev" },
              extraArgs = { "--profile", "rust-analyzer" },
            },
            procMacro = {
              ignored = {
                leptos_macro = {
                  "server",
                },
              },
            },
          },
        },
      },
      ------RUST------
    },
  },
}
