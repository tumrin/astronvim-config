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
      inlay_hints = true, -- enable/disable inlay hints on start
      signature_help = true,
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
      vtsls = {
        settings = {
          vtsls = {
            experimental = {
              completion = {
                enableServerSideFuzzyMatch = true,
              },
            },
            tsserver = {
              maxTsServerMemory = 8192,
            },
          },
        },
      },
      rust_analyzer = {
        settings = {
          ["rust-analyzer"] = {
            check = {
              command = "clippy",
              extraArgs = { "--no-deps" },
            },
            cargo = {
              extraEnv = { CARGO_PROFILE_RUST_ANALYZER_INHERITS = "dev" },
              extraArgs = { "--profile", "rust-analyzer" },
              features = "all",
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
    },
    servers = { "gdscript", "gdshader_lsp" },
    handlers = {
      gdscript = function() require("lspconfig").gdscript.setup {} end,
      gdshader_lsp = function() require("lspconfig").gdshader_lsp.setup {} end,
    },
  },
}
